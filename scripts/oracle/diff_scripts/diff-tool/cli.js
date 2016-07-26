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

// var generateSnapShot = function (connInfo, dependents) {
//     return Promise.resolve({ connInfo: connInfo, dependents: dependents });
// };

// var getConnInfo = function (configFile, connectionNames) {
//     return [{ configFile: configFile, connectionName: connectionNames[0] },
//             { configFile: configFile, connectionName: connectionNames[1] }];
// };

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
    parseOptions(options);
}else{
    parseOptions(options);
}

function parseOptions(options) {
    if(options.snapshot){
        return performSnapshot(options);
    }else if(options.hash){
        return performGetHash(options);
    }else if(options.detectVersion){
        return performDetectVersion(options);
    }else if(options.compare){
        return performSchemaComparison(options);
    }else{
        console.log("Current set of options is not yet supported.");
        return waitForExit();
    }
}

function performSnapshot(options){
    return getSnapshot(options)
            .then(function (results) {
                fse.writeJsonSync(options.outputFile, results);
                console.log("Snapshot created for " + options.connectionNames[0] + " at " + options.outputFile);
            })
            .then(waitForExit)
            .catch(function (err) {
                console.error("An error occurred generating snapshot");
                console.error(err);  
            });
}

function getSnapshot(options){

    var connInfo = getConnInfo(options.config, options.connectionNames);
    if(options.outputFile == null){
        var filename = 'snapshot_' + options.connectionNames[0] + '_' + (new Date()).getTime() + '.json';
        options.outputFile = path.join(process.cwd(), filename);
    }

    return generateSnapshot(connInfo[0], options.dependents);
}

function getHash(options) {
    return getSnapshotForHash(options)
           .then(sortSnapshotDimensions)
           .then(calculateHash);
    
    function getSnapshotForHash(options) {
        if(options.hash !== false && options.hash !== true){
            var snapshotFilePath = path.resolve(options.hash);
            return Promise.resolve(fse.readJsonSync(snapshotFilePath));
        }else{
            return getSnapshot(options);
        }
    }

    function sortSnapshotDimensions(snapshot) {
        var dimensions = snapshot.dimensions;
        var sortedDims = _.sortBy(dimensions, function (item) {
            return crypto.createHash('sha256').update(JSON.stringify(item)).digest('hex');
        });
        return Promise.resolve(sortedDims);
    }

    function calculateHash(sortedDimensions) {
        //var ts = (new Date()).getTime();
        //fse.writeJsonSync(path.resolve('sortedDim_' + ts + '.json'), sortedDimensions);
        var dimStr = JSON.stringify(sortedDimensions, null, 4);
        //fse.writeFileSync(path.resolve('dimStr_' + ts + '.json'), dimStr);
        //console.log("\n===============\n" + dimStr + "\n===============\n");
        var hash = crypto.createHash('sha256').update(dimStr).digest('hex');
        return Promise.resolve(hash);
    }
}

function performGetHash(options){

    var connectionName = options.connectionNames[0];

    if(options.hash !== false && options.hash !== true){
        var snapshotFilePath = path.resolve(options.hash);
        connectionName = path.basename(snapshotFilePath);
    }

    return getHash(options)
           .then(saveHash)
           .then(printHash)
           .then(waitForExit)
           .catch(function (err) {
                console.error("An error occurred calculating hash");
                console.error(err);  
            });

    function saveHash(hash){
        if(options.migrationLogFile){
            if(!options.release){
                console.log("No version specified. You must specify a version when saving a hash to a migration log.")
                return waitForExit();
            }
            var migrationLogFilePath = path.resolve(options.migrationLogFile);
            
            var migrationLog = {};
            
            if(doesFileExist(migrationLogFilePath)){
                migrationLog = fse.readJsonSync(migrationLogFilePath);
            }

            migrationLog[options.release] = {
                hash: hash,
                generatedOn: new Date()
            };
            
            fse.writeJsonSync(migrationLogFilePath, migrationLog);

            console.log("Saved hash as version " + options.release + " to migration log: " + migrationLogFilePath);
        }
        
        return Promise.resolve(hash);
    }

    function printHash(hash) {
        console.log("Hash for " + connectionName + ": " + hash);
    }
}

function performDetectVersion(options) {
    var migrationLogFilePath = "";
    
    if(!options.migrationLogFile){
        console.error("Migration Log File option was not specified and must be to detect version");
        return waitForExit();
    }else{
        migrationLogFilePath = path.resolve(options.migrationLogFile);
        if(!doesFileExist(migrationLogFilePath)){
            console.error("Migration Log File was not found at path: " + migrationLogFilePath);
            return waitForExit();
        }
    }

    return getDatabaseHash(options)
           .then(existsInMigrationLog)
           .then(printVersion)
           .then(waitForExit)
           .catch(function (err) {
                console.error("An error occurred detecting the database version");
                console.error(err);  
            });

    function getDatabaseHash(options) {
        return getHash(options);
    }

    function existsInMigrationLog(hash) {
        var migrationLog = fse.readJsonSync(migrationLogFilePath);
        var version;
        _.forEach(migrationLog, function(item, key){
            if(item.hash === hash){
                version = key;
                return false;
            }
        });

        if(version){
            return Promise.resolve(version);
        }else{
            console.error("Hash for " + options.connectionNames[0] + " was not found in migration log: " + migrationLogFilePath + " for hash: " + hash);
            return waitForExit();
        }
    }

    function printVersion(version){
        console.log("The version for " + options.connectionNames[0] + " is " + version);
    }
}

function performSchemaComparison(options){
    var rightConnectionName, leftConnectionName;
    var leftSchemaName, rightSchemaName;
    var connectionNames = [];
    var rightSnapshot;

    if(options.compare !== false && options.compare !== true){
        var snapshotFilePath = path.resolve(options.compare);
        rightSnapshot = fse.readJsonSync(snapshotFilePath);
        rightConnectionName = path.basename(snapshotFilePath);
        leftConnectionName = options.connectionNames[0];
        connectionNames.push(leftConnectionName);
    }else{
        connectionNames = options.connectionNames;
        leftConnectionName = options.connectionNames[0];
        rightConnectionName = options.connectionNames[1];
    }

    return getDimensions(options, connectionNames)
           .then(compareDimensions)
           .then(formatDiffReport)
           .then(printReport)
           .then(waitForExit)
           .catch(function (err) {
                console.error("An error occurred comparing database schemas");
                console.error(err);  
            });

    
    function getSchemaName(knex){
        return knex.client.config.connection.user;
    }
    
    function printReport(diffReport){
        console.log(diffReport);
    }

    function getDimensions(options, connectionNames) {
        var connInfo = getConnInfo(options.config, connectionNames);
        var knexLeft, knexRight;

        knexLeft = require('knex')(connInfo[0]);
        leftSchemaName = getSchemaName(knexLeft);
        if(connInfo.length > 1){
            knexRight = require('knex')(connInfo[1]);
            rightSchemaName = getSchemaName(knexRight);
        }else{
            rightSchemaName = rightConnectionName;
        }

        return generateDimensions(knexLeft, knexRight, { diffSynonymDependents: options.dependents })
               .then(function(results){
                   if(rightSnapshot){
                       results.right = rightSnapshot.dimensions;
                   }
                   return Promise.resolve(results);
               })
               .catch(function (err) {
                    console.error(err);
                    throw(err);
               });
    }

    function formatDiffReport(compareResult) {
        var reportStr = "";

        var headerRow = [ leftSchemaName, rightSchemaName ];
        var reportRows = [headerRow];

        var leftDiff = compareResult.leftDiff.slice(0);
        var rightDiff = compareResult.rightDiff.slice(0);

        leftDiff.forEach(function (item) {
        var arr = item.split('/');
        var pathCount = arr.length;
        arr.pop();
        arr.pop();
        var dimPath = arr.join('/');
        var rightMatch = "(missing)";
        var idx = _.findIndex(rightDiff,function (val) {
            var valPathCount = val.split('/').length;
            return (_.startsWith(val, dimPath) && pathCount == valPathCount); 
        });
        if(idx > -1){
            rightMatch = _.pullAt(rightDiff, idx);
        }
        reportRows.push([item, rightMatch]);
        });

        rightDiff.forEach(function (item) {
            reportRows.push(["(missing)", item]);
        });

        var config = {
                        columns: {
                            0: {
                                width: 80,
                                wrapWord: true
                            },
                            1: {
                                width: 80,
                                wrapWord: true
                            }
                        }
                    };

        reportStr += ToTable(reportRows, config);
        reportStr += "\n\nTotal Differences: " + (reportRows.length - 1) + "\n";

        return reportStr;
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