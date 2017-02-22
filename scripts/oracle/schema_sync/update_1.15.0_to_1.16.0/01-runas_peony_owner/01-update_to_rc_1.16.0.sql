--updates to RC 1.16.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE APP_ROLE = PEONY_APP_ROLE;

--modify j5 output naming template activity log pk
@@rename_j5_output_naming_pk.sql;

--add completeProfile column to user
@@add_completeProfile_to_user.sql;

--recreate sequence on defaults
@@recreate_seqnextval.sql;

--recreate dateLogged on defaults
@@modify-dateLogged.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;