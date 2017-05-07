--updates to RC 1.17.0 for SaaS Clients
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_RC_1_19_0_DBO;
DEFINE APP_ROLE = PNY_RC_1_19_0_AR;

--fix parts feature type
@@add_columns.sql;

--recreate sequence on defaults
@@recreate_seqnextval.sql;

--recreate dateLogged on defaults
@@modify-dateLogged.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;
