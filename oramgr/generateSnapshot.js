
var generateDimensions = require('./generate-dimensions');

module.exports = function(connInfo, dependents){
    var knex = require('knex')(connInfo);

    return generateDimensions(knex, undefined, { diffSynonymDependents: dependents })
           .then(function (results) {
               return { dimensions: results.left };
           })
           .catch(function (err) {
               console.error(err);
               throw(err);
           });
}   