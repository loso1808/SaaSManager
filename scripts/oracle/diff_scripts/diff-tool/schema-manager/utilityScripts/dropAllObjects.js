var fse = require('fs-extra');
var path = require('path');

module.exports = function(){
    var dropScript = file.readFileSync(path.join(__dirname,'dropAllObjects.sql'), 'utf8');
    return function(){
        return { cmd: dropScript, bindings: [] };
    };
}