var _ = require('lodash');
var Promise = require('bluebird');

module.exports = function(knexLeft, knexRight, options){
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

    return generateDimensions(fnList, knexLeft, knexRight);

    function getSchemaName(knex){
        return knex.client.config.connection.user;
    }

    function generateDimensions(fnList, knexLeft, knexRight){
        var dimensions = { left: [], right: [] };
        var collectFns = _.map(fnList, function (fn) {
            return (function(){
                console.log('Executing ' + fn.name);
                return collectBothDimensions(fn, knexLeft, knexRight)
                    .then(function (result) {
                        dimensions.left = dimensions.left.concat(result.left);
                        if(knexRight){
                            dimensions.right = dimensions.right.concat(result.right);
                        }
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

        var leftSchemaName = getSchemaName(knexLeft);

        fns.push(collectDimensionalData(dimensions.left, fn, knexLeft)
                .then(function (result) {
                    console.log("Got " + fn.name + " for " + leftSchemaName);
                    dimensions.left = result;
                }));

        if(knexRight){
            var rightSchemaName = getSchemaName(knexRight);

            fns.push(collectDimensionalData(dimensions.right, fn, knexRight)
                    .then(function (result) {
                        console.log("Got " + fn.name + " for " + rightSchemaName);
                        dimensions.right = result;
                    }));    
        }

        return Promise.all(fns)
                .then(function () {
                    return dimensions;
                });
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

}