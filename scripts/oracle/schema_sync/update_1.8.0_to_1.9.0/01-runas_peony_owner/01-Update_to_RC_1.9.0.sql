--updates to RC 1.9.0
--Set the following defines appropriately for your instance
--Schema owner needs execute dbms_crypto

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE APP_ROLE = PEONY_APP_ROLE;

@create-assembly_run.sql;
@create-assembly_operation.sql;
@create-assembly_op_output.sql;
@create-assembly_op_input.sql;

@create-z_assembly_run.sql;
@create-z_assembly_operation.sql;
@create-z_assembly_op_output.sql;
@create-z_assembly_op_input.sql;

@create-sequence_j5run.sql;
@create-z_sequence_j5run.sql;

@add-preset_id-j5run.sql;

@add-notificationPref-user.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;