var fse = require('fs-extra');
var path = require('path');
var Mustache = require('mustache');

module.exports = function(templateData){
    var dropScriptPath = path.join(__dirname,'dropAllObjects.sql');
    var dropScript = fse.readFileSync(dropScriptPath, 'utf8');

    if(templateData){
        dropScript = Mustache.render(dropScript, templateData);
    }
    //console.log(dropScript);
    return { cmd: dropScript, bindings: [] };
}