
var Mustache = require('mustache');
var Promise = require('bluebird');
var _ = require('lodash');

var QueryRunner = require('../exportSchema/queryRunner');

//load the oracledb library 
var oracledb = require('oracledb');
 
//load the simple oracledb 
var SimpleOracleDB = require('simple-oracledb');
 
//modify the original oracledb library 
SimpleOracleDB.extend(oracledb);

module.exports = function applySchema(schemaTemplate, schemaConfig, targetConnInfo, opts){
    opts = opts || {};
    var log = opts.log || function() {};

    log("Applying Schema");

    var dbConn;
    var runQuery;

    var templateData = {
        SCHEMA_NAME: schemaConfig.schemaOwner,
        TABLESPACE_NAME: schemaConfig.dataTablespace,
        LOG_TABLESPACE_NAME: schemaConfig.logTablespace,
        LOG_INDEX_TABLESPACE_NAME: schemaConfig.logIndexTablespace,
        INDEX_TABLESPACE_NAME: schemaConfig.indexTablespace
    };

    return oracledb.getConnection(targetConnInfo)
            .then(setConnection)
            .then(function(){
               return dropAllObjects(schemaConfig, runQuery, opts);
            })
           .then(function(){
               return createSequences(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(function(){
               return createTables(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(function(){
               return createTableIndexes(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(function(){
               return createTableConstraints(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(function(){
               return createTableRefConstraints(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(function(){
               return createFunctions(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(function(){
               return insertInitialValues(schemaConfig, schemaTemplate, runQuery, opts);
            })
            .then(closeConnection);

    function setConnection(conn) {
        dbConn = conn;
        runQuery = QueryRunner(dbConn);
    }

    function closeConnection(){
        return dbConn.close();
    }

    function dropAllObjects(schemaConfig, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};

        var generateDropAllObjects = require('../utilityScripts/dropAllObjects');
        log("Dropping all objects");
    
        var script = generateDropAllObjects(templateData);
        //log(script);

        return runQuery(script, opts);
    }

    function createAndRunQuery(item, runQuery, opts){
        var qry = {
            cmd: Mustache.render(item.ddl, templateData),
            bindings: []
        };
        log("Creating " + item.objectType + " " + item.name);
        return runQuery(qry, opts);
    }

    function createSequences(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};
        return Promise.each(schemaTemplate, function(item){
            if(item.objectType === 'sequence'){
                return createAndRunQuery(item, runQuery, opts);
            }
        });
    }    
    
    function createTables(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};        
        return Promise.each(schemaTemplate, function(item){
            if(item.objectType === 'table'){
                return createAndRunQuery(item, runQuery, opts);
            }
        });
    }

    function createTableIndexes(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};
        return Promise.each(schemaTemplate, function(item){
            if(item.objectType === 'index'){
                return createAndRunQuery(item, runQuery, opts);
            }
        });
    }

    function createTableConstraints(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};
        return Promise.each(schemaTemplate, function(item){
            if(item.objectType === 'constraint'){
                return createAndRunQuery(item, runQuery, opts);
            }
        });
    }

    function createTableRefConstraints(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};
        return Promise.each(schemaTemplate, function(item){
            if(item.objectType === 'refConstraint'){
                return createAndRunQuery(item, runQuery, opts);
            }
        });
    }

    function createFunctions(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};
        return Promise.each(schemaTemplate, function(item){
            if(item.objectType === 'function'){
                return createAndRunQuery(item, runQuery, opts);
            }
        });
    }

    function insertInitialValues(schemaConfig, schemaTemplate, runQuery, opts){
        opts = opts || {};
        var log = opts.log || function() {};

        var generateInsertInitialValues = require('../utilityScripts/insertInitialValues');
        var scripts = generateInsertInitialValues(templateData);
        
        log("Inserting initial values");
        
        return runQuery(scripts.cmds, opts);
    }
}