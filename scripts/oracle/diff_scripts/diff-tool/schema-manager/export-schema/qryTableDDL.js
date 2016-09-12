

module.exports = function(tableName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('TABLE',:tableName,:schemaName) DDL from dual",
        bindings: [tableName, schemaName]
    };
}