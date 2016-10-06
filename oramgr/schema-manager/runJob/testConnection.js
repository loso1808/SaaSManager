var Promise = require('bluebird');
var _ = require('lodash');

var QueryRunner = require('../exportSchema/queryRunner');

//load the oracledb library 
var oracledb = require('oracledb');
 
//load the simple oracledb 
var SimpleOracleDB = require('simple-oracledb');
 
//modify the original oracledb library 
SimpleOracleDB.extend(oracledb);

module.exports = function(connInfo, opts){
    opts = opts || {};
    var log = opts.log || function () { };

    return oracledb.getConnection(connInfo)
           .then(function(conn){
               return conn.close();
           })
           .then(function(){
               return Promise.resolve(true);
           })
            .catch(function(err){
                log("Error occurred testing oracle connection: ");
                log("\t" + connInfo.user + "@" + connInfo.connectString);
                log(err);
                log(err.stack);
                throw err;
            });
}