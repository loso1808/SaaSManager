--updates to RC 1.4.3
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_RC_1_4_3_DBO;
DEFINE APP_ROLE = PNY_RC_1_4_3_AR;

--drops old custom fields table and migrated user preseferences log columns
@@drop_extraneous_objects.sql;

--creates new tables
@@create_tables.sql;

--fix defaultDate data type
@@alter_default_date_type.sql;

--modifies dateLogged in the log tables to default on null to sysdate
@@modify-dateLogged.sql;

--recreates the DATA_DEFAULT on all primary keys to DEFAULT ON NULL to seq.NEXTVAL
@@recreate_seqnextval.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;