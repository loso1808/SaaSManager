--updates to RC 1.11.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE APP_ROLE = PEONY_APP_ROLE;

--Create new next level part tables
@addNextLevelPart.sql;

--Add new columns
@addNewColumns.sql;

--Add indexes to various tables
@addIndexes.sql;

--add new foreign keys
@fixForeignKey.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;