process.on('SIGINT', function() {
  process.exit();
});


var program = require('commander');
var util = require('util');
var path = require('path');
var fse = require('fs-extra');
var inquirer = require('inquirer-promise');
var Promise = require('bluebird');
var crypto = require('crypto');
var _ = require('lodash');

var getConnInfo = require('./getConnInfo');
var generateSnapshot = require('./generateSnapshot');
var generateDimensions = require('./generate-dimensions');
var compareDimensions = require('./dimensional-compare.js');
var ToTable = require('table').default;

function list(val){
    return val.split(',');
}

program.version('1.0.0')
       .usage('[options] <outputFile>')
       .option('-f, --config <fileName>', 'Config file with connection info (default: ./connection_config.json)')
       .option('-l, --listConnections', 'Interactively list connections from config file')
       .option('-n, --connectionNames <name1, name2>', 'Names of connections to use from config file (default: "left","right")', list)
       .option('-c, --compare [snapshotFile]', 'Compare schemas optionally load one schema from snapshot file')
       .option('-m, --migrationLogFile <fileName>', 'Filename of the migration log so save hashes and versions to')
       .option('-r, --release <versionNumber>', 'Name of release candidate version for generated hash when saving to migration log')
       .option('-s, --snapshot', 'Take a snapshot of database schema')
       .option('-x, --hash [snapshotFile]', 'Generate hash for database schema or snapshot file if provided')
       .option('-t, --detectVersion', 'Detect version of the database given a migration log')
       .option('-p, --dependents', 'Check and compare objects that synonyms depend on')
//       .option('-y, --compareHash [snapshotFile]', 'Check and compare hashes of database(s) and snapshot file if provided')
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
options.migrationLogFile = program.migrationLogFile || null;
options.release = program.release || null;
//options.compareHash = program.compareHash || false;
options.detectVersion = program.detectVersion || false;
options.listConnections = program.listConnections || false;
options.compare = program.compare || false;

console.log(util.inspect(options));
//console.log("Is Snapshot File: " + (options.snapshot !== false && options.snapshot !== true));
//process.exit();

if(options.listConnections){
    console.log("Listing connection names is not yet implemented");
    var config = fse.readJsonSync(options.config);
    var connectionNames = [];
    var connNameOptions = _.keys(config);
    var connCount = operationConnectionCount(options);

    if(connCount === 0){
        parseOptions(options);
    }else{        
        
        var promptText = "Left Connection:";
        if(connCount === 1){
            promptText = "Connection:";
        }

        inquirer.list(promptText, connNameOptions)
        .then(function (connName) {
            connectionNames.push(connName);
            
            if(connCount === 1){
	            options.connectionNames = connectionNames;
                return parseOptions(options);
            }else{
                return inquirer.list("Right Connection: ", connNameOptions);
            }
        })
        .then(function (connName) {
            connectionNames.push(connName);
            options.connectionNames = connectionNames;
            return parseOptions(options);
        });
    }
}else{
    parseOptions(options);
}