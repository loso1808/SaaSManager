module.exports = (function(){
    
    var pm2 = require('pm2');
    var shelljs = require('shelljs');
    var fs = require('fs');
    var path = require('path');
    var util = require('util');
    var generatePassword = require("password-generator");
    var createSchemaObjects = require("./db_init.js");
    var appConfigFolder = "/users/adamthomas/peony_configs/";

    var knexSys = require('knex')({
        client: 'strong-oracle',
        connection: {
            "host": "localhost",
            "database": "ORCL",
            "password": "oracle",
            "user": "SYSTEM"
        },
        debug: false
    });

    var knexPnyMgr = require('knex')({
        client: "strong-oracle",
        connection: {
        "host": "localhost",
        "database": "ORCL",
        "password": "owner#0503",
        "user": "pnymgr_owner"
        },
        pool: {
            "min": 0,
            "max": 25
        },
        debug: false             
    });
    
    function validateClientIdAndSetup(clientCode, clientName, callback){
        var clientId = clientCode;
        
        if(clientId.length < 2 || clientId.length > 16){
            var errMsg = "Please supply a client code argument of length 2-16.";
            console.error(errMsg);
            return callback(errMsg);
        }
        
        clientId = clientId.toUpperCase();
        var regexp = /^[A-Z0-9_]+$/;
        
        if(clientId.search(regexp) == -1){
            var errMsg = "A client code can only consist of alphanumeric characters and underscores (no spaces).";
            console.error(errMsg);
            return callback(errMsg);
        }
        
        
        knexPnyMgr("CLIENT").count("ID as NUM").where({CODE: clientId})
        .then(function(results){
            var num = results[0]["NUM"];
            if(num > 0){
                var errMsg = "Client code " + clientId + " already exists";
                console.log(errMsg);
                return callback(errMsg);
            }else{            
                console.log("Creating client with code: " + clientId);
                return setupClient(clientId, clientName, callback);
            }            
        });
    };


    function setupClient(clientId, clientName, callback){
        var newConnInfo = {};
                
        provisionClientSchema(knexSys, clientId)
        .then(function(result){
        newConnInfo = result;
        console.log(util.inspect(result)); 
        var knexOwner = require('knex')({
                client: 'strong-oracle',
                connection: {
                    "host": "localhost",
                    "database": "ORCL",
                    "password": result.ownerPassword,
                    "user": result.ownerSchema
                },
                debug: false
            });
            
            return createSchemaObjects(knexOwner)
                .then(function(results){
                        var createConcatClobBuffer = require("./db_concat_clob_buffer.js");
                        return createConcatClobBuffer(knexOwner, newConnInfo.appSchema);
                })
                .then(function(results){
                    var roles = [
                        {
                            id: 1,
                            name: "editor",
                            description: "Can edit their own non-shared data"
                        },  
                        {
                            id: 2,
                            name: "admin",
                            description: "Full access to all app functionality."
                        }, 
                        {
                            id: 3,
                            name: "user_manager",
                            description: "Can manage users and assign roles."
                        },
                        {
                            id: 4,
                            name: "viewer",
                            description: "Can view data in the shared Peony repo"
                        },
                        {
                            id: 5,
                            name: "contributor",
                            description: "Can add data into the shared Peony repo"
                        }
                    ];
                    
                    return knexOwner("role").insert(roles);
                })
                .then(function(results){
                        var appServerUser = {
                            id: 0,
                            username: "app_server"                    
                        };
                        return knexOwner("user").insert(appServerUser);
                })
                .then(function(results){
                    var defaultAdminUser = {
                            username: "admin",
                            firstName: "Admin",
                            password: "$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW",
                            activated: 1,
                            activeFlag: 1                    
                        };
                        return knexOwner("user")
                                .returning("id")
                            .insert(defaultAdminUser)
                            .then(function(results){
                                    var id = results[0];
                                    var adminRoles = {
                                    user_id: id,
                                    role_id: 2  
                                    };
                                    return knexOwner("user_role").insert(adminRoles);
                            });
                });
        })
        .then(function(results){
            var appConfig = fs.readFileSync(__dirname + "/appconfig.tmp.json",'utf8');
            appConfig = JSON.parse(appConfig);
            appConfig.oracle.user = newConnInfo.ownerSchema;
            appConfig.oracle.password = newConnInfo.ownerPassword;
            
            var newAppConfigPath = path.join(appConfigFolder, "appconfig." + clientId + ".json");
            fs.writeFileSync(newAppConfigPath, JSON.stringify(appConfig, null, 4), 'utf8');
            console.log("Wrote appconfig to " + newAppConfigPath);
            return newAppConfigPath;
        })
        .then(function(results){
            var appConfigPath = results;
            var pm2Config = fs.readFileSync(__dirname + "/pm2.config.json", 'utf8');
            pm2Config = JSON.parse(pm2Config);
            pm2Config.env.config = appConfigPath;
            pm2Config.name = "peony-app-"+clientId;
            
            var newSaasClient = {
                "CODE": clientId,
                "NAME": clientName,
                "APP_USER_PASSWORD": newConnInfo.appPassword,
                "OWNER_USER_PASSWORD": newConnInfo.ownerPassword,
                "PORT": 3000    
            };
            
            return knexPnyMgr("CLIENT").count("ID as NUM")
                .then(function(results){
                    var total = results[0]["NUM"];
                    newSaasClient.PORT = 3000 + total + 1;
                    pm2Config.env.PORT = newSaasClient.PORT;
                    
                    var newPm2ConfigPath = path.join(appConfigFolder, "pm2config." + clientId + ".json");
                    fs.writeFileSync(newPm2ConfigPath, JSON.stringify(pm2Config, null, 4), 'utf8');
                    
                    return knexPnyMgr("CLIENT").insert(newSaasClient)
                            .then(function(results){
                                    pm2.connect(function(err){
                                        if(err){
                                            console.error(err);
                                            return callback(err);
                                        }
                                        pm2.start(newPm2ConfigPath, function(err, proc){
                                            if(err){
                                                console.error(err);
                                                return callback(err);
                                            }
                                            logInfo("PM2 started app on port " + newSaasClient.PORT);
                                            var execCmd = 'open "http://localhost:' + newSaasClient.PORT + '" ';
                                            
                                            setTimeout(function(){ 
                                                //shelljs.exec(execCmd);
                                                return callback(null, null);
                                            }, 3000);
                                            
                                            pm2.disconnect();
                                        });
                                    });  
                            });
                });
        })
        .then(function(results){
            console.log("Finished!");            
        });
    }

    function logInfo(msg){
        console.log(msg);
    }

    function provisionClientSchema(knex, clientId){
        var ownerPassword = generatePassword();
        var appPassword = generatePassword();

        logInfo("Creating data tablespace");
        return knex.raw("CREATE TABLESPACE PNY_DATA_" + clientId + " DATAFILE 'PNY_DATA_" + clientId + ".dat' SIZE 20M AUTOEXTEND ON MAXSIZE 1G ONLINE")
        .then(function(results){
            logInfo("Creating temp tablespace");
            return knex.raw("CREATE TEMPORARY TABLESPACE TMP_PNY_DATA_" + clientId + " TEMPFILE 'TMP_PNY_DATA_" + clientId + ".data' SIZE 5M REUSE AUTOEXTEND ON MAXSIZE 1G");
        })
        .then(function(results){
            logInfo("Creating owner schema");
            return knex.raw(""+
            "    CREATE USER PNY_DBO_" + clientId + " " +                    
            "    IDENTIFIED BY \"" + ownerPassword + "\"  " +          
            "    DEFAULT TABLESPACE PNY_DATA_" + clientId + " " +             
            "    TEMPORARY TABLESPACE TMP_PNY_DATA_" + clientId + " " +   
            "");
        })
        .then(function(results){
            logInfo("Granting unlimited tablespace to owner");
            return knex.raw("GRANT unlimited tablespace to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Granting create session to owner");
            return knex.raw("GRANT create session to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Granting create table to owner");
            return knex.raw("GRANT create table to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Granting create view to owner");
            return knex.raw("GRANT create view to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Granting create any trigger to owner");
            return knex.raw("GRANT create any trigger to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Granting create sequence to owner");
            return knex.raw("GRANT create sequence to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Granting create procedure to owner");
            return knex.raw("GRANT create procedure to PNY_DBO_" + clientId + " ");
        })
        .then(function(results){
            logInfo("Creating app user");
            return knex.raw("CREATE USER PNY_APP_" + clientId + " " +
                            "IDENTIFIED BY \"" + appPassword + "\"");
        }).then(function(results){
            logInfo("Granting create session to app user");
            return knex.raw("GRANT create session to PNY_APP_" + clientId + " ");
        }).then(function(results){
            logInfo("Granting create synonyms to app user");
            return knex.raw("GRANT create synonym to PNY_APP_" + clientId + " ");
        }).then(function(results){
            console.log("Finished!");
            
            var retObj = {
            ownerSchema: "PNY_DBO_" + clientId,
            ownerPassword: ownerPassword,
            appSchema: "PNY_APP_" + clientId,
            appPassword: appPassword,
            dataTablespace: "PNY_DATA_" + clientId,
            tempTablespace: "TMP_PNY_DATA_" + clientId  
            };
            
            return retObj;
        });
    }

    
    return validateClientIdAndSetup;
})();