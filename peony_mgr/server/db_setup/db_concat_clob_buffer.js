var fs = require('fs');

module.exports = function(knex, appUser){
      var createOrReplaceFunction = fs.readFileSync(__dirname + "/concat_clob_buffer.sql",'utf8');
      
      return knex.raw(createOrReplaceFunction)
             .then(function(results){
                 return knex.raw("GRANT EXECUTE ON CONCAT_CLOB_BUFFER TO " + appUser);
             });
};