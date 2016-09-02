process.on('SIGINT', function() {
  process.exit();
});


var connInfo = {
    user: "PNY_DOWTEST_DBO",
    password: "master#0503",
    connectString: "localhost/ORCL"
};

// var connInfo = {
//     user: "PNY_RC_1_8_0_DBO",
//     password: "LAOWopOPvIDRHTvqe",
//     connectString: "localhost/ORCL"
// };

// "rc_180": {
//         "client": "strong-oracle",
//         "connection": {
//             "host": "localhost",
//             "database": "ORCL",
//             "password": "LAOWopOPvIDRHTvqe",
//             "user": "PNY_RC_1_8_0_DBO",
//             "pool": {
//                 "min": 0,
//                 "max": 100
//             }
//         },
//         "debug": false,
//         "acquireConnectionTimeout": 120000
//     },

var schemaConfig = {
    schemaName: "PNY_DOWTEST_DBO"
}

var fs = require('fs');
var path = require('path');
var util = require('util');
var async = require('async');
var _ = require('lodash');
var Promise = require('bluebird');

//load the oracledb library 
var oracledb = require('oracledb');
 
//load the simple oracledb 
var SimpleOracleDB = require('simple-oracledb');
 
//modify the original oracledb library 
SimpleOracleDB.extend(oracledb);

var dbConn;

getTableDDL();

function getTableDDL(tableName){
    oracledb.getConnection(connInfo)
    .then(setConnection)
    .then(getUserObjects)
    .then(generateObjectDDL)
    .then(removeTerminatorFromDDL)
    .then(outputCombinedDDL)
    .then(closeConnection)
    .then(done)
    .catch(function(err){
        log("Error occurred getting table DDL");
        log(err);
        log(err.stack);
    });
}

function setConnection(conn) {
    dbConn = conn;
}

function generateObjectDDL(objects) {
    //log(tables);
    var combinedResult = [];
    return Promise.each(objects.rows, function(row){
        var objectName = row['OBJECT_NAME'];
        var objectType = row['OBJECT_TYPE'];
        log("Generating DDL for " + objectType + ": " + objectName);
        if(objectType === 'TABLE'){
            //return getDDLforTable(objectName)
            return getDDLforTableWithInlineConstraints(objectName)
                .then(function(result){
                    combinedResult = combinedResult.concat(result);
                });
        }else if(objectType === 'SEQUENCE'){
            return getDDLforSequence(objectName)
                .then(function(result){
                    combinedResult.push(result);
                });
        }else if(objectType === 'INDEX'){
            return getDDLforIndex(objectName)
                .then(function(result){
                    combinedResult.push(result);
                });
        }else if(objectType === 'FUNCTION'){
            return getDDLforFunction(objectName)
                .then(function(result){
                    combinedResult.push(result);
                });
        }else if(objectType === 'CONSTRAINT'){
            return getDDLforConstraint(objectName)
                .then(function(result){
                    combinedResult.push(result);
                });
        }else if(objectType === 'REF_CONSTRAINT'){
            return getDDLforRefConstraint(objectName)
                .then(function(result){
                    combinedResult.push(result);
                });
        }else{
            log("Object Type " + objectType + " unsupported for " + objectName);
        }
    })
    .then(function(){
        return Promise.resolve(combinedResult);
    });
}

function getDDLforTable(tableName){
    var originalDDLLines = 0;
    var combinedResult = [];
    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
                originalDDLLines = originalDDL.split(/\r\n|\n/).length;
                //log("Original DDL");
                //log(originalDDL);
                //log("Original DDL Lines: " + originalDDLLines);

                var tableDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                var terminatorIdx = tableDDL.lastIndexOf(';');

                var tableDDL = tableDDL.substr(0,terminatorIdx);
                
                if(tableName.indexOf("z_") === 0){
                    tableDDL += ' TABLESPACE "{{LOG_TABLESPACE_NAME}}" ;\n';                
                }else{
                    tableDDL += ' TABLESPACE "{{TABLESPACE_NAME}}" ;\n';
                }
                //log(tableDDL);
                combinedResult.push({
                    objectType: "table",
                    tableName: tableName,
                    ddl: tableDDL 
                });
           })
           .then(function(){
               return runQuery(qryTransformCommandsForTableAndConstraints());
           })
           .then(function(){             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var tableDDLwithConstraints = rows[0]["DDL"];
                //log("Table DDL with Constraints");
                //log(tableDDLwithConstraints);
                var constraintDDL = tableDDLwithConstraints.split(/\r\n|\n/).slice(originalDDLLines).join('\n');
                //log("Constraint DDL");
                //log(constraintDDL);
                constraintDDL = replaceAll(constraintDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                //log("Templated constraint DDL");
                //log(constraintDDL);

                var constraintDDLStatements = constraintDDL.split(/;\n/g);
                //log("Split constraint DDL");
                //log(constraintDDLStatements);
                constraintDDLStatements.forEach(function(statement){
                    if(statement && statement != ''){
                        if(!_.endsWith(statement, ';')) statement += ";";
                        combinedResult.push({
                            objectType: "constraint",
                            tableName: tableName,
                            ddl: statement 
                        }); 
                    }
                });
           })           
           .then(function(){
               return runQuery(qryTransformCommandsForTableAndRefConstraints());
           })
           .then(function(){             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var tableDDLwithConstraints = rows[0]["DDL"];
                //log("Table DDL with Ref Constraints");
                //log(tableDDLwithConstraints);
                var constraintDDL = tableDDLwithConstraints.split(/\r\n|\n/).slice(originalDDLLines).join('\n');
                //log("Ref Constraint DDL");
                //log(constraintDDL);
                constraintDDL = replaceAll(constraintDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                //log("Templated ref constraint DDL");
                //log(constraintDDL);

                var constraintDDLStatements = constraintDDL.split(/;\n/g);
                //log("Split ref constraint DDL");
                //log(constraintDDLStatements);

                constraintDDLStatements.forEach(function(statement){
                    if(statement && statement != ''){
                        if(!_.endsWith(statement, ';')) statement += ";";
                        combinedResult.push({
                            objectType: "refConstraint",
                            tableName: tableName,
                            ddl: statement 
                        }); 
                    }
                });
           })
           .then(function(){
               return Promise.resolve(combinedResult);
           });
}


function getDDLforTableWithInlineConstraints(tableName){
    var originalDDLLines = 0;
    var templateDDL;
    var combinedResult = [];
    return runQuery(qryTransformCommandsForTableInlineConstraints())
           .then(function () {             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
                originalDDLLines = originalDDL.split(/\r\n|\n/).length;
                //log("Original DDL");
                //log(originalDDL);
                //log("Original DDL Lines: " + originalDDLLines);

                templateDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');

           })
           .then(function(){
                return runQuery(qryColumns(schemaConfig.schemaName, tableName));
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

function getDDLforSequence(sequenceName){

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qrySequenceDDL(sequenceName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var sequenceDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "sequence",
                    name: sequenceName,
                    ddl: sequenceDDL 
                };

                return Promise.resolve(combinedResult);
           });
}

function getDDLforIndex(indexName){

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryIndexDDL(indexName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var indexDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');

                var terminatorIdx = indexDDL.lastIndexOf(';');

                indexDDL = indexDDL.substr(0,terminatorIdx);
                
                if(indexName.indexOf("z_") === 0){
                    indexDDL += ' TABLESPACE "{{LOG_INDEX_TABLESPACE_NAME}}" ;';                
                }else{
                    indexDDL += ' TABLESPACE "{{INDEX_TABLESPACE_NAME}}" ;';
                }

                
                //log(tableDDL);
                combinedResult = {
                    objectType: "index",
                    name: indexName,
                    ddl: indexDDL 
                };

                return Promise.resolve(combinedResult);
           });
}

function getDDLforFunction(functionName){

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryFunctionDDL(functionName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var functionDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "function",
                    name: functionName,
                    ddl: functionDDL 
                };

                return Promise.resolve(combinedResult);
           });
}

function getDDLforConstraint(constraintName){

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryConstraintDDL(constraintName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var constraintDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "constraint",
                    name: constraintName,
                    ddl: constraintDDL 
                };

                return Promise.resolve(combinedResult);
           });
}

function getDDLforRefConstraint(refConstraintName){

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryRefConstraintDDL(refConstraintName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var refConstraintDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "refConstraint",
                    name: refConstraintName,
                    ddl: refConstraintDDL 
                };

                return Promise.resolve(combinedResult);
           });
}

function getUserObjects(){
    return runQuery(qryUserObjects(schemaConfig.schemaName));
}

function runQuery(qry){
    if(Array.isArray(qry)){
        return Promise.each(qry, function (item) {
            return runQuery(item);
        });
    }
    if(qry.fn){
        return dbConn[qry.fn](qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT, maxRows: 10000 })
        .catch(function(err){
            log("Error running query: ");
            log(qry);
            throw err;
        });
    }

    return dbConn.execute(qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT, maxRows: 10000 })
           .catch(function(err){
                log("Error running query: ");
                log(qry);
                throw err;
           });
}

function closeConnection() {
    return dbConn.close();
}

function done(){
    log("Done!");
    process.exit();
}


function qryTransformCommandsForTableOnly(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    //log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}


function qryTransformCommandsForTableInlineConstraints(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    //log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}


function qryTransformCommandsForTableAndConstraints(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    //log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}



function qryTransformCommandsForTableAndRefConstraints(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    //log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}

function assignEmptyBindingsToCommandArray(cmds){
    var cmdsWithBindings = [];
    cmds.forEach(function(item){
        cmdsWithBindings.push({
            cmd: item,
            bindings: []
        });
    });

    return cmdsWithBindings;
}

function qryUserObjects(schemaName){
    return {
        cmd: "SELECT OBJECT_NAME, OBJECT_TYPE FROM all_objects where owner = :1 and GENERATED = 'N' " +
             "union all " +
             "select CONSTRAINT_NAME, 'CONSTRAINT' from all_constraints where CONSTRAINT_TYPE = 'C' AND owner = :2 AND (SEARCH_CONDITION_VC NOT LIKE '%IS NOT NULL%' OR SEARCH_CONDITION_VC IS NULL) " +
             "union all " +
             "select CONSTRAINT_NAME, 'CONSTRAINT' from all_constraints where CONSTRAINT_TYPE = 'P' AND owner = :3 " +
             "union all " +
             "select CONSTRAINT_NAME, 'REF_CONSTRAINT' from all_constraints where CONSTRAINT_TYPE = 'R' AND owner = :4 ",
        bindings: [schemaName, schemaName, schemaName, schemaName]
    };
}


function qryColumns(schemaName, tableName){
    return {
        cmd: "SELECT COLUMN_NAME FROM all_tab_cols where owner = :owner and TABLE_NAME = :tableName order by COLUMN_ID",
        bindings: [schemaName, tableName]
    };
}


function qryTableDDL(tableName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('TABLE',:tableName,:schemaName) DDL from dual",
        bindings: [tableName, schemaName]
    };
}

function qrySequenceDDL(sequenceName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('SEQUENCE',:sequenceName,:schemaName) DDL from dual",
        bindings: [sequenceName, schemaName]
    };
}


function qryIndexDDL(indexName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('INDEX',:indexName,:schemaName) DDL from dual",
        bindings: [indexName, schemaName]
    };
}


function qryFunctionDDL(functionName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('FUNCTION',:functionName,:schemaName) DDL from dual",
        bindings: [functionName, schemaName]
    };
}

function qryConstraintDDL(constraintName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('CONSTRAINT',:constraintName,:schemaName) DDL from dual",
        bindings: [constraintName, schemaName]
    };
}

function qryRefConstraintDDL(refConstraintName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('REF_CONSTRAINT',:refConstraintName,:schemaName) DDL from dual",
        bindings: [refConstraintName, schemaName]
    };
}



function logAsync(msg, cb){
    log(msg);
    cb(null, msg);
}

function log(msg){
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg, { showHidden: false, depth: 12 });
    }
    console.log(str);
}

function removeTerminatorFromDDL(combinedResult){
    combinedResult.forEach(function(item, idx){
        var ddl = _.trim(item.ddl);
        ddl = _.trimEnd(ddl, ';');
        combinedResult[idx].ddl = ddl;
    });

    return Promise.resolve(combinedResult);
}

function outputCombinedDDL(combinedDDL){
    //log(combinedDDL);
    var strScript = "";
    log('\n\n----- DDL for ' + schemaConfig.schemaName + ' ------');

    //output sequences
    log('\n\n----- Sequences ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'sequence'){
            log(item.ddl);
        }
    });

    //output tables
    log('\n\n----- Tables ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'table'){
            log(item.ddl);
        }
    });

    //output tables
    // log('\n\n----- Columns ------');
    // combinedDDL.forEach(function(item){
    //     if(item.objectType === 'column'){
    //         log(item.definition);
    //     }
    // });

    //output indexes
    log('\n\n----- Table Indexes ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'index'){
            log(item.ddl);
        }
    });

    //output Constraints
    log('\n\n----- Table Constraints ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'constraint'){
            log(item.ddl);
        }
    });

    //output ref Constraints
    log('\n\n----- Table Ref Constraints ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'refConstraint'){
            log(item.ddl);
        }
    });

    //output functions
    log('\n\n----- Functions ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'function'){
            log(item.ddl);
        }
    });

    //output synonyms
}

function replaceAll(target, search, replacement){
    return target.replace(new RegExp(escapeRegExp(search), 'g'), replacement);

    function escapeRegExp(str) {
        return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"); // $& means the whole matched string
    }
}