
var insertInitialValues = require('../utilityScripts/insertInitialValues');

module.exports = function(){
     
     var qry = insertInitialValues();

     var script = "------ Insert Initial Values --------\n\n";

     qry.statements.forEach(function(stmt){
         script += stmt + ";\n";
     });

     script += "\n";
     
     return script;
}