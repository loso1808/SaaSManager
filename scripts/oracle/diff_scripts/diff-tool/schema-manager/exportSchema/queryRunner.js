
var Promise = require('bluebird');
var oracledb = require('oracledb');

module.exports = function(dbConn, opts){
    opts = opts || {};
    var log = opts.log || function() {};
    //console.log("In QueryRunner");
    //console.log(JSON.stringify(dbConn, null, 4));

    return (function(dbConn){
        var dbConn = dbConn;


        //console.log("In QueryRunner anonymous constructor");
        //console.log(JSON.stringify(dbConn, null, 4));

        return runQuery;

        function runQuery(qry){

            //console.log("In runQuery");
            //console.log(JSON.stringify(dbConn, null, 4));
            
            if(Array.isArray(qry)){
                return Promise.each(qry, function (item) {
                    return runQuery(item);
                });
            }
            if(qry.fn){
                return dbConn[qry.fn](qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT, maxRows: 10000 })
                .catch(function(err){
                    log("Error running query: ");
                    log(qry);
                    throw err;
                });
            }

            return dbConn.execute(qry.cmd, qry.bindings, { outFormat: oracledb.OBJECT, maxRows: 10000 })
                .catch(function(err){
                        log("Error running query: ");
                        log(qry);
                        throw err;
                });
        }
    })(dbConn);


}