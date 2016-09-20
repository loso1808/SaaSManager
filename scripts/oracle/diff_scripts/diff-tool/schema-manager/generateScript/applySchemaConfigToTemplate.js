
var Mustache = require('mustache');

module.exports = function(template, schemaConfig){
    //console.log(JSON.stringify(schemaConfig, null, 4));
    var templateData = {
        SCHEMA_NAME: schemaConfig.schemaOwner,
        TABLESPACE_NAME: schemaConfig.dataTablespace,
        LOG_TABLESPACE_NAME: schemaConfig.logTablespace,
        LOG_INDEX_TABLESPACE_NAME: schemaConfig.logIndexTablespace,
        INDEX_TABLESPACE_NAME: schemaConfig.indexTablespace
    };
    //console.log(JSON.stringify(templateData, null, 4));
    //process.exit();
    var script = Mustache.render(template, templateData);

    return script;
}