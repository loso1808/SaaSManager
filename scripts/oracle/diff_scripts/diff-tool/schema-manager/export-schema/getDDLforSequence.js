var replaceAll = require('./replaceAll');
var QueryRunner = require('./queryRunner');
var _ = require('lodash');

var qrySequenceDDL = require('./qrySequenceDDL');

module.exports = function(dbConn, schemaName, sequenceName, opts){
    var originalDDLLines = 0;
    var templateDDL;
    var combinedResult = {};
    var runQuery = QueryRunner(dbConn);
    opts = opts || {};
    var log = opts.log || function() {};

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qrySequenceDDL(sequenceName, schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var sequenceDDL = replaceAll(originalDDL, '"' + schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "sequence",
                    name: sequenceName,
                    ddl: sequenceDDL 
                };

                return Promise.resolve(combinedResult);
           });
}