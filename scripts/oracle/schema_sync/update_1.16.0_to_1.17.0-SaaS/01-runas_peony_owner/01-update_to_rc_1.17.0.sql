--updates to RC 1.17.0 for SaaS Clients
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE APP_ROLE = PEONY_APP_ROLE;

--change design ruleset column types
@@design_ruleset_type_change.sql;

--drop design ruleset columns
@@dropDesignRulesetColumns.sql;

--change user group columns to lab
@@changeUserColumnNames.sql;

--add privileges columns
@@add_columns.sql

--fix user logs type
@@fix_user_logs_type.sql;

--recreate sequence on defaults
@@recreate_seqnextval.sql;

--recreate dateLogged on defaults
@@modify-dateLogged.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;