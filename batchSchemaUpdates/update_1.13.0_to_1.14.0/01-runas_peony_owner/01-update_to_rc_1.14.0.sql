--updates to RC 1.14.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE APP_ROLE = PEONY_APP_ROLE;

--add filesystem tables
@@create_filesystem.sql;

--add dd_projects table
@@create_dd_project.sql;

--create design wide next level parts tag table
@@create_design_nlp_tag.sql;

--add j5run condense assembly fields
@@add_j5run_batch_changes.sql;

--create new foreign keys
@@create_fks.sql;

--modify existing foreign keys
@@modify_fks.sql;

--recreate sequence on defaults
@@recreate_seqnextval.sql;

--recreate dateLogged on defaults
@@modify-dateLogged.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;
EXIT;