--Bring SFDEV in Sync with RC 1.4.3

--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_SFDEV_DBO;
DEFINE APP_ROLE = PNY_SFDEV_AR;
DEFINE LOG_TABLESPACE_NAME = PNY_SFDEV_LOG;

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

@@sfdev_patch.sql;

--rename primary keys
@@rename_primary_keys.sql;

--rename primary key indexes
@@rename_pk_indexes.sql;

--recreate sequences
@@recreate_sequences.sql;

--create default on null nextval
@@recreate_seqnextval.sql;

--rename foreign keys
@@rename_foreign_keys.sql;


@@add-missing-log-tables.sql;

@@add-missing-log-columns.sql;

@@modify-dateLogged.sql;

@@modify-dateLogged-not-null.sql;


--enable foreign keys
@@enable_foreign_keys.sql;

--validate changes
@@validate_naming.sql;
