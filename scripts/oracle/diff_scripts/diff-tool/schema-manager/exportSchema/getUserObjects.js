
var QueryRunner = require('./queryRunner');

module.exports = function (dbConn, schemaName, opts){
    var runQuery = QueryRunner(dbConn);
    return runQuery(qryUserObjects(schemaName));

    function qryUserObjects(schemaName){
        return {
            cmd: "SELECT OBJECT_NAME, OBJECT_TYPE, NULL TABLE_NAME FROM all_objects where owner = :1 and GENERATED = 'N' and OBJECT_TYPE <> 'INDEX' " +
                "union all " +
                "select CONSTRAINT_NAME, 'CONSTRAINT', TABLE_NAME from all_constraints where CONSTRAINT_TYPE = 'C' AND owner = :2 AND (SEARCH_CONDITION_VC NOT LIKE '%IS NOT NULL%' OR SEARCH_CONDITION_VC IS NULL) " +
                "union all " +
                "select CONSTRAINT_NAME, 'CONSTRAINT', TABLE_NAME from all_constraints where CONSTRAINT_TYPE = 'P' AND owner = :3 " +
                "union all " +
                "select CONSTRAINT_NAME, 'REF_CONSTRAINT', TABLE_NAME from all_constraints where CONSTRAINT_TYPE = 'R' AND owner = :4 " +
                "union all " +
                "select INDEX_NAME, 'INDEX', TABLE_NAME from all_indexes where GENERATED = 'N' AND owner = :5 ",
            bindings: [schemaName, schemaName, schemaName, schemaName, schemaName]
        };
    }
}