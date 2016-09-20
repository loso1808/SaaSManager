
var dropAllObjects = require('./dropAllObjectsTemplate');
var formatCombinedDDL = require('./formatTemplatedScript');
var insertInitialValues = require('./insertInitialValuesTemplate');
var applySchemaConfigToTemplate = require('./applySchemaConfigToTemplate');
var Promise = require('bluebird');

module.exports = function(combinedDDL, schemaConfig, opts){
    var templatedScript = "";

    templatedScript = dropAllObjects() + "\n\n";
    templatedScript += formatCombinedDDL(combinedDDL) + "\n\n";
    templatedScript += insertInitialValues();

    
    //return templatedScript;
    console.log(JSON.stringify(schemaConfig, null, 4));
    var sqlScript = applySchemaConfigToTemplate(templatedScript, schemaConfig);

    console.log(JSON.stringify(sqlScript, null, 4));
    return Promise.resolve(sqlScript);
}