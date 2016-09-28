var connectionConfig = require('../../connection_config');
var Promise = require('bluebird');
var syncSchema = require('./syncSchema');

module.exports = function(jobConfig, opts){
    opts = opts || {};
    var log = opts.log || function(){};


    if(jobConfig.type === 'sync-schema'){
        return syncSchema(jobConfig, opts);
    }else{
        throw new Error("Invalid Job Type Specified: " + jobConfig.type);
    }
}