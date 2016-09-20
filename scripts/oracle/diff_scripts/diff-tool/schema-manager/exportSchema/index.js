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

var getUserObjects = require('./getUserObjects');
var generateObjectDDL = require('./generateObjectDDL');

module.exports = function(connInfo, opts){

    return Promise.resolve((function() {
                var dbConn;
                var schemaName = connInfo.user;
                var result;
                
                return oracledb.getConnection(connInfo)
                    .then(setConnection)
                    .then(getUserObjectsAsync)
                    .then(generateObjectDDLAsync)
                    .then(removeTerminatorFromDDL)
                    .then(closeConnection)
                    .then(returnResult)
                    .catch(function(err){
                        log("Error occurred generating DDL");
                        log(err);
                        log(err.stack);
                        throw err;
                    });

                function setConnection(conn) {
                    dbConn = conn;
                }

                function getUserObjectsAsync(){
                    log("Getting objects for schema " + schemaName);
                    return getUserObjects(dbConn, schemaName, { log: log });
                }

                function generateObjectDDLAsync(results){
                    var objects = results.rows;
                    return generateObjectDDL(dbConn, schemaName, objects, { log: log })
                           .then(function(objDDL){
                               result = objDDL;
                               return Promise.resolve(result);
                           });
                }

                function removeTerminatorFromDDL(combinedResult){
                    combinedResult.forEach(function(item, idx){
                        if(_.isString(item.ddl)){
                            var ddl = _.trim(item.ddl);
                            ddl = _.trimEnd(ddl, ';');
                            combinedResult[idx].ddl = ddl;
                        }
                    });
                    result = combinedResult;
                    return Promise.resolve(combinedResult);
                }

                function closeConnection(){
                    return dbConn.close();
                }

                function returnResult(){
                    //log("Returning result " + result.length);
                    return Promise.resolve(result);
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
            })());
}