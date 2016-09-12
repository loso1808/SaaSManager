var replaceAll = require('./replaceAll');
var QueryRunner = require('./queryRunner');
var _ = require('lodash');

var qryColumns = require('./qryColumns');
var qryTableDDL = require('./qryTableDDL');
var qryTransformCommandsForTableInlineConstraints = require('./qryTransformCommandsForTableInlineConstraints');

module.exports = function (dbConn, schemaName, tableName, opts){
    var originalDDLLines = 0;
    var templateDDL;
    var combinedResult = [];
    var runQuery = QueryRunner(dbConn);
    opts = opts || {};
    var log = opts.log || function() {};

    return runQuery(qryTransformCommandsForTableInlineConstraints())
           .then(function () {             
                return runQuery(qryTableDDL(tableName, schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
                originalDDLLines = originalDDL.split(/\r\n|\n/).length;
                //log("Original DDL");
                //log(originalDDL);
                //log("Original DDL Lines: " + originalDDLLines);

                templateDDL = replaceAll(originalDDL, '"' + schemaName + '".', '"{{SCHEMA_NAME}}".');

           })
           .then(function(){
                return runQuery(qryColumns(schemaName, tableName));
           })
           .then(function(result){
                var rows = result.rows || result;
                var tableDefs = extractDefinitions(templateDDL);
                var colDefinitions = [];

                rows.forEach(function(row){
                    var columnName = row['COLUMN_NAME'];
                    var colDef = findColumnDefinition(tableDefs, columnName);
                    if(colDef){
                        combinedResult.push({
                            objectType: "column",
                            tableName: tableName,
                            name: columnName,
                            definition: colDef,
                            ddl: {
                                add: 'ALTER TABLE "{{SCHEMA_NAME}}"."' + tableName + '" ADD (' + colDef + ')',
                                modify: 'ALTER TABLE "{{SCHEMA_NAME}}"."' + tableName + '" MODIFY (' + colDef + ')',
                                remove: 'ALTER TABLE "{{SCHEMA_NAME}}"."' + tableName + '" DROP "' + columnName + '" ',
                                rename:  'ALTER TABLE "{{SCHEMA_NAME}}"."' + tableName + '" RENAME COLUMN "' + columnName + '" TO "{{NEW_COLUMN_NAME}}"'
                            }
                        });
                        //log(colDef);
                        colDefinitions.push(colDef);
                    }else{
                        log("Can't find definition for column " + columnName + " in table " + tableName);
                    }
                });
                

                                
                var terminatorIdx = templateDDL.lastIndexOf(';');

                var tableDDL = templateDDL.substr(0,terminatorIdx);
                
                if(tableName.indexOf("z_") === 0){
                    tableDDL += ' TABLESPACE "{{LOG_TABLESPACE_NAME}}" ;\n';                
                }else{
                    tableDDL += ' TABLESPACE "{{TABLESPACE_NAME}}" ;\n';
                }

                var wrapper = extractDefinitionWrapper(tableDDL);
                var tableDDL = wrapper.intro + "\n\t" + colDefinitions.join(" ,\n\t") + "\n" + wrapper.closing; 
                //log(tableDDL);
                combinedResult.push({
                    objectType: "table",
                    name: tableName,
                    ddl: tableDDL 
                });
           })
           .then(function(){
               //log(combinedResult);
               return Promise.resolve(combinedResult);
           });

    function findColumnDefinition(defs, columnName){
        //log("Finding def for " + columnName);
        var colDef;
        var quotedColumnName = '"' + columnName + '"';
        defs.some(function(item){
            if(_.startsWith(item, quotedColumnName)){
                //log(quotedColumnName + " in " + item);
                colDef = item;
                return true;
            }
            //log(quotedColumnName + " not in " + item);
        })
        return colDef;
    }

    function extractDefinitions(tableDDL){
        var firstIdx = tableDDL.indexOf("(") + 1;
        var lastIdx = tableDDL.lastIndexOf(")");
        var defsBody = tableDDL.substr(0, lastIdx);
        defsBody = defsBody.substr(firstIdx);
        //log("Defs Body\n" + defsBody);
        var defs = defsBody.split(/,[\s]*\n/);
        //log("Defs");
        defs.forEach(function(def, idx){
            defs[idx] = _.trim(def);
        });
        //log(defs);
        return defs;
    }

    function extractDefinitionWrapper(tableDDL){
        var firstIdx = tableDDL.indexOf("(") + 1;
        var lastIdx = tableDDL.lastIndexOf(")");
        var intro = tableDDL.substr(0, firstIdx);
        var closing = tableDDL.substr(lastIdx);

        // log("Intro");
        // log(intro);
        // log("Closing");
        // log(closing);

        return {
            intro: intro,
            closing: closing
        }
    }
}
