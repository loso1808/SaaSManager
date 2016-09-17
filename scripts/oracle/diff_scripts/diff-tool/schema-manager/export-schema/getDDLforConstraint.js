var replaceAll = require('./replaceAll');
var QueryRunner = require('./queryRunner');
var _ = require('lodash');

var qryTransformCommandsForTableOnly = require('./qryTransformCommandsForTableOnly');

module.exports = function(dbConn, schemaName, constraintName, opts){
    
    var combinedResult = {};
    var runQuery = QueryRunner(dbConn);
    opts = opts || {};
    var log = opts.log || function() {};

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryConstraintDDL(constraintName, schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var constraintDDL = replaceAll(originalDDL, '"' + schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "constraint",
                    name: constraintName,
                    ddl: constraintDDL 
                };

                return Promise.resolve(combinedResult);
           });

    function qryConstraintDDL(constraintName, schemaName){
        return {
            fn: "query",
            cmd: "select dbms_metadata.get_ddl('CONSTRAINT',:constraintName,:schemaName) DDL from dual",
            bindings: [constraintName, schemaName]
        };
    }
}