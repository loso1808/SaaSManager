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

//load the oracledb library 
var oracledb = require('oracledb');
 
//load the simple oracledb 
var SimpleOracleDB = require('simple-oracledb');
 
//modify the original oracledb library 
SimpleOracleDB.extend(oracledb);

var dbConn;

//testExportTableDDL();

getTableDDL();

function getTableDDL(tableName){
    oracledb.getConnection(connInfo)
    .then(setConnection)
    .then(getUserObjects)
    .then(log)
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

function getUserObjects(){
    runQuery(qryUserObjects(schemaConfig.schemaName));
}

function execQuery(qry){
    return dbConn.execute(qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT });
}

function runQuery(qry){
    log("Hello");
    dbConn.execute(qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT }, cb);
}

function closeConnection(cb) {
    dbConn.close(cb);
}

function done(){
    log("Done!");
    process.exit();
}


function qryTransformCommandsForTableOnly(){
    var cmds = [
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',false)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',true)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

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