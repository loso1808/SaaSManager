var replaceAll = require('../exportSchema/replaceAll');

module.exports = function(templatedScript){
    return replaceAll(templatedScript, '"{{SCHEMA_NAME}}".', '');
}