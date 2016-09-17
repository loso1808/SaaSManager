var replaceAll = require('./replaceAll');
var QueryRunner = require('./queryRunner');
var _ = require('lodash');
var qryTransformCommandsForTableOnly = require('./qryTransformCommandsForTableOnly');


module.exports = function(dbConn, schemaName, indexName, opts){
    
    var combinedResult = {};
    var runQuery = QueryRunner(dbConn);
    opts = opts || {};
    var log = opts.log || function() {};

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryIndexDDL(indexName, schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var indexDDL = replaceAll(originalDDL, '"' + schemaName + '".', '"{{SCHEMA_NAME}}".');

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

    function qryIndexDDL(indexName, schemaName){
        return {
            fn: "query",
            cmd: "select dbms_metadata.get_ddl('INDEX',:indexName,:schemaName) DDL from dual",
            bindings: [indexName, schemaName]
        };
    }

}