var Promise = require('bluebird');


// var getDDLforConstraint = require('./getDDLforConstraint');
// var getDDLforFunction = require('./getDDLforFunction');
// var getDDLforIndex = require('./getDDLforIndex');
// var getDDLforRefConstraint = require('./getDDLforRefConstraint');
// var getDDLforSequence = require('./getDDLforSequence');
//var getDDLforTable = require('./getDDLforTable');
var getDDLforTableWithInlineConstraints = require('./getDDLforTableWithInlineConstraints');

module.exports = function(dbConn, schemaName, objects, opts){
    opts = opts || {};
    var log = opts.log || function() {};

    var combinedResult = [];
    return Promise.each(objects, function(obj){
        var objectName = obj['OBJECT_NAME'];
        var objectType = obj['OBJECT_TYPE'];
        log("Generating DDL for " + objectType + ": " + objectName);
        if(objectType === 'TABLE'){
            return getDDLforTableWithInlineConstraints(dbConn, schemaName, objectName, opts)
                .then(function(result){
                    combinedResult = combinedResult.concat(result);
                });
        // }else if(objectType === 'SEQUENCE'){
        //     return getDDLforSequence(objectName)
        //         .then(function(result){
        //             combinedResult.push(result);
        //         });
        // }else if(objectType === 'INDEX'){
        //     return getDDLforIndex(objectName)
        //         .then(function(result){
        //             combinedResult.push(result);
        //         });
        // }else if(objectType === 'FUNCTION'){
        //     return getDDLforFunction(objectName)
        //         .then(function(result){
        //             combinedResult.push(result);
        //         });
        // }else if(objectType === 'CONSTRAINT'){
        //     return getDDLforConstraint(objectName)
        //         .then(function(result){
        //             combinedResult.push(result);
        //         });
        // }else if(objectType === 'REF_CONSTRAINT'){
        //     return getDDLforRefConstraint(objectName)
        //         .then(function(result){
        //             combinedResult.push(result);
        //         });
        }else{
            log("Object Type " + objectType + " unsupported for " + objectName);
        }
    })
    .then(function(){
        return Promise.resolve(combinedResult);
    });
}