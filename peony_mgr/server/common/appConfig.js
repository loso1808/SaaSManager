

module.exports = (function(){
    var appConfig =  {
        "db": {
            "host": "localhost",
            "database": "ORCL",
            "password": "app#0503",
            "user": "pnymgr_app",
            "pool": {
                "min": 0,
                "max": 25
            }
        },
    };
    
    //TODO read config from file
    
    return appConfig;
})();