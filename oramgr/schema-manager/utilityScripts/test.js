var dropAllObjects = require('./dropAllObjects');
var dropScript = dropAllObjects();

console.log("Drop Script");
console.log(JSON.stringify(dropScript, null, 4));

var insertInitialValues = require('./insertInitialValues');
var initValScript = insertInitialValues();

console.log("initValScript Script");
console.log(JSON.stringify(initValScript, null, 4));