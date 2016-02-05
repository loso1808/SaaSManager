var dbConfig = require("./dbConfig.js");
var knex = require("knex")(dbConfig);

function up(){
    return knex.schema.createTable("USER", function(table){
        table.increments('ID');
        table.string("USERNAME", 200)
              .unique()
              .notNullable();
        table.string("FIRST_NAME", 400);
        table.string("LAST_NAME", 400);
        table.string("EMAIL", 400);
        table.string("PASSWORD", 1024);  
    }).then(function(){
        return knex.schema.createTable("ROLE", function(table){
            table.increments('ID');
            table.string("NAME", 400)
                 .notNullable();
            table.string("DESCRIPTION", 2000);
        });
    }).then(function(){
        return knex.schema.createTable("USER_ROLE", function(table){
            table.increments('ID');
            table.specificType("USER_ID","NUMBER")
                 .references("ID")
                 .inTable("USER")
                 .notNullable();
            table.specificType("ROLE_ID","NUMBER")
                 .references("ID")
                 .inTable("ROLE")
                 .notNullable();
        });
    }).then(function(){
        return knex.schema.createTable("APP_SETTING", function(table){
            table.increments('ID');
            table.string("NAME", 800)
                 .unique()
                 .notNullable;
            table.string("VALUE", 4000);
            table.string("TAGS", 4000);
        });
    }).then(function(){
    
    });
}

function down(){
    return knex.schema.dropTable("APP_SETTING")
    .then(function(){
        return knex.schema.dropTable("USER_ROLE"); 
    }).then(function(){
        return knex.schema.dropTable("ROLE");
    }).then(function(){
        return knex.schema.dropTable("USER"); 
    });
}

// console.log("Migrating down");
// down().then(function(){
//    console.log("Migrated down");
//    process.exit(); 
// });

function upDownTest(){
    console.log("Testing migrations");
    console.log("Migrating up");
    up().then(function(){
        console.log("Migrated up");
        console.log("Migrating down");
        return down();
    }).then(function(){
        console.log("Migrated down");
        process.exit(); 
    });
};

//upDownTest();


console.log("Migrating up");
up().then(function(){
    console.log("Migrated up");
})