var fse = require('fs-extra');
var path = require('path');

module.exports = function(){
    var dropScriptPath = path.join(__dirname,'dropAllObjects.sql');
    var dropScript = fse.readFileSync(dropScriptPath, 'utf8');
    //console.log(dropScript);
    return { cmd: dropScript, bindings: [] };
}