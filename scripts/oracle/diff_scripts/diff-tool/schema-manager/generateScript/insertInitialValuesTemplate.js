var fse = require('fs-extra');
var path = require('path');

module.exports = function(){
     var script = file.readFileSync(path.join(__dirname,'insertInitialValues.sql'), 'utf8');
     return script;
}