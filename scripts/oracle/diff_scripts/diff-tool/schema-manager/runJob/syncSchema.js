var connectionConfig = require('../../connection_config');
var Promise = require('bluebird');
var exportSchema = require('../exportSchema');


module.exports = function(jobConfig, opts){
    opts = opts || {};
    var log = opts.log || function() {};

    var sourceConfigEntry = connectionConfig[jobConfig.source.connectionName];
    var targetConfigEntry = connectionConfig[jobConfig.target.connectionName];

    var connInfo = getConnInfo(sourceConfigEntry);
    log(connInfo);

    return exportSchema(connInfo, opts)
           .tap(log);
}

function getConnInfo(configEntry){
    var conn = configEntry.connection;

    var connInfo = {
        user: conn.user,
        password: conn.password,
        connectString: conn.host + "/" + conn.database
    };

    return connInfo;
}