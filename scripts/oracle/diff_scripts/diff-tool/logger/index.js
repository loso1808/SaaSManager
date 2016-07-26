var util = require('util');
var _ = require('lodash');

module.exports = function (msg, channel, level) {
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg);
    }
    console.log(str);
}