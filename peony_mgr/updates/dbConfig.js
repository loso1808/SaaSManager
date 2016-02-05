
module.exports = (function(){
    var dbConfig = {
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
         }        
    };
    
    return dbConfig;
})();