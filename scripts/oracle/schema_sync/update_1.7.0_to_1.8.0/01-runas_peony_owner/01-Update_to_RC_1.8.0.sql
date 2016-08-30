--updates to RC 1.8.0
--Set the following defines appropriately for your instance
--Schema owner needs execute dbms_crypto

DEFINE SCHEMA_OWNER_NAME = PNY_ARZEDA_DBO;
DEFINE APP_ROLE = PNY_ARZEDA_APP;

--create tag access tables
@@create_tag_access.sql;
@@create_z_tag_access.sql;

--add the user id to custom_field and custom_field_value tables
@@add_user_id_custom_field.sql;

--logSessionId for z_custom_field_value was created with the wrong type; modify it to be correct
@@modify-logSessionId.sql;

--fix parts that were orphaned by a bug in the last release
@@fix_orphaned_custom_fields.sql;

--fix orphaned custom fields that were orphaned by a bug in the last release
@@fix_orphaned_parts.sql;

--recalculate sequence hashes --NOTE: schema owner must have privileges on dbms_crypto package
@@recalculate_sequence_hashes.sql;

--modifies dateLogged in the log tables to default on null to sysdate
@@modify-dateLogged.sql;

--recreates the DATA_DEFAULT on all primary keys to DEFAULT ON NULL to seq.NEXTVAL
@@recreate_seqnextval.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;