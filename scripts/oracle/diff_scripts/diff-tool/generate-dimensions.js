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

    if(options.diffSynonymDependents){
        var leftSchemaOwner, rightSchemaOwner;

        return getSchemaOwnerFromSynonym(knexLeft)
               .then(function (result) {
                   leftSchemaOwner = result;
                   if(knexRight){
                       return getSchemaOwnerFromSynonym(knexRight)
                              .then(function (result) {
                                 rightSchemaOwner = result;
                                 return Promise.resolve(); 
                              });
                   }else{
                       return Promise.resolve();
                   }
               })
               .then(function () {
                   return generateDimensions(fnList, knexLeft, knexRight, leftSchemaOwner, rightSchemaOwner);
               })
               .catch(function (err) {
                   console.error("Error generating dimensions");
                   console.error(err);
                   throw err;
               });
    }else{
        return generateDimensions(fnList, knexLeft, knexRight);
    }

    function getSchemaName(knex){
        return knex.client.config.connection.user;
    }

    function generateDimensions(fnList, knexLeft, knexRight, leftSchemaOwner, rightSchemaOwner){
        var dimensions = { left: [], right: [] };
        var collectFns = _.map(fnList, function (fn) {
            var collectForFn = function(){
                console.log('Executing ' + fn.name);
                return collectBothDimensions(fn, knexLeft, knexRight, leftSchemaOwner, rightSchemaOwner)
                    .then(function (result) {
                        dimensions.left = dimensions.left.concat(result.left);
                        if(knexRight){
                            dimensions.right = dimensions.right.concat(result.right);
                        }
                        console.log('Done executing ' + fn.name);
                        return Promise.resolve();
                    })
                    .catch(function (err) {
                        console.error("Error executing dimensional collection");
                        console.error(err);
                    });
            };

            return collectForFn()
                    .catch(function (err) {
                        console.error("Error executing collectForFn");
                        console.error(err);
                    });;
        });
        return Promise.all(collectFns)
        .then(function (result) {
            console.log("Done Executing Queries");
            return Promise.resolve(dimensions);
        })
        .catch(function (err) {
            console.error("Error generating dimensional data");
            console.error(err);
            console.error(err.stack);
        });
    }

    function collectBothDimensions(fn, knexLeft, knexRight, leftSchemaOwner, rightSchemaOwner){
        var dimensions = { left: [], right: [] };
        var leftDimension = [];
        var rightDimension = [];
        var fns = [];
        var leftSchemaType, rightSchemaType;
        var leftSchemaName = getSchemaName(knexLeft);

        if(leftSchemaOwner){
            //leftSchemaType = "owner";
            fns.push(collectDimensionalData(fn, knexLeft, leftSchemaName, "owner")
                    .then(function (result) {
                        console.log("Got " + fn.name + " for " + leftSchemaName);
                        leftDimension.push(result);
                        return Promise.resolve();
                        //dimensions.left = result;
                    })
                    .catch(function (err) {
                        console.error("Error collecting dimensional data");
                        console.error(err);
                    }));
            //leftSchemaType = "app";
        }

        fns.push(collectDimensionalData(fn, knexLeft, leftSchemaName, "app")
                .then(function (result) {
                    console.log("Got " + fn.name + " for " + leftSchemaName);
                    leftDimension.push(result);
                    return Promise.resolve();
                })
                .catch(function (err) {
                    console.error("Error collecting dimensional data");
                    console.error(err);
                }));

        if(knexRight){
            var rightSchemaName = getSchemaName(knexRight);
            
            if(rightSchemaOwner){
                rightSchemaType = "owner";
                fns.push(collectDimensionalData(fn, knexRight, rightSchemaName, "owner")
                        .then(function (result) {
                            console.log("Got " + fn.name + " for " + rightSchemaName);
                            rightDimension.push(result);
                            return Promise.resolve();
                        })
                        .catch(function (err) {
                            console.error("Error collecting dimensional data");
                            console.error(err);
                        }));
                rightSchemaType = "app";
            }

            fns.push(collectDimensionalData(fn, knexRight, rightSchemaName, "app")
                    .then(function (result) {
                        console.log("Got " + fn.name + " for " + rightSchemaName);
                        rightDimension.push(result);
                        return Promise.resolve();
                    })
                    .catch(function (err) {
                        console.error("Error collecting dimensional data");
                        console.error(err);
                    }));    
        }

        return Promise.all(fns)
                .then(function () {
                    leftDimension.forEach(function (item) {
                        dimensions.left = dimensions.left.concat(item); 
                    });

                    rightDimension.forEach(function (item) {
                        dimensions.right = dimensions.right.concat(item); 
                    });

                    return Promise.resolve(dimensions);
                })
                .catch(function (err) {
                    console.error("Error returning dimensions");
                    console.error(err);
                });
    }

    function collectDimensionalData(fn, knex, schemaName, schemaType){
        return fn(knex, schemaName)
            .then(function(result){
                if(schemaType){
                    result = addPropsToAll({ SCHEMA_TYPE: schemaType }, result);
                }
                return Promise.resolve(result);
            });
    }

    function getSchemaOwnerFromSynonym(knex){
        var schemaName = getSchemaName(knex);
        return knex("USER_SYNONYMS")
               .select("TABLE_OWNER")
               .limit(1)
               .then(function (result) {
                    console.log("Get user synonyms");
                    console.log(JSON.stringify(result, null, 4));
                   if(result.length == 0){
                       var errMsg = "No synonyms found in " + schemaName + " to autodetect schema owner name!";
                       console.error(errMsg);
                       throw new Error(errMsg);
                   }
                   return Promise.resolve(result[0]["TABLE_OWNER"]);
               });
    }

    // function getUserObjectCount(knex, schemaName){
    //     schemaName = schemaName || getSchemaName(knex);
    //     return knex("ALL_OBJECTS")
    //         .count("OBJECT_ID as TOTAL")
    //         .where({ "OWNER": schemaName })
    //         .then(function(result){
    //             return result;
    //         });
    // }

    function getUserObjects(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_OBJECTS")
            .select('OBJECT_NAME', 'OBJECT_TYPE')
            .where({GENERATED: 'N', TEMPORARY: 'N', OWNER: schemaName })
            .orderBy("OBJECT_NAME","desc");
    }

    function getUserTabCols(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "DATA_TYPE", "DATA_LENGTH", "DATA_PRECISION", "DATA_SCALE", "NULLABLE", "DEFAULT_ON_NULL")
            .where({USER_GENERATED: 'YES', OWNER: schemaName });
    }

    function getTableColumns(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME")
            .where({USER_GENERATED: 'YES', OWNER: schemaName});
    }

    function getColumnTypes(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "DATA_TYPE")
            .where({USER_GENERATED: 'YES', OWNER: schemaName});
    }

    function getColumnSize(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "DATA_LENGTH")
            .where({USER_GENERATED: 'YES', OWNER: schemaName});
    }

    function getColumnTypeScale(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "DATA_SCALE")
            .where({USER_GENERATED: 'YES', OWNER: schemaName });
    }

    function getColumnTypePrecision(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "DATA_PRECISION")
            .where({USER_GENERATED: 'YES', OWNER: schemaName});
    }

    function getNullableColumns(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "NULLABLE")
            .where({USER_GENERATED: 'YES', OWNER: schemaName });
    }

    function getColumnDefaults(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex("ALL_TAB_COLS")
            .select("TABLE_NAME", "COLUMN_NAME", "DEFAULT_ON_NULL")
            .where({USER_GENERATED: 'YES', OWNER: schemaName });
    }

    function getColumnDataDefaults(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
                    "SELECT " + 
                    "    TABLE_NAME, COLUMN_NAME, REPLACE(DATA_DEFAULT, '\"' || '" + schemaName + "' || '\".', '' ) DATA_DEFAULT " + 
                    "FROM " +  
                        "(SELECT " + 
                        "    dbms_xmlgen.getxmltype('select TABLE_NAME, COLUMN_NAME, DATA_DEFAULT from all_tab_cols where user_generated = ''YES'' and OWNER = ''" + schemaName + "'' ') utc " +
                        "FROM dual) dd, " +
                        "XMLTABLE('/ROWSET/ROW' PASSING dd.utc " +
                        "          COLUMNS " + 
                        "                \"TABLE_NAME\" VARCHAR2(30) PATH 'TABLE_NAME', " +
                        "                \"COLUMN_NAME\" VARCHAR2(30) PATH 'COLUMN_NAME', " + 
                        "                \"DATA_DEFAULT\" VARCHAR2(4000) PATH 'DATA_DEFAULT') ");
    }

    function getIndexColumnSortDirection(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME, uic.COLUMN_POSITION, uic.DESCEND " +
            "from " + 
            "    all_objects uo " +
            "        inner join " + 
            "    all_ind_columns uic " +
            "        on uo.object_name = uic.index_name " +    
            "where " +
            "    uo.object_type = 'INDEX' "+ 
            "    and uo.generated = 'N' " +
            "    and uo.owner = '" + schemaName + "'"
        );
    }

    function getIndexColumns(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME " +
            "from " + 
            "    all_objects uo " +
            "        inner join " + 
            "    all_ind_columns uic " +
            "        on uo.object_name = uic.index_name " +    
            "where " +
            "    uo.object_type = 'INDEX' "+ 
            "    and uo.generated = 'N' " +
            "    and uo.owner = '" + schemaName + "'"
        );
    }

    function getIndexColumnPosition(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME, uic.COLUMN_POSITION " +
            "from " + 
            "    all_objects uo " +
            "        inner join " + 
            "    all_ind_columns uic " +
            "        on uo.object_name = uic.index_name " +    
            "where " +
            "    uo.object_type = 'INDEX' "+ 
            "    and uo.generated = 'N' " +
            "    and uo.owner = '" + schemaName + "'"
        );
    }

    function getIndexTable(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    uic.INDEX_NAME, uic.TABLE_NAME " +
            "from " + 
            "    all_objects uo " +
            "        inner join " + 
            "    all_ind_columns uic " +
            "        on uo.object_name = uic.index_name " +    
            "where " +
            "    uo.object_type = 'INDEX' "+ 
            "    and uo.generated = 'N' " +
            "    and uo.owner = '" + schemaName + "'"
        );
    }

    function getConstraints(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    CONSTRAINT_NAME, TABLE_NAME " +
            "from " +
            "    all_constraints " + 
            "where " +
            "    generated = 'USER NAME' " +
            "    and owner = '" + schemaName + "'"
        );
    }

    function getGeneratedConstraints(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    'GENERATED NAME' CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE, STATUS, R_OWNER, R_CONSTRAINT_NAME, DELETE_RULE, INDEX_NAME, SEARCH_CONDITION_VC " +
            "from " +
            "    all_constraints " + 
            "where " +
            "    generated <> 'USER NAME' " +
            "    and owner = '" + schemaName + "'"
        );
    }

    function getForeignKeyConstraints(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "   CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME "+
            "from " +
            "    all_constraints " + 
            "where " +
            "    generated = 'USER NAME' " +
            "    and constraint_type = 'R' " +
            "    and owner = '" + schemaName + "'"
        );

    }

    function getForeignKeyDeleteRule(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    CONSTRAINT_NAME, TABLE_NAME, DELETE_RULE "+
            "from " +
            "    all_constraints " + 
            "where " +
            "    generated = 'USER NAME' " +
            "    and constraint_type = 'R' " +
            "    and owner = '" + schemaName + "'"
        );
    }

    function getPrimaryKeyConstraints(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    CONSTRAINT_NAME, TABLE_NAME, INDEX_NAME "+
            "from " +
            "    all_constraints " + 
            "where " +
            "    generated = 'USER NAME' " +
            "    and constraint_type = 'P' " +
            "    and owner = '" + schemaName + "'"
        );
    }

    function getCheckConstraints(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    CONSTRAINT_NAME, TABLE_NAME, SEARCH_CONDITION_VC "+
            "from " +
            "    all_constraints " + 
            "where " +
            "    generated = 'USER NAME' " +
            "    and constraint_type = 'C' " +
            "    and owner = '" + schemaName + "'"
        );
    }

    function getConstraintColumns(knex, schemaName){
        schemaName = schemaName || getSchemaName(knex);
        return knex.raw(
            "select " +
            "    CONSTRAINT_NAME, " + 
            "    TABLE_NAME, " +
            "    COLUMN_NAME " +
            "from " +
            "    all_cons_columns " +
            "where " +
            "    constraint_name not like 'SYS\\_%' escape '\\' " +
            "    and owner = '" + schemaName + "'"
        );
    }

    function addPropsToAll(props, col){
        return _.map(col, function (item) {
            return _.assign(props, item);
        });
    }

}