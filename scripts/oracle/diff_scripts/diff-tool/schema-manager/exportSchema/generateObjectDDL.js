var Promise = require('bluebird');


var getDDLforConstraint = require('./getDDLforConstraint');
var getDDLforFunction = require('./getDDLforFunction');
var getDDLforIndex = require('./getDDLforIndex');
var getDDLforRefConstraint = require('./getDDLforRefConstraint');
var getDDLforSequence = require('./getDDLforSequence');
var getDDLforTableWithInlineConstraints = require('./getDDLforTableWithInlineConstraints');

module.exports = function(dbPool, schemaName, objects, opts){
    opts = opts || {};
    var log = opts.log || function() {};

    var concurrency = opts.concurrency || 1;

    var combinedResult = [];
    return Promise.map(objects, function(obj){
        return dbPool.getConnection()
               .then(function(dbConn){
                   return generateDDLforObject(dbConn, schemaName, obj, opts);
                })
                .then(function(resultsArray){
                    combinedResult = combinedResult.concat(resultsArray);

                    log("Finished DDL for " + obj['OBJECT_TYPE'] + ": " + obj['OBJECT_NAME']);
                    return Promise.resolve();
                })
                .catch(function(err){
                    log("Error occurred generating object DDL for object " + obj['OBJECT_NAME']);
                    log(err);
                    log(err.stack);
                    throw err;
                });
    }, { concurrency: concurrency })
    .then(function(){
        return Promise.resolve(combinedResult);
    })
    .catch(function(err){
        log("Error occurred generating object DDL");
        log(err);
        log(err.stack);
        throw err;
    });

    function generateDDLforObject(dbConn, schemaName, obj, opts){
        var objectName = obj['OBJECT_NAME'];
        var objectType = obj['OBJECT_TYPE'];
        var tableName = obj['TABLE_NAME'];

        log("Generating DDL for " + objectType + ": " + objectName);
        if(objectType === 'TABLE'){
            return getDDLforTableWithInlineConstraints(dbConn, schemaName, objectName, opts)
                .then(function(result){
                    return Promise.resolve(result);
                    //combinedResult = combinedResult.concat(result);
                });
        }else if(objectType === 'SEQUENCE'){
            return getDDLforSequence(dbConn, schemaName, objectName, opts)
                .then(function(result){
                    return Promise.resolve([result]);
                    //combinedResult.push(result);
                });
        }else if(objectType === 'INDEX'){
            return getDDLforIndex(dbConn, schemaName, objectName, tableName, opts)
                .then(function(result){
                    return Promise.resolve([result]);
                    //combinedResult.push(result);
                });
        }else if(objectType === 'FUNCTION'){
            return getDDLforFunction(dbConn, schemaName, objectName, opts)
                .then(function(result){
                    return Promise.resolve([result]);
                    //combinedResult.push(result);
                });
        }else if(objectType === 'CONSTRAINT'){
            return getDDLforConstraint(dbConn, schemaName, objectName, tableName, opts)
                .then(function(result){
                    return Promise.resolve([result]);
                    //combinedResult.push(result);
                });
        }else if(objectType === 'REF_CONSTRAINT'){
            return getDDLforRefConstraint(dbConn, schemaName, objectName, tableName, opts)
                .then(function(result){
                    return Promise.resolve([result]);
                    //combinedResult.push(result);
                });
        }else{
            log("Object Type " + objectType + " unsupported for " + objectName);
        }
    }
}