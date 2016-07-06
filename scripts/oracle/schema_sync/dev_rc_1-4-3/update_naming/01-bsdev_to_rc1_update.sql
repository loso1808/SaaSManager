--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_DEV_1_4_3_DBO;
DEFINE APP_ROLE = PNY_DEV_1_4_3_AR;

--run validation
@@validate_naming.sql;

--disable foreign keys
@@disable_foreign_keys.sql;

--drop extraneous tables
@@drop_extraneous_tables.sql;
@@drop_extraneous_columns.sql;

--drop triggers
@@drop_triggers.sql;

--drop sequences
@@drop_sequences.sql;

--rename primary keys
@@rename_primary_keys.sql;

--rename primary key indexes
@@rename_pk_indexes.sql;

--recreate sequences
@@recreate_sequences.sql;

--create default on null nextval
@@recreate_seqnextval.sql;

--apply schema patches
--@@schema_patches_rc1.sql;

--rename foreign keys
@@rename_foreign_keys.sql;

--enable foreign keys
@@enable_foreign_keys.sql;

--re-grant privileges to app_role
@@grantPrivilegesToAppRole.sql;

--validate changes
@@validate_naming.sql;


