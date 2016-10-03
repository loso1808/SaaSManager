var settings = {};
var oracle = require('strong-oracle')(settings);
var connInfo = require('./connection_config.json');

var fs = require('fs');
var path = require('path');
var util = require('util');

var scriptContents = fs.readFileSync(path.join(__dirname, 'test1.sql'), 'utf8');

console.log("Running script:");
console.log(scriptContents);

var connectData = connInfo.left.connection;
var connection;

oracle.connect(connectData, function(err, conn) {
    connection = conn;
    if(err) { console.error(err); process.exit(); }
    console.log("Connected successfully to " + connectData.user);
    connection.execute(scriptContents, [], processResults);
});

function processResults(err, results){
    if(err) { console.error(err); process.exit(); }
    console.log(util.inspect(results, { showHidden: false, depth: 12 }));
    connection.close(); // call this when you are done with the connection
}