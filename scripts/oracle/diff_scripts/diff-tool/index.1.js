var _ = require('lodash');
var connInfo = require('./connection_config.json');
var Table = require('cli-table');
var EzTable = require('easy-table');
var util = require('util');
var compareDimensions = require('./dimensional-compare.js');

var knexLeft = require('knex')(
    connInfo.left
);

var knexRight = require('knex')(
    connInfo.right
);

var rightSchemaName = connInfo.right.connection.user;
var leftSchemaName = connInfo.left.connection.user;

var objectCounts = {};
var dimensions = { left: [], right: [] };

console.log("Getting object counts for " + rightSchemaName);

getUserObjectCount(knexRight)
.then(function (totalObjects) {
    dimensions.right.push({objectCount: totalObjects});
    console.log(totalObjects);
    console.log("Getting object counts for " + leftSchemaName);
    return getUserObjectCount(knexLeft);
})
.then(function (totalObjects) {
    objectCounts[leftSchemaName] = totalObjects;
    console.log(totalObjects);
    dimensions.left.push({objectCount: totalObjects});
    console.log(util.inspect(dimensions));
    var compareResult = compareDimensions(dimensions.left, dimensions.right);

    console.log(util.inspect(compareResult, false, 12));
});

getUserObjectCount(knexRight)
.then(function (totalObjects) {
    dimensions.right.push({objectCount: totalObjects});
    console.log(totalObjects);
    console.log("Getting object counts for " + leftSchemaName);
    return getUserObjectCount(knexLeft);
})
.then(function (totalObjects) {
    objectCounts[leftSchemaName] = totalObjects;
    console.log(totalObjects);
    dimensions.left.push({objectCount: totalObjects});
    console.log(util.inspect(dimensions));
    var compareResult = compareDimensions(dimensions.left, dimensions.right);

    console.log(util.inspect(compareResult, false, 12));
})




function getUserObjectCount(knex){
    return knex("USER_OBJECTS")
           .count("OBJECT_ID as TOTAL")
           .then(function(result){
               return result[0]['TOTAL'];
           });
}

function getUserObjects(knex){
    return knex("USER_OBJECTS")
           .select('OBJECT_NAME', 'OBJECT_TYPE')
           .where({GENERATED: 'N', TEMPORARY: 'N'});
}