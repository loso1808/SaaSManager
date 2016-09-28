
var dropAllObjects = require('./dropAllObjectsTemplate');
var formatCombinedDDL = require('./formatTemplatedScript');
var insertInitialValues = require('./insertInitialValuesTemplate');
var applySchemaConfigToTemplate = require('./applySchemaConfigToTemplate');
var Promise = require('bluebird');

var removeSchema = require('./removeSchema');
var removeTablespaces = require('./removeTablespaces');

module.exports = function(combinedDDL, schemaConfig, opts){
    opts = opts || {};

    var templatedScript = "";

    templatedScript = dropAllObjects() + "\n\n";
    templatedScript += formatCombinedDDL(combinedDDL) + "\n\n";
    templatedScript += insertInitialValues();

    if(opts.noSchema){
        templatedScript = removeSchema(templatedScript);
    }

    if(opts.noTablespace){
        templatedScript = removeTablespaces(templatedScript);
    }

    //return templatedScript;
    //console.log(JSON.stringify(schemaConfig, null, 4));
    var sqlScript = applySchemaConfigToTemplate(templatedScript, schemaConfig);

    //console.log(JSON.stringify(sqlScript, null, 4));
    return Promise.resolve(sqlScript);
}