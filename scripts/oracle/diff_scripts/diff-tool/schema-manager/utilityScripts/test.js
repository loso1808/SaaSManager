var dropAllObjects = require('./dropAllObjects');
var dropScript = dropAllObjects();

console.log("Drop Script");
console.log(JSON.stringify(dropScript, null, 4));