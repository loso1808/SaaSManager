process.on('SIGINT', function() {
  process.exit();
});


var connInfo = {
    user: "PNY_DOWTEST_DBO",
    password: "master#0503",
    connectString: "localhost/ORCL"
};

// var connInfo = {
//     user: "PNY_RC_1_8_0_DBO",
//     password: "LAOWopOPvIDRHTvqe",
//     connectString: "localhost/ORCL"
// };

// "rc_180": {
//         "client": "strong-oracle",
//         "connection": {
//             "host": "localhost",
//             "database": "ORCL",
//             "password": "LAOWopOPvIDRHTvqe",
//             "user": "PNY_RC_1_8_0_DBO",
//             "pool": {
//                 "min": 0,
//                 "max": 100
//             }
//         },
//         "debug": false,
//         "acquireConnectionTimeout": 120000
//     },

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

//testSimpleOracle();

function testSimpleOracle(){
    log("Testing SimpleOracleDB");
    oracledb.getConnection(connInfo)
    .then(setConnection)
    .then(selectObjects)
    .then(log)
    .catch(log);

    function selectObjects(){
        return dbConn.query('SELECT * FROM USER_OBJECTS');
    }
}




//testExportTableDDL();

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

getTableDDL();

function getTableDDL(tableName){
    oracledb.getConnection(connInfo)
    .then(setConnection)
    .then(getUserObjects)
    .then(generateObjectDDL)
    .then(outputCombinedDDL)
    .then(closeConnection)
    .then(done)
    .catch(function(err){
        log("Error occurred getting table DDL");
        log(err);
        log(err.stack);
    });
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

function generateObjectDDL(objects) {
    //log(tables);
    var combinedResult = [];
    return Promise.each(objects.rows, function(row){
        var objectName = row['OBJECT_NAME'];
        var objectType = row['OBJECT_TYPE'];
        log("Generating DDL for " + objectType + ": " + objectName);
        if(objectType === 'TABLE'){
            return getDDLforTable(objectName)
                .then(function(result){
                    combinedResult = combinedResult.concat(result);
                });
        }else if(objectType === 'SEQUENCE'){
            return getDDLforSequence(objectName)
                .then(function(result){
                    combinedResult.push(result);
                });
        }else{
            log("Object Type " + objectType + " unsupported for " + objectName);
        }
    })
    .then(function(){
        return Promise.resolve(combinedResult);
    });
}

function getDDLforTable(tableName){
    var originalDDLLines = 0;
    var combinedResult = [];
    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
                originalDDLLines = originalDDL.split(/\r\n|\n/).length;
                //log("Original DDL");
                //log(originalDDL);
                //log("Original DDL Lines: " + originalDDLLines);

                var tableDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                var terminatorIdx = tableDDL.lastIndexOf(';');

                var tableDDL = tableDDL.substr(0,terminatorIdx);
                
                if(tableName.indexOf("z_") === 0){
                    tableDDL += ' "{{LOG_TABLESPACE_NAME}}" ;\n';                
                }else{
                    tableDDL += ' "{{TABLESPACE_NAME}}" ;\n';
                }
                //log(tableDDL);
                combinedResult.push({
                    objectType: "table",
                    tableName: tableName,
                    ddl: tableDDL 
                });
           })
           .then(function(){
               return runQuery(qryTransformCommandsForTableAndConstraints());
           })
           .then(function(){             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var tableDDLwithConstraints = rows[0]["DDL"];
                //log("Table DDL with Constraints");
                //log(tableDDLwithConstraints);
                var constraintDDL = tableDDLwithConstraints.split(/\r\n|\n/).slice(originalDDLLines).join('\n');
                //log("Constraint DDL");
                //log(constraintDDL);
                constraintDDL = replaceAll(constraintDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                //log("Templated constraint DDL");
                //log(constraintDDL);

                var constraintDDLStatements = constraintDDL.split(/;\n/g);
                //log("Split constraint DDL");
                //log(constraintDDLStatements);
                constraintDDLStatements.forEach(function(statement){
                    if(statement && statement != ''){
                        if(!_.endsWith(statement, ';')) statement += ";";
                        combinedResult.push({
                            objectType: "constraint",
                            tableName: tableName,
                            ddl: statement 
                        }); 
                    }
                });
           })           
           .then(function(){
               return runQuery(qryTransformCommandsForTableAndRefConstraints());
           })
           .then(function(){             
                return runQuery(qryTableDDL(tableName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var tableDDLwithConstraints = rows[0]["DDL"];
                //log("Table DDL with Ref Constraints");
                //log(tableDDLwithConstraints);
                var constraintDDL = tableDDLwithConstraints.split(/\r\n|\n/).slice(originalDDLLines).join('\n');
                //log("Ref Constraint DDL");
                //log(constraintDDL);
                constraintDDL = replaceAll(constraintDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                //log("Templated ref constraint DDL");
                //log(constraintDDL);

                var constraintDDLStatements = constraintDDL.split(/;\n/g);
                //log("Split ref constraint DDL");
                //log(constraintDDLStatements);

                constraintDDLStatements.forEach(function(statement){
                    if(statement && statement != ''){
                        if(!_.endsWith(statement, ';')) statement += ";";
                        combinedResult.push({
                            objectType: "refConstraint",
                            tableName: tableName,
                            ddl: statement 
                        }); 
                    }
                });
           })
           .then(function(){
               return Promise.resolve(combinedResult);
           });
}

function getDDLforSequence(sequenceName){

    return runQuery(qryTransformCommandsForTableOnly())
           .then(function () {             
                return runQuery(qrySequenceDDL(sequenceName, schemaConfig.schemaName));
           })
           .then(function(result){
                var rows = result.rows || result;
                //log(result);
                var originalDDL = rows[0]["DDL"];
              
                var sequenceDDL = replaceAll(originalDDL, '"' + schemaConfig.schemaName + '".', '"{{SCHEMA_NAME}}".');
                
                //log(tableDDL);
                combinedResult = {
                    objectType: "sequence",
                    sequenceName: sequenceName,
                    ddl: sequenceDDL 
                };

                return Promise.resolve(combinedResult);
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
    if(qry.fn){
        return dbConn[qry.fn](qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT, maxRows: 10000 })
        .catch(function(err){
            log("Error running query: ");
            log(qry);
            throw err;
        });
    }

    return dbConn.execute(qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT, maxRows: 10000 })
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
    //log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}


function qryTransformCommandsForTableAndConstraints(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    //log(cmds);
    //cmds = cmds.join("; ");
    //cmds = "BEGIN " + cmds + "; END;";
    //cmds = [cmds];
    cmds = assignEmptyBindingsToCommandArray(cmds);
    return cmds;
}



function qryTransformCommandsForTableAndRefConstraints(){
    var cmds = [
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true)",
        "DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'EMIT_SCHEMA',true)"
    ];

    cmds.forEach(function(cmd, i){
        cmds[i] = "BEGIN " + cmd + "; END;";
    });
    //log(cmds);
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
        cmd: "SELECT OBJECT_NAME, OBJECT_TYPE FROM all_objects where owner = :owner and GENERATED = 'N' order by OBJECT_NAME",
        bindings: [schemaName]
    };
}

function qryTables(schemaName){
    return {
        cmd: "SELECT OBJECT_NAME TABLE_NAME FROM all_objects where owner = :owner and OBJECT_TYPE = 'TABLE' order by OBJECT_NAME",
        bindings: [schemaName]
    };
}

function qryTableDDL(tableName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('TABLE',:tableName,:schemaName) DDL from dual",
        bindings: [tableName, schemaName]
    };
}

function qrySequenceDDL(sequenceName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('SEQUENCE',:sequenceName,:schemaName) DDL from dual",
        bindings: [sequenceName, schemaName]
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

function outputCombinedDDL(combinedDDL){
    log(combinedDDL);
    var strScript = "";
    log('\n\n----- DDL for ' + schemaConfig.schemaName + ' ------');

    //output sequences
    log('\n\n----- Sequences ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'sequence'){
            log(item.ddl);
        }
    });

    //output tables
    log('\n\n----- Tables ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'table'){
            log(item.ddl);
        }
    });

    //output indexes

    //output Constraints
    log('\n\n----- Table Constraints ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'constraint'){
            log(item.ddl);
        }
    });

    //output ref Constraints
    log('\n\n----- Table Ref Constraints ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'refConstraint'){
            log(item.ddl);
        }
    });

    //output functions

    //output synonyms
}

function replaceAll(target, search, replacement){
    return target.replace(new RegExp(escapeRegExp(search), 'g'), replacement);

    function escapeRegExp(str) {
        return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"); // $& means the whole matched string
    }
}