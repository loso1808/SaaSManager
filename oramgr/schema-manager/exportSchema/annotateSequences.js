
var _ = require('lodash');
var log = require('../../logger');

module.exports =  function annotateSequences(combinedResult){

    combinedResult = _.map(combinedResult, function(item){
        if(item.objectType === 'sequence'){
            var col = findColumnUsingSequence(item.name);
            item = _.assign(item, col);
        }
         
        return item;
        
    });
    return Promise.resolve(combinedResult);

    function findColumnUsingSequence(sequenceName){
        var col = _.find(combinedResult, function(item){
            if(item.objectType === 'column'){
                return item.definition.indexOf('"' + sequenceName + '"') > -1;
            }
            return false;
        });

        col = col || {};

        return {
            tableName: col.tableName,
            columnName: col.name
        };
    }
}