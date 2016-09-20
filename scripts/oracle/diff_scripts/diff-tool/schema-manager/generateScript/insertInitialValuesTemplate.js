var fse = require('fs-extra');
var path = require('path');

module.exports = function(){
     var script = fse.readFileSync(path.join(__dirname,'insertInitialValues.sql'), 'utf8');
     return script;
}