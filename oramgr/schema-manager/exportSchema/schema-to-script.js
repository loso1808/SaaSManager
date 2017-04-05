
process.on('SIGINT', function() {
  process.exit();
});

var _ = require('lodash');
var util = require('util');
var Promise = require('bluebird');
var path = require('path');
var fse = require('fs-extra');
var fs = require('fs');

//var formatTemplatedScript = require('../generateScript/formatTemplatedScript');
var generateScript = require('../generateScript');
var schemaConfig = require('../schemaConfig')({ schemaCode: 'DOCKER' });

var connInfo = {
       user: "PNY_PROD_DBO",
       password: "STdqcMM6OXAOH9sfg",
       connectString: "peony-prod.c1grsxamme4w.us-west-1.rds.amazonaws.com/ORCL"
};

//var connInfo = {
//       user: "PNY_RC_1_18_0_DBO",
//       password: "WEVUWYW1iUT6IUReX",
//       connectString: "peony-test.c1grsxamme4w.us-west-1.rds.amazonaws.com/ORCL"
//};


//var connInfo = {
//       user: "PEONY_OWNER",
//       password: "master#0503",
//       connectString: "peony-test.c1grsxamme4w.us-west-1.rds.amazonaws.com/ORCL"
//};



fs.writeFileSync(__dirname+"/schemacode.txt", connInfo.user+".sql", 'utf8');
var scratchPath = path.resolve(__dirname, '..', 'scratch', 'export_template.json');
var sqlScratchPath = path.resolve(__dirname, '..', 'scratch', 'export_schema.sql');

var exportSchema = require('./index');


log("Started At: ");
log(new Date());

exportSchemaAndGenerateScript();
//exportSchemaAndSaveToScratch();
//generateScriptFromScratch();

function exportSchemaAndSaveToScratch(){
    exportSchema(connInfo)
    .then(function(result){
        fse.outputJsonSync(scratchPath, result);
        log("Output results to: " + scratchPath);
    })
    .then(done)
    .catch(function(err){
        log("Error occurred testing export schema");
        log(err);
        log(err.stack);
        throw err;
    });
}

function generateScriptFromScratch(){
    var combinedDDL = fse.readJsonSync(scratchPath);

    //log(schemaConfig);

    outputTemplatedScript(combinedDDL)    
    .then(function(script){
        fse.outputFileSync(sqlScratchPath, script);
        return Promise.resolve(script);
    })
    .then(log)
    .then(done)
    .catch(function(err){
        log("Error occurred testing generate script");
        log(err);
        log(err.stack);
        throw err;
    });

}

function exportSchemaAndGenerateScript(){
    exportSchema(connInfo)
    .then(function(result){
        fse.outputJsonSync(scratchPath, result);
        log("Output results to: " + scratchPath);
        return Promise.resolve(result);
    })
    .then(outputTemplatedScript)   
    .then(function(script){
        fse.outputFileSync(sqlScratchPath, script);
        return Promise.resolve(script);
    })
    .then(done)
    .catch(function(err){
        log("Error occurred testing export schema");
        log(err);
        log(err.stack);
        throw err;
    });
}

function done(){
    log("Done!");
    log(new Date());
    process.exit();
}

function log(msg){
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg, { showHidden: false, depth: 12 });
    }
    console.log(str);
    //return Promise.resolve(msg);
}

function outputTemplatedScript(combinedDDL){
    log(schemaConfig);
    return Promise.resolve(generateScript(combinedDDL, schemaConfig, { noTablespace: true }));
}

// function outputCombinedDDL(combinedDDL){
//     log(formatTemplatedScript(connInfo.user, combinedDDL));
//     return Promise.resolve(combinedDDL);
// }
