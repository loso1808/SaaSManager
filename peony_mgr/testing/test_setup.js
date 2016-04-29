process.on('SIGINT', function() {
  process.exit();
});


var clientId = "SYNBICITE";
var clientName = "SynbiCITE";
var connectionInfo = {
    managerConnection: {
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
    },
    // deploymentConnection: {
    //     client: 'strong-oracle',
    //     connection: {
    //         "host": "localhost",
    //         "database": "ORCL",
    //         "password": "oracle",
    //         "user": "SYSTEM"
    //     },
    //     debug: false
    // }
    deploymentConnection: {
        client: 'strong-oracle',
        connection: {
            "host": "tesela.c1grsxamme4w.us-west-1.rds.amazonaws.com",
            "database": "TESELA",
            "password": "master#0503",
            "user": "teselagen"
        },
        debug: false
    },
    isManagedTablespaces: true
};

var provisionNewClient = require("../server/db_setup/setup_client_lib.js")(connectionInfo);

provisionNewClient(clientId, clientName, function(err, results){
    if(err){
        console.error(err);
    }else{
        console.log("Successfully created client " + clientName);
        process.exit();
    }
});