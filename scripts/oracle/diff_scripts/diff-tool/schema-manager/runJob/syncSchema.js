
var Promise = require('bluebird');
var path = require('path');
var fse = require('fs-extra');

var exportSchema = require('../exportSchema');
var applySchema = require('./applySchema');
var getSchemaConfig = require('../schemaConfig');

var connectionConfig = require('../../connection_config');


module.exports = function syncSchema(jobConfig, opts){
    opts = opts || {};
    var log = opts.log || function() {};

    if(jobConfig.source){
        var sourceConfigEntry = connectionConfig[jobConfig.source.connectionName];
        jobConfig.sourceConfigEntry = sourceConfigEntry;
        jobConfig.templateFromFile = jobConfig.templateFromFile || false;
    }else{
        jobConfig.templateFromFile = true;
    }

    jobConfig.saveTemplate = jobConfig.saveTemplate || true;
    
    var targetConfigEntry = connectionConfig[jobConfig.target.connectionName];

    var schemaConfig = jobConfig.schemaConfig;
    schemaConfig = getSchemaConfig(schemaConfig);    

    var workingDirectory = jobConfig.workingDirectory || path.resolve();
    workingDirectory = path.resolve(workingDirectory);
    jobConfig.workingDirectory = workingDirectory;

    var schemaTemplatePath = jobConfig.schemaTemplatePath || "schema-template.json";
    schemaTemplatePath = path.resolve(schemaTemplatePath);
    jobConfig.schemaTemplatePath = schemaTemplatePath;

    return getSchemaTemplate(jobConfig, opts)
            .then(function(schemaTemplate){
                var targetConnInfo = getConnInfo(targetConfigEntry);
                return applySchema(schemaTemplate, schemaConfig, targetConnInfo, opts);
            });
}

function getSchemaTemplate(jobConfig, opts) {
    opts = opts || {};
    var log = opts.log || function () { };

    if (jobConfig.templateFromFile) {
        log("Loading schema template from file: " + jobConfig.schemaTemplatePath);
        var schemaTemplate = fse.readJsonSync(jobConfig.schemaTemplatePath);
        return Promise.resolve(schemaTemplate);
    } else {
        log("Generating schema template from database:");

        var connInfo = getConnInfo(jobConfig.sourceConfigEntry);
        log(connInfo);
        
        return exportSchema(connInfo, opts)
            .then(function (schemaTemplate) {
                if (jobConfig.saveTemplate) {
                    log("Saving schema template to file: " + jobConfig.schemaTemplatePath);
                    fse.outputJsonSync(jobConfig.schemaTemplatePath, schemaTemplate);
                }
                return Promise.resolve(schemaTemplate);
            });
    }
}

function getConnInfo(configEntry){
    var conn = configEntry.connection;

    var connInfo = {
        user: conn.user,
        password: conn.password,
        connectString: conn.host + "/" + conn.database
    };

    return connInfo;
}