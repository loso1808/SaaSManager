--updates to RC 1.11.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE APP_ROLE = PEONY_APP_ROLE;

--add Is Shared Columns to library tables
@@addIsShared.sql;

--add Name Template to Next Level Parts
@@addNameTemplate.sql;

--add sequence index to part table
@@addPartSequenceIdx.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;