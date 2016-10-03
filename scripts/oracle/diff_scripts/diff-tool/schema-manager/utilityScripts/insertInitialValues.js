
var Mustache = require('mustache');

var assignEmptyBindingsToCommandArray = require('../exportSchema/assignEmptyBindingsToCommandArray');

module.exports = function(templateData){

    var statements = [
        "insert into \"{{SCHEMA_NAME}}\".\"user\" (\"id\",\"username\",\"firstName\",\"lastName\") values (0, 'app','app','server')",
        "Insert into \"{{SCHEMA_NAME}}\".\"role\" (\"id\",\"name\",\"description\") values (1,'editor','Can edit their own non-shared data')",
        "Insert into \"{{SCHEMA_NAME}}\".\"role\" (\"id\",\"name\",\"description\") values (2,'admin','Full access to all app functionality.')",
        "Insert into \"{{SCHEMA_NAME}}\".\"role\" (\"id\",\"name\",\"description\") values (3,'user_manager','Can manage users and assign roles.')",
        "Insert into \"{{SCHEMA_NAME}}\".\"role\" (\"id\",\"name\",\"description\") values (4,'viewer','Can view data in the shared Peony repo')",
        "Insert into \"{{SCHEMA_NAME}}\".\"role\" (\"id\",\"name\",\"description\") values (5,'contributor','Can add data into the shared Peony repo')",
        "Insert into \"{{SCHEMA_NAME}}\".\"role\" (\"id\",\"name\",\"description\") values (6,'tag_admin','Can manage and assign permissions for tags.')",
        "Insert into \"{{SCHEMA_NAME}}\".\"user\" (\"id\",\"username\",\"firstName\",\"lastName\", \"password\", \"activated\", \"activeFlag\") values (1, 'admin','Admin','User', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1)",
        "insert into \"{{SCHEMA_NAME}}\".\"user_role\" (\"user_id\", \"role_id\") values (1, 2)",
        "commit"
    ];

    var cmds = [];

    statements.forEach(function(cmd, i){
        if(templateData){
            var script = Mustache.render(cmd, templateData);
            cmds.push("BEGIN " + script + "; END;");
        }else{
            cmds.push("BEGIN " + cmd + "; END;");
        }
    });
    
    cmds = assignEmptyBindingsToCommandArray(cmds);
    
    return {
        cmds: cmds,
        statements: statements
    };

}