--updates to RC 1.17.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_RC_QA_DBO;
DEFINE APP_ROLE = PNY_RC_QA_AR;

--add privileges columns
@@add_columns.sql

--modify j5 output naming template activity log pk
--@@rename_j5_output_naming_pk.sql;

--add completeProfile column to user
--@@add_completeProfile_to_user.sql;

--add user logs table
--@@add_user_logs.sql;

--recreate sequence on defaults
@@recreate_seqnextval.sql;

--recreate dateLogged on defaults
@@modify-dateLogged.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;