
process.on('SIGINT', function() {
  process.exit();
});

var connInfo = {
    user: "PEONY_OWNER",
    password: "master#0503",
    connectString: "localhost/ORCL"
};

var exportSchema = require('./index');

exportSchema(connInfo)
.then(done);

function done(){
    log("Done!");
    process.exit();
}

function log(msg){
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg, { showHidden: false, depth: 12 });
    }
    console.log(str);
}