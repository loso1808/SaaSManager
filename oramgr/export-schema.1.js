var connInfo = {
    user: "PNY_DOWTEST_DBO",
    password: "master#0503",
    connectString: "localhost/ORCL"
};

var schemaConfig = {
    schemaName: "PNY_DOWTEST_DBO"
}

var fs = require('fs');
var path = require('path');
var util = require('util');
var async = require('async');
var _ = require('lodash');
var Promise = require('bluebird');

//load the oracledb library 
var oracledb = require('oracledb');
 
//load the simple oracledb 
var SimpleOracleDB = require('simple-oracledb');
 
//modify the original oracledb library 
SimpleOracleDB.extend(oracledb);

var dbConn;

testExportTableDDL();

function testExportTableDDL(){
    var fns = [
        getConnection,
        execTransforms,
        getTableName,
        getTableDDL,
        log,
        closeConnection,
        done
    ];
    log("Running testExportTableDDL");
    async.waterfall(fns, function(err, result){
        if(err){
            log("Error!");
            log(err);
        }else{
            log(result);
        }
    });
}

//getTableDDL();

function getTableDDL(tableName){
    oracledb.getConnection(connInfo)
    .then(setConnection)
    .then(getTables)
    .then(generateTableDDL)
    .then(log)
    .then(closeConnection)
    .then(done);
}

function setConnection(conn) {
    dbConn = conn;
}

function testGetObjects(){
    // var fns = [
    //     getConnection,
    //     execTransforms,
    //     getTableName,
    //     getTableDDL,
    //     log,
    //     closeConnection,
    //     done
    // ];
    log("Running testExportTableDDL");
    var fns = [
        getConnection,
        getUserObjects,
        logAsync,
        closeConnection,
        done
    ];
    async.waterfall(fns, function(err, result){
        if(err){
            log("Error!");
            log(err);
        }else{
            log(result);
        }
    });
}

function getConnection(cb){
    log("Getting connection");
    oracledb.getConnection(connInfo, function(err, connection){
        log("Got Connection");
        if(err){
            return cb(err);
        }
        dbConn = connection;
        cb(null);
    });
}

function generateTableDDL(tables) {
    var tableDDL = "";
    log(tables);
    return runQuery(qryTransformCommandsForTableOnly())
           .then(function (result) {                        
                return Promise.each(tables.rows, function (item) {
                    log(item);
                    var tableName = item.TABLE_NAME;
                    return runQuery(qryTableDDLNoConstraints(tableName, schemaConfig.schemaName))
                           .then(function(result){
                               log(result);
                               tableDDL += result.rows[0]["DDL"];
                           });
                           
                }, function (result) {
                    return tableDDL;
                });
           })
           .catch(function(err){
                log("Error");
                log(err);
           });
}

function execTransforms(){
    return runQuery(qryTransformCommandsForTableOnly());
}

function getTables(){
    return runQuery(qryTables(schemaConfig.schemaName));
}

function getUserObjects(){
    return runQuery(qryUserObjects(schemaConfig.schemaName));
}

function runQuery(qry){
    if(Array.isArray(qry)){
        return Promise.each(qry, function (item) {
            return runQuery(item);
        });
    }
    return dbConn.execute(qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT })
           .catch(function(err){
                log("Error running query: ");
                log(qry);
                throw err;
           });
}

function closeConnection() {
    return dbConn.close();
}

function done(){
    log("Done!");
    process.exit();
}


function qryTransformCommandsForTableOnly(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}

function assignEmptyBindingsToCommandArray(cmds){
    var cmdsWithBindings = [];
    cmds.forEach(function(item){
        cmdsWithBindings.push({
            cmd: item,
            bindings: []
        });
    });

    return cmdsWithBindings;
}

function qryUserObjects(schemaName){
    return {
        cmd: "SELECT OBJECT_NAME, OBJECT_TYPE FROM all_objects where owner = :owner",
        bindings: [schemaName]
    };
}

function qryTables(schemaName){
    return {
        cmd: "SELECT OBJECT_NAME TABLE_NAME FROM all_objects where owner = :owner and OBJECT_TYPE = 'TABLE'",
        bindings: [schemaName]
    };
}

function qryTableDDLNoConstraints(tableName, schemaName){
    return {
        cmd: "select dbms_metadata.get_ddl('TABLE',:tableName,:schemaName) DDL from dual",
        bindings: [tableName, schemaName]
    };
}

function logAsync(msg, cb){
    log(msg);
    cb(null, msg);
}

function log(msg){
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg, { showHidden: false, depth: 12 });
    }
    console.log(str);
}