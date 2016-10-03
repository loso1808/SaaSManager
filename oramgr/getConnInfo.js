
var path = require('path');
var fse = require('fs-extra');
var _ = require('lodash');

module.exports = function (configFile, connectionNames) {
    var configFilePath = configFile;
    
    if(!path.isAbsolute(configFile)){
        var cwd = process.cwd();
        configFilePath = path.resolve(cwd, configFile);
    }

    var config = fse.readJsonSync(configFilePath);

    var connInfo = [];

    connectionNames.forEach(function(item) {
        var conn = _.get(config, item);
        connInfo.push(conn);
    });

    return connInfo;
}