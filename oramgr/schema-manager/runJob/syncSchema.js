
var Promise = require('bluebird');
var path = require('path');
var fse = require('fs-extra');

var exportSchema = require('../exportSchema');
var applySchema = require('./applySchema');
var getSchemaConfig = require('../schemaConfig');
var testConnection = require('./testConnection');

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
    jobConfig.targetConfigEntry = targetConfigEntry;

    var schemaConfig = jobConfig.target.schemaConfig || { };
    jobConfig.target.schemaConfig = getSchemaConfig(schemaConfig);    

    var workingDirectory = jobConfig.workingDirectory || path.resolve();
    workingDirectory = path.resolve(workingDirectory);
    jobConfig.workingDirectory = workingDirectory;

    var schemaTemplatePath = jobConfig.schemaTemplatePath || "schema-template.json";
    schemaTemplatePath = path.resolve(schemaTemplatePath);
    jobConfig.schemaTemplatePath = schemaTemplatePath;


    return  testConnections(jobConfig, opts)
            .then(function(){                
                return getSchemaTemplate(jobConfig, opts)
            })
            .then(function(schemaTemplate){
                var targetConnInfo = getConnInfo(jobConfig.targetConfigEntry);
                var targetSchemaConfig = jobConfig.target.schemaConfig;
                return applySchema(schemaTemplate, targetSchemaConfig, targetConnInfo, opts);
            });
}

function testConnections(jobConfig, opts){
    opts = opts || {};
    var log = opts.log || function () { };
    var connInfo = "";

    if(!jobConfig.templateFromFile){
        log("Testing source connection");
        connInfo = getConnInfo(jobConfig.sourceConfigEntry);
        log("\t" + connInfo.user + "@" + connInfo.connectString);

        return testConnection(connInfo, opts)
               .then(function(){
                    log("Successfully connected!\n");

                    log("Testing target connection");
                    connInfo = getConnInfo(jobConfig.targetConfigEntry);
                    log("\t" + connInfo.user + "@" + connInfo.connectString);
                    
                    return testConnection(getConnInfo(jobConfig.targetConfigEntry), opts);
               })
               .then(function(){
                   log("Successfully connected!\n");
                   return Promise.resolve(true);
               });
    }else{
        log("No source connection to test. Source schema from file:\n\t" + jobConfig.schemaTemplatePath);
        log("Testing target connection");
        connInfo = getConnInfo(jobConfig.targetConfigEntry);
        log("\t" + connInfo.user + "@" + connInfo.connectString);
        return testConnection(connInfo, opts)
               .then(function(){
                   log("Successfully connected!\n");
                   return Promise.resolve(true);
               });
    }
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
        log("\t" + connInfo.user + "@" + connInfo.connectString);
        
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

    var port = conn.port || '1521';

    var connInfo = {
        user: conn.user,
        password: conn.password,
        connectString: conn.host + ":" + port + "/" + conn.database
    };

    return connInfo;
}