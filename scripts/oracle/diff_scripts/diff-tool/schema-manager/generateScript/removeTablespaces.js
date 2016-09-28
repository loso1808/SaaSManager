var replaceAll = require('../exportSchema/replaceAll');

module.exports = function(templatedScript){
     var str = replaceAll(templatedScript, 'TABLESPACE "{{LOG_TABLESPACE_NAME}}"', '');
     str = replaceAll(str, 'TABLESPACE "{{TABLESPACE_NAME}}"', '');
     str = replaceAll(str, 'TABLESPACE "{{LOG_INDEX_TABLESPACE_NAME}}"', '');
     str = replaceAll(str, 'TABLESPACE "{{INDEX_TABLESPACE_NAME}}"', '');

     return str;
}