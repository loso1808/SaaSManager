
var path = require('path');
var fse = require('fs-extra');
var log = require('../../logger');

var annotateSequences = require('./annotateSequences');

var combinedDDL = require('./schema-template.json');

annotateSequences(combinedDDL)
//.then(log)
.then(done)
.catch(function(err){
    log("Error occurred testing generate script");
    log(err);
    log(err.stack);
    throw err;
});

function done(){
    log("Done!");
    log(new Date());
    process.exit();
}
