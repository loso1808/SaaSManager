
var loadScript = require('./load-sql-script.js');

module.exports = function(leftConnection, rightConnection){
    var selfReport = {
        selfReportLeft: null,
        selfReportRight: null
    };

    return checkForeignKeyNames(leftConnection)
           .then(function (results) {
               if(results.length > 0){
                   selfReport.selfReportLeft = results;
               }else{
                   selfReport.selfReportLeft = "No issues";
               }
               return checkForeignKeyNames(rightConnection);
           })
           .then(function (results) {
               if(results.length > 0){
                   selfReport.selfReportRight = results;
               }else{
                   selfReport.selfReportRight = "No issues";
               }
               return selfReport;
           });
}

function checkForeignKeyNames(knex){
    var script = loadScript('foreign-key-naming');
    return knex.raw(script);
}