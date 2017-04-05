--updates to RC 1.11.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_PGENETICS_DBO;
DEFINE APP_ROLE = PNY_PGENETICS_AR;

--add Is Shared Columns to library tables
@@addIsShared.sql;

--add Name Template to Next Level Parts
@@addNameTemplate.sql;

--add sequence index to part table
@@addPartSequenceIdx.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;
EXIT;
