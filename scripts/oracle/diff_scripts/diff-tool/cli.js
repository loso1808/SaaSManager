var program = require('commander');
var util = require('util');
var path = require('path');
var fse = require('fs-extra');
var inquirer = require('inquirer-promise');
var Promise = require('bluebird');
var getConnInfo = require('./getConnInfo');

var generateSnapShot = function (connInfo, dependents) {
    return Promise.resolve({ connInfo: connInfo, dependents: dependents });
};

// var getConnInfo = function (configFile, connectionNames) {
//     return [{ configFile: configFile, connectionName: connectionNames[0] },
//             { configFile: configFile, connectionName: connectionNames[1] }];
// };

function list(val){
    return val.split(',');
}

program.version('1.0.0')
       .usage('[options] <outputFile>')
       .option('-c, --config <fileName>', 'Config file with connection info (default: ./connection_config.json)')
       .option('-n, --connectionNames <name1, name2>', 'Names of connections to use from config file (default: "left","right")', list)
       .option('-f, --compareSnapshot <fileName>', 'Filename of the snapshot to compare to')
       .option('-s, --snapshot', 'Take a snapshot of database')
       .option('-x, --hash', 'Generate hash for database')
       .option('-d, --dependents', 'Check and compare objects that synonyms depend on')
       .parse(process.argv);

var options = {
    config: './connection_config.json',
    connectionNames: ['left', 'right'],
    snapshotFile: null,
    snapshot: false,
    hash: false,
    dependents: false
};

options.config = program.config || options.config;
options.connectionNames = program.connectionNames || options.connectionNames;
options.snapshotFile = program.snapshotFile || options.snapshotFile;
options.snapshot = program.snapshot || options.snapshot;
options.hash = program.hash || options.hash;
options.dependents = program.dependents || options.dependents;
options.outputFile = program.args[0] || null;



console.log(util.inspect(options));

if(options.snapshot){
    var connInfo = getConnInfo(options.config, options.connectionNames);
    if(options.outputFile == null){
        var filename = 'snapshot_' + options.connectionNames[0] + '_' + (new Date()).getTime() + '.json';
        options.outputFile = path.join(process.cwd(), filename);
    }
    generateSnapShot(connInfo[0], options.dependents)
    .then(function (results) {
        fse.writeJsonSync(options.outputFile, results);
        console.log("Snapshot created for " + options.connectionNames[0] + " at " + options.outputFile);
    })
    .then(waitForExit)
    .catch(function (err) {
        console.error("An error occurred generating snapshot");
        console.error(err);  
    });
}else{
    console.log("Current set of options is not yet supported.");
    waitForExit();
}


function waitForExit(){
    return inquirer.input("Press enter to exit")
                   .then(process.exit);
}