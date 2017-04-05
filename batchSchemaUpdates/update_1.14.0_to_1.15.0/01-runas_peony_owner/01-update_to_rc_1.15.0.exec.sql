--updates to RC 1.15.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_INTREXON_DBO;
DEFINE APP_ROLE = PNY_INTREXON_AR;

--add j5 output naming template
@@create_j5_output_template.sql;

--add columns to devicedesign and j5run
@@add_columns.sql;

--recreate sequence on defaults
@@recreate_seqnextval.sql;

--recreate dateLogged on defaults
@@modify-dateLogged.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;
quit
