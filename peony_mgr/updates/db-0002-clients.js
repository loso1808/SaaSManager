var dbConfig = require("./dbConfig.js");
var knex = require("knex")(dbConfig);

function up(){
    return knex.schema.createTable("CLIENT", function(table){
        table.increments('ID');
        table.string("CODE", 17)
              .unique()
              .notNullable();
        table.string("NAME", 400);
        table.specificType("PORT","NUMBER");
        table.string("APP_USER_PASSWORD", 1024);
        table.string("OWNER_USER_PASSWORD", 1024);  
    })
}

function down(){
    return knex.schema.dropTable("CLIENT");
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