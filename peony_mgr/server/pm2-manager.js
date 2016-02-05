

module.exports = (function(){
    var pm2 = require('pm2');
    var util = require('util');
    var _ = require('lodash');
    
    function generateGetPm2Status(results, callback){
        var processPm2List = generateProcessPm2List(results, callback);
        return function(err){
            if(err){
                console.error(err);
                return callback(err);
            }
            pm2.list(processPm2List);
        }
    }
    
    function generateProcessPm2List(results, callback){
        return function(err, list){
            if(err){
                console.error(err);
                return callback(err);
            }
            // console.log("PM2 List: ");
            // console.log(util.inspect(list));
            
            _(results).forEach(function(item){
               var pm2Entry = _.find(list, { name: item.PM2_NAME });
                item.PM2_STATUS = "offline";
                if(pm2Entry){
                    item.PM2_STATUS = pm2Entry.pm2_env.status;
                }                
            });
            callback(null, results);
            pm2.disconnect();
        }
    }
    
    function addPm2Status(results, callback){
        var getPm2Status = generateGetPm2Status(results, callback);
        pm2.connect(getPm2Status);
    }
    
    return addPm2Status;
})();