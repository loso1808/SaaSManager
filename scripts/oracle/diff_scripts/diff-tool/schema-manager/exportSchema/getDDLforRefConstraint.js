var replaceAll = require('./replaceAll');
var QueryRunner = require('./queryRunner');
var _ = require('lodash');
var qryTransformCommandsForTableOnly = require('./qryTransformCommandsForTableOnly');


module.exports = function(dbConn, schemaName, refConstraintName, tableName, opts){
    
    var combinedResult = {};
    var runQuery = QueryRunner(dbConn);
    opts = opts || {};
    var log = opts.log || function() {};
    
    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryRefConstraintDDL(refConstraintName, schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var refConstraintDDL = replaceAll(originalDDL, '"' + schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "refConstraint",
                    name: refConstraintName,
                    ddl: refConstraintDDL,
                    tableName: tableName
                };

                return Promise.resolve(combinedResult);
           });

    
    function qryRefConstraintDDL(refConstraintName, schemaName){
        return {
            fn: "query",
            cmd: "select dbms_metadata.get_ddl('REF_CONSTRAINT',:refConstraintName,:schemaName) DDL from dual",
            bindings: [refConstraintName, schemaName]
        };
    }
}