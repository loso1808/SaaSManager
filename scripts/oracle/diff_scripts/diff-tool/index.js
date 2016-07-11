var _ = require('lodash');
var Promise = require('bluebird');
var connInfo = require('./connection_config.json');
var Table = require('cli-table');
var EzTable = require('easy-table');
var ToTable = require('table').default;
var util = require('util');
var compareDimensions = require('./dimensional-compare.js');
var loadScript = require('./load-sql-script.js');
var runSelfReport = require('./run-self-reports');

var knexLeft = require('knex')(
    connInfo.left
);

var knexRight = require('knex')(
    connInfo.right
);

var rightSchemaName = connInfo.right.connection.user;
var leftSchemaName = connInfo.left.connection.user;

var objectCounts = {};

//console.log("Getting object counts for " + rightSchemaName);


var fnList = [
    getUserObjects,
    getTableColumns,
    getColumnTypes,
    getColumnSize,
    getColumnTypePrecision,
    getColumnTypeScale,
    getColumnDefaults,
    getNullableColumns,
    getColumnDataDefaults,
    getIndexColumnSortDirection,
    getIndexColumns,
    getIndexColumnPosition,
    getIndexTable,
    getConstraints,
    getGeneratedConstraints,
    getForeignKeyDeleteRule,
    getForeignKeyConstraints,
    getPrimaryKeyConstraints,
    getCheckConstraints,
    getConstraintColumns
];

generateDimensions(fnList, knexLeft, knexRight)
.then(compareDimensions)
.then(formatDiffReport2)
.then(log)
.then(done);

// performSelfReport()
// .then(log)
// .then(done);

function test1(){
    var dimensions = { left: [], right: [] };
    getUserObjects(knexRight)
    .then(function (objs) {
        dimensions.right = objs;
        return getUserObjects(knexLeft);
    })
    .then(function (objs) {
        dimensions.left = objs;
        console.log(util.inspect(dimensions));
        var compareResult = compareDimensions(dimensions.left, dimensions.right);

        console.log(util.inspect(compareResult, false, 12));
    });
}

function log(msg) {
    var str = "";
    if(_.isString(msg)){
        str = msg;
    }else{
        str = util.inspect(msg, true, 12);
    }
    console.log(str);
}

function performSelfReport(){
    return runSelfReport(knexLeft, knexRight);
}

function generateDimensions(fnList, knexLeft, knexRight){
    var dimensions = { left: [], right: [] };
    var collectFns = _.map(fnList, function (fn) {
        return (function(){
            console.log('Executing ' + fn.name);
            return collectBothDimensions(fn, knexLeft, knexRight)
                .then(function (result) {
                    dimensions.left = dimensions.left.concat(result.left);
                    dimensions.right = dimensions.right.concat(result.right);
                    console.log('Done executing ' + fn.name);
                });
        })();
    });
    return Promise.all(collectFns)
    .then(function (result) {
        console.log("Done Executing Queries");
        return dimensions;
    });
}

function collectBothDimensions(fn, knexLeft, knexRight){
    var dimensions = { left: [], right: [] };
    var fns = [];
            
    fns.push(collectDimensionalData(dimensions.left, fn, knexLeft)
            .then(function (result) {
                console.log("Got " + fn.name + " for " + leftSchemaName);
                dimensions.left = result;
            }));

    fns.push(collectDimensionalData(dimensions.right, fn, knexRight)
            .then(function (result) {
                console.log("Got " + fn.name + " for " + rightSchemaName);
                dimensions.right = result;
            }));

    return Promise.all(fns)
            .then(function () {
                return dimensions;
            });
    // return collectDimensionalData(dimensions.left, fn, knexLeft)
    //        .then(function (result) {
    //            dimensions.left = result;
    //            return collectDimensionalData(dimensions.right, fn, knexRight);
    //        })
    //        .then(function (result) {
    //            dimensions.right = result;
    //            return dimensions;
    //        });
}

function collectDimensionalData(dimension, fn, knex){
    dimension = dimension || [];
    return fn(knex)
           .then(function(result){
               dimension = dimension.concat(result);
               return dimension;
           });
}



function getUserObjectCount(knex){
    return knex("USER_OBJECTS")
           .count("OBJECT_ID as TOTAL")
           .then(function(result){
               return result;
           });
}

function getUserObjects(knex){
    return knex("USER_OBJECTS")
           .select('OBJECT_NAME', 'OBJECT_TYPE')
           .where({GENERATED: 'N', TEMPORARY: 'N'});
}

function getUserTabCols(knex){
    //var schemaName = getSchemaName(knex);
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "DATA_TYPE", "DATA_LENGTH", "DATA_PRECISION", "DATA_SCALE", "NULLABLE", "DEFAULT_ON_NULL")
           .where({USER_GENERATED: 'YES'});
        //    .then(function(results){
        //         results.forEach(function (item) {
        //         //    if(item.DATA_DEFAULT){
        //         //        item.DATA_DEFAULT = item.DATA_DEFAULT.replace('"' + schemaName + '".','');
        //         //    } 
        //            return results;
        //         });
        //     });
}

function getTableColumns(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME")
           .where({USER_GENERATED: 'YES'});
}

function getColumnTypes(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "DATA_TYPE")
           .where({USER_GENERATED: 'YES'});
}

function getColumnSize(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "DATA_LENGTH")
           .where({USER_GENERATED: 'YES'});
}

function getColumnTypeScale(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "DATA_SCALE")
           .where({USER_GENERATED: 'YES'});
}

function getColumnTypePrecision(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "DATA_PRECISION")
           .where({USER_GENERATED: 'YES'});
}

function getNullableColumns(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "NULLABLE")
           .where({USER_GENERATED: 'YES'});
}

function getColumnDefaults(knex){
    return knex("USER_TAB_COLS")
           .select("TABLE_NAME", "COLUMN_NAME", "DEFAULT_ON_NULL")
           .where({USER_GENERATED: 'YES'});
}

function getColumnDataDefaults(knex){
    return knex.raw(
                "SELECT " + 
                "    TABLE_NAME, COLUMN_NAME, REPLACE(DATA_DEFAULT, '\"' || sys_context( 'userenv', 'current_schema' ) || '\".', '' ) DATA_DEFAULT " + 
                "FROM " +  
                    "(SELECT " + 
                    "    dbms_xmlgen.getxmltype('select TABLE_NAME, COLUMN_NAME, DATA_DEFAULT from user_tab_cols where user_generated = ''YES''') utc " +
                    "FROM dual) dd, " +
                    "XMLTABLE('/ROWSET/ROW' PASSING dd.utc " +
                    "          COLUMNS " + 
                    "                \"TABLE_NAME\" VARCHAR2(30) PATH 'TABLE_NAME', " +
                    "                \"COLUMN_NAME\" VARCHAR2(30) PATH 'COLUMN_NAME', " + 
                    "                \"DATA_DEFAULT\" VARCHAR2(4000) PATH 'DATA_DEFAULT') ");
}

function getIndexColumnSortDirection(knex){
    return knex.raw(
        "select " +
        "    uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME, uic.COLUMN_POSITION, uic.DESCEND " +
        "from " + 
        "    user_objects uo " +
        "        inner join " + 
        "    user_ind_columns uic " +
        "        on uo.object_name = uic.index_name " +    
        "where " +
        "    uo.object_type = 'INDEX' "+ 
        "    and uo.generated = 'N'"
    );
}

function getIndexColumns(knex){
    return knex.raw(
        "select " +
        "    uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME " +
        "from " + 
        "    user_objects uo " +
        "        inner join " + 
        "    user_ind_columns uic " +
        "        on uo.object_name = uic.index_name " +    
        "where " +
        "    uo.object_type = 'INDEX' "+ 
        "    and uo.generated = 'N'"
    );
}

function getIndexColumnPosition(knex){
    return knex.raw(
        "select " +
        "    uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME, uic.COLUMN_POSITION " +
        "from " + 
        "    user_objects uo " +
        "        inner join " + 
        "    user_ind_columns uic " +
        "        on uo.object_name = uic.index_name " +    
        "where " +
        "    uo.object_type = 'INDEX' "+ 
        "    and uo.generated = 'N'"
    );
}

function getIndexTable(knex){
    return knex.raw(
        "select " +
        "    uic.INDEX_NAME, uic.TABLE_NAME " +
        "from " + 
        "    user_objects uo " +
        "        inner join " + 
        "    user_ind_columns uic " +
        "        on uo.object_name = uic.index_name " +    
        "where " +
        "    uo.object_type = 'INDEX' "+ 
        "    and uo.generated = 'N'"
    );
}

function getConstraints(knex){
    return knex.raw(
        "select " +
        "    CONSTRAINT_NAME, TABLE_NAME " +
        "from " +
        "    user_constraints " + 
        "where " +
        "    generated = 'USER NAME'"
    );
}

function getGeneratedConstraints(knex){
    return knex.raw(
        "select " +
        "    'GENERATED NAME' CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE, STATUS, R_OWNER, R_CONSTRAINT_NAME, DELETE_RULE, INDEX_NAME, SEARCH_CONDITION_VC " +
        "from " +
        "    user_constraints " + 
        "where " +
        "    generated <> 'USER NAME'"
    );
}

function getForeignKeyConstraints(knex){
    return knex.raw(
        "select " +
        "   CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME "+
        "from " +
        "    user_constraints " + 
        "where " +
        "    generated = 'USER NAME' " +
        "    and constraint_type = 'R'"
    );

}

function getForeignKeyDeleteRule(knex){
    return knex.raw(
        "select " +
        "    CONSTRAINT_NAME, TABLE_NAME, DELETE_RULE "+
        "from " +
        "    user_constraints " + 
        "where " +
        "    generated = 'USER NAME' " +
        "    and constraint_type = 'R'"
    );
}

function getPrimaryKeyConstraints(knex){
    return knex.raw(
        "select " +
        "    CONSTRAINT_NAME, TABLE_NAME, INDEX_NAME "+
        "from " +
        "    user_constraints " + 
        "where " +
        "    generated = 'USER NAME' " +
        "    and constraint_type = 'P'"
    );
}

function getCheckConstraints(knex) {
    return knex.raw(
        "select " +
        "    CONSTRAINT_NAME, TABLE_NAME, SEARCH_CONDITION_VC "+
        "from " +
        "    user_constraints " + 
        "where " +
        "    generated = 'USER NAME' " +
        "    and constraint_type = 'C'"
    );
}

function getConstraintColumns(knex){
    return knex.raw(
        "select CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME from user_cons_columns where constraint_name not like 'SYS\\_%' escape '\\'"
    );
}

function getSchemaName(knex){
    return knex.client.config.connection.user;
}

function formatDiffReport(compareResult) {
    var reportStr = "";
    if(compareResult.leftDiff.length === 0){
        reportStr += "No Left Side Differences\n\n";
    }else{
        reportStr += "Left Side Differences (" + compareResult.leftDiff.length + ")\n--------------------------------\n";
        compareResult.leftDiff.forEach(function (item) {
            reportStr += item + "\n";
        });
    }

    reportStr += "\n==============================\n\n";

    if(compareResult.rightDiff.length === 0){
        reportStr += "No Right Side Differences\n\n";
    }else{
        reportStr += "Right Side Differences (" + compareResult.rightDiff.length + ")\n--------------------------------\n";
        compareResult.rightDiff.forEach(function (item) {
            reportStr += item + "\n";
        });
    }

    reportStr += "Total Differences: " + (compareResult.rightDiff.length + compareResult.leftDiff.length) + "\n";

    return reportStr;
}

function formatDiffReport2(compareResult) {
    var reportStr = "";

    var headerRow = [ leftSchemaName, rightSchemaName ];
    var reportRows = [headerRow];

    var leftDiff = compareResult.leftDiff.slice(0);
    var rightDiff = compareResult.rightDiff.slice(0);

    leftDiff.forEach(function (item) {
       var arr = item.split('/');
       var pathCount = arr.length;
       arr.pop();
       arr.pop();
       var dimPath = arr.join('/');
       var rightMatch = "(missing)";
       var idx = _.findIndex(rightDiff,function (val) {
           var valPathCount = val.split('/').length;
           return (_.startsWith(val, dimPath) && pathCount == valPathCount); 
       });
       if(idx > -1){
           rightMatch = _.pullAt(rightDiff, idx);
       }
       reportRows.push([item, rightMatch]);
    });

    rightDiff.forEach(function (item) {
        reportRows.push(["(missing)", item]);
    });

    //var table = new Table({ head: headerRow });

    // reportRows.forEach(function (row) {
    //     table.push(row); 
    // });
    var config = {
                    columns: {
                        0: {
                            width: 80,
                            wrapWord: true
                        },
                        1: {
                            width: 80,
                            wrapWord: true
                        }
                    }
                };

    reportStr += ToTable(reportRows, config);
    reportStr += "\n\nTotal Differences: " + (reportRows.length - 1) + "\n";

    return reportStr;
}

function done(){
    console.log("Done!");
    process.exit();
}