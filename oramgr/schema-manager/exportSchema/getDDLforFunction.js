var replaceAll = require('./replaceAll');
var QueryRunner = require('./queryRunner');
var _ = require('lodash');

var qryTransformCommandsForTableOnly = require('./qryTransformCommandsForTableOnly');

module.exports = function(dbConn, schemaName, functionName, opts){
    
    var combinedResult = {};
    var runQuery = QueryRunner(dbConn);
    opts = opts || {};
    var log = opts.log || function() {};

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryFunctionDDL(functionName, schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var functionDDL = replaceAll(originalDDL, '"' + schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "function",
                    name: functionName,
                    ddl: functionDDL 
                };

                return Promise.resolve(combinedResult);
           });

    function qryFunctionDDL(functionName, schemaName){
        return {
            fn: "query",
            cmd: "select dbms_metadata.get_ddl('FUNCTION',:functionName,:schemaName) DDL from dual",
            bindings: [functionName, schemaName]
        };
    }

}