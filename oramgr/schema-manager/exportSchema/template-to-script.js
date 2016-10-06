
process.on('SIGINT', function() {
  process.exit();
});

var _ = require('lodash');
var util = require('util');
var Promise = require('bluebird');
var path = require('path');
var fse = require('fs-extra');

//var formatTemplatedScript = require('../generateScript/formatTemplatedScript');
var generateScript = require('../generateScript');
var schemaConfig = require('../schemaConfig')({ schemaCode: 'NEXTCUSTOMER' });


var scratchPath = path.resolve(__dirname, '..', 'scratch', 'combinedDDL.json');
var sqlScratchPath = path.resolve(__dirname, '..', 'scratch', 'schema.sql');


var exportSchema = require('./index');


log("Started At: ");
log(new Date());

generateScriptFromScratch();


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
