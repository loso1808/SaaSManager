
var fs = require('fs');
var path = require('path');

module.exports = function(scriptName){
    var scriptPath = path.join(__dirname, 'self-reports', scriptName + ".sql");
    var script = fs.readFileSync(scriptPath, 'utf8');
    return script;
}