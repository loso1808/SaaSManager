
process.on('SIGINT', function() {
  process.exit();
});

var _ = require('lodash');
var util = require('util');
var Promise = require('bluebird');
var formatTemplatedScript = require('../generateScript/formatTemplatedScript');

var connInfo = {
    user: "PEONY_OWNER",
    password: "master#0503",
    connectString: "localhost/ORCL"
};

var exportSchema = require('./index');

exportSchema(connInfo)
.then(function(result){
    log("Received result");
    log(result);
    return Promise.resolve(result);
})
.then(outputCombinedDDL)
.then(done)
.catch(function(err){
    log("Error occurred testing export schema");
    log(err);
    log(err.stack);
    throw err;
});


function done(){
    log("Done!");
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

function outputCombinedDDL(combinedDDL){
    log(formatTemplatedScript(connInfo.user, combinedDDL));
    return Promise.resolve(combinedDDL);
}
