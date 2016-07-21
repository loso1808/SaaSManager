
ALTER SESSION SET CURRENT_SCHEMA = &&SCHEMA_OWNER_NAME;

--create base tables
@@&&BASE_SCHEMA_FILE;

--create activity summery tables
@@createActivitySummaryTables.sql;