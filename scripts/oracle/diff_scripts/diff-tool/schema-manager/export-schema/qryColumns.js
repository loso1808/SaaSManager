

module.exports = function(schemaName, tableName){
    return {
        cmd: "SELECT COLUMN_NAME FROM all_tab_cols where owner = :owner and TABLE_NAME = :tableName order by COLUMN_ID",
        bindings: [schemaName, tableName]
    };
}
