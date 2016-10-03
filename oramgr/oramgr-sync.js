process.on('SIGINT', function() {
  process.exit();
});


var program = require('commander');
var util = require('util');
var path = require('path');
var fse = require('fs-extra');
var inquirer = require('inquirer-promise');
var Promise = require('bluebird');
var _ = require('lodash');

var runJob = require('./schema-manager/runJob');
var log = require('./logger');

function list(val){
    return val.split(',');
}

program.version('1.0.0')
       .usage('[options] <jobFile>')
       .option('-p, --print', 'Prints the job configuration with defaults')
       .parse(process.argv);

var options = { };

options.jobFile = program.args[0] || undefined;

//console.log(util.inspect(options));

parseOptions(options);

function parseOptions(options) {
    if(options.jobFile){
        if(doesFileExist(options.jobFile)){
            var jobConfig = fse.readJsonSync(path.resolve(options.jobFile));
            return runJob(jobConfig, { log: log })
                   .then(waitForExit)
                    .catch(function(err){
                        log("Error occurred testing run job");
                        log(err);
                        log(err.stack);
                        throw err;
                    });
        }else{
            console.log("Job file does not exist: " + options.jobFile);
            return waitForExit();
        }
    }else{
        console.log("Current set of options is not yet supported.");
        program.help();
    }
}

function waitForExit(){
    return inquirer.input("Press enter to exit")
                   .then(process.exit);
}

function doesFileExist(fileName) {
    try{
        var filePath = path.resolve(fileName);
        var stats = fse.lstatSync(filePath);
        return stats.isFile();
    }catch(e){ }
    
    return false;
}