process.on('SIGINT', function() {
  process.exit();
});

var runJob = require('./index');
var log = require('../../logger');

runJob({
        type: 'sync-schema',
        source: {
            connectionName: "local_rc170"
        },
        target: {
            connectionName: "local_po"
        }
    }, { log: log })
.then(done)
.catch(function(err){
    log("Error occurred testing run job");
    log(err);
    log(err.stack);
    throw err;
});

function done(){
    log("Done!");
    process.exit();
}
