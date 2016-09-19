var _ = require('lodash');
var util = require('util');

var getSchemaConfig = require('./index');

log("No opts");
log(getSchemaConfig({}));

log("Code");
log(getSchemaConfig({ schemaCode: "RC_1_X_X" }));

function log(msg){
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg, { showHidden: false, depth: 12 });
    }
    console.log(str);
}