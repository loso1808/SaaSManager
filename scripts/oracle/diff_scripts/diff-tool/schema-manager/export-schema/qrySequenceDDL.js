
module.exports = function(sequenceName, schemaName){
    return {
        fn: "query",
        cmd: "select dbms_metadata.get_ddl('SEQUENCE',:sequenceName,:schemaName) DDL from dual",
        bindings: [sequenceName, schemaName]
    };
}