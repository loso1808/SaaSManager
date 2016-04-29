process.env.nologging=1;

process.on('SIGINT', function() {
  process.exit();
});

var _ = require('lodash');
var util = require('util');

var knex = require('knex')({
    client: 'strong-oracle',
    connection: {
        "host": "tesela.c1grsxamme4w.us-west-1.rds.amazonaws.com",
        "database": "TESELA",
        "password": "master#0503",
        "user": "teselagen"
    },
    debug: true
});

// var knex = require('knex')({
//     client: 'strong-oracle',
//     connection: {
//         "host": "localhost",
//         "database": "ORCL",
//         "password": "master#0503",
//         "user": "PEONY_OWNER"
//     },
//     debug: true
// });

// var knex = require('knex')({
//     client: 'pg',
//     connection: {
//         "user": "postgres",
//         "database": "pgdb",
//         "password": "master#0503",
//         "host": "127.0.0.1"        
//     },
//     searchPath: 'peony_owner, public',
//     debug: true
// });

console.log("Started Knex testing");

console.log("Knex client: " + knex.client.config.client);

//var dialect = "postgresql";
var dialect = "oracle";

function testConnection(){
    return knex("sequence").count("id as num").then(function(result){
       console.log("Sequence count: " + result[0]["num"]); 
    });
}

function testConnectionPg(){
    return knex.count("id as num").from("test").then(function(result){
       console.log("Test count: " + result[0]["num"]); 
       process.exit();
    });
    
    // return knex.count("id as num").from(knex.raw('"PEONY_OWNER"."test"')).then(function(result){
    //    console.log("Test count: " + result[0]["num"]); 
    //    process.exit();
    // });
}

//testConnectionPg();

function dropKnexTestTables(){
    return knex.schema.dropTableIfExists("test_knex")
           .then(function(){
               return knex.schema.dropTableIfExists("test_knex_2");
           });
}

function createTableWithIncrementColumn(){
    console.log("Creating test_knex table");
    return knex.schema.createTable("test_knex_2", function(table){
       table.increments();
       table.string("name", 400).notNullable();
       table.specificType("num", "NUMBER");
       table.text("metadata");
       table.timestamp("dateCreated"); 
    }).then(function(){
        console.log("Finished creating test_knex table");        
    });
}
//dropKnexTestTables().then(
//createTableWithIncrementColumn);
//testConnection();

var schemaQuery = 
"select " +
"  utc.table_name, " +
"  utc.column_name, " +
"  utc.data_type, " +
"  utc.data_length, " +
"  utc.nullable, " +
"  NVL(pkc.PRIMARY_KEY, 'N') primary_key " +
"from " +
"  user_tab_cols utc " +
"    left join " +
"  (select uc.table_name, ucc.column_name, 'Y' primary_key from " +
"      user_constraints uc " +
"        inner join " +
"      user_cons_columns ucc " +
"        on uc.constraint_name = ucc.constraint_name " +
"    where uc.constraint_type = 'P') pkc " +
"    on utc.table_name = pkc.table_name " +
"    and utc.column_name = pkc.column_name " +
"order by utc.table_name, utc.column_id";

//console.log("Schema Query: " + knex.raw(schemaQuery).toString());

var foreignKeyQuery =
"SELECT "+
"    CONS.CONSTRAINT_NAME FOREIGN_KEY_NAME, "+
"    CONS.TABLE_NAME TABLE_NAME, "+
"    COLS.COLUMN_NAME COLUMN_NAME, "+
"    CONS.R_CONSTRAINT_NAME REFERENCE_KEY_NAME, "+
"    CONS_R.TABLE_NAME REFERENCE_TABLE_NAME, "+
"    COLS_R.COLUMN_NAME REFERENCE_COLUMN_NAME "+
"FROM USER_CONSTRAINTS CONS "+
"    LEFT JOIN USER_CONS_COLUMNS COLS ON COLS.CONSTRAINT_NAME = CONS.CONSTRAINT_NAME "+
"    LEFT JOIN USER_CONSTRAINTS CONS_R ON CONS_R.CONSTRAINT_NAME = CONS.R_CONSTRAINT_NAME "+
"    LEFT JOIN USER_CONS_COLUMNS COLS_R ON COLS_R.CONSTRAINT_NAME = CONS.R_CONSTRAINT_NAME "+
"WHERE CONS.CONSTRAINT_TYPE = 'R' "+
"ORDER BY CONS.TABLE_NAME, COLS.COLUMN_NAME";


//console.log("FK Query: " + knex.raw(foreignKeyQuery).toString());

function generateKnexMigrationCode(){
    var fkResults = [];
    return knex.raw(foreignKeyQuery).then(function(results){
        fkResults = results;   
    }).then(function(){ 
        return knex.raw(schemaQuery).then(function(results){
            //console.log(JSON.stringify(results, null, 4));
            //return;
            var curTableName = "";
            var jsOutput = "";
            var fkJsOuput = "";
            var firstTable = true;
            for(var i=0; i < results.length; i++){
                var r = results[i];
                var tableName = r.TABLE_NAME;
                
                if(tableName !== curTableName){
                    if(curTableName != ""){
                        
                        jsOutput += "\n\t});\n";                        
                        jsOutput += "\n}).then(function(){";
                    }else{
                        
                    }
                    
                    jsOutput += "\n\treturn knex.schema.createTable('" + tableName + "', function(table){"
                    
                    curTableName = tableName;
                }
                
                if(r.PRIMARY_KEY === "Y"){
                    jsOutput += "\n\t\ttable.increments('" + r.COLUMN_NAME + "').primary();"
                }else{
                    var dataType = r.DATA_TYPE;
                    var jsColumnOutput = "";
                    if(dataType == "VARCHAR2"){
                        var dataLen = r.DATA_LENGTH;
                        jsColumnOutput += "string('" + r.COLUMN_NAME + "', " + dataLen + ")"
                        
                    }else if(dataType == "NUMBER" || dataType == "NUMERIC"){
                        if(dialect === "oracle"){
                            jsColumnOutput += "specificType('" + r.COLUMN_NAME + "', 'NUMBER')"
                        }else if(dialect === "postgresql"){
                            jsColumnOutput += "specificType('" + r.COLUMN_NAME + "', 'NUMERIC')"                        
                        }
                        
                    }else if(dataType == "CLOB"){
                        jsColumnOutput += "text('" + r.COLUMN_NAME + "')"
                        
                    }else if(dataType == "DATE"){
                        jsColumnOutput += "date('" + r.COLUMN_NAME + "')"
                        
                    }else if(dataType == "TIMESTAMP(6)"){
                        jsColumnOutput += "timestamp('" + r.COLUMN_NAME + "')"
                        
                    }else{
                        console.log("Invalid datatype: " + dataType);
                    }
                    
                    //console.log("Nullable value: " + r.NULLABLE);
                    
                    if(r.NULLABLE == "N"){
                        jsColumnOutput += ".notNullable()";
                    }
                    
                    var fk = _.find(fkResults, function(item){
                        return (item.TABLE_NAME === curTableName && item.COLUMN_NAME === r.COLUMN_NAME); 
                    });
                    
                    if(fk != null){
                        jsColumnOutput += ".references('" + fk.REFERENCE_COLUMN_NAME + "').inTable('" + fk.REFERENCE_TABLE_NAME + "')";
                    }
                    
                    jsColumnOutput += ";";
                    
                    if(fk != null){
                        fkJsOuput += ".then(function(){\n";
                        fkJsOuput += "\treturn knex.schema.table(\"" + curTableName + "\", function(table){\n\t\ttable." + jsColumnOutput;
                        fkJsOuput += "\n\t});\n})";
                    }else{
                        jsOutput += "\n\t\ttable." + jsColumnOutput;
                    }
                }                                
            }
            if(fkJsOuput != ""){
                jsOutput += "\n\t});\n"; 
                jsOutput += "\n})" + fkJsOuput + ";";                
            }else{
                jsOutput += "\n});\n";
            }
            console.log(jsOutput);
        });
    });
}

generateKnexMigrationCode();

//pgMig(knex);


function createUserTable(knex){
    return knex.schema.createTable('user', function(table){
        table.increments('id');
        table.string('username', 256);
        table.string('password', 256);
        table.string('firstName', 256);
        table.string('lastName', 256);
        table.string('email', 256);
        table.string('activationCode', 256);
        table.string('groupName', 256);
        table.string('groupType', 256);
        table.date('lastAccess');
        table.specificType('debugAccess', 'NUMERIC');
        table.specificType('verifiedEmail', 'NUMERIC');
        table.specificType('activated', 'NUMERIC');
        table.string('token', 256);
        table.string('middleName', 256);
        table.string('activeFlag', 1);
        table.string('phoneNumber', 64);
        table.timestamp('dateCreated');
        table.timestamp('dateModified');
        table.string('userAccount', 256);
        table.text('userRestrictionEnzymeGroups');
        });
}

//createUserTable(knex).then(function(){ console.log("Finished Creating user table"); });