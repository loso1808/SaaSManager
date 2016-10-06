--updates to RC 1.10.0
--Set the following defines appropriately for your instance

DEFINE SCHEMA_OWNER_NAME = PNY_DOCKER_DBO;
DEFINE APP_ROLE = PNY_DOCKER_AR;

--Recreate the assembly operation tables
@drop_assembly_operation_tables.sql;
@create_assembly_operation_tables.sql;

--create new j5run_construct and part_tag tables
@create_j5run_construct_and_part_tag.sql;

--modify column types for several existing columns
@modify_column_types.sql;

--fix primary key definition on z_design_ruleset and z_sequence_j5run
@fix_z_design_ruleset.sql;
@fix_z_sequence_j5run.sql;

--add new columns
@add_new_columns.sql;

--add new foreign keys
@add_foreign_keys.sql;

--grant privileges on new objects to app role
@@grantPrivilegesToAppRole.sql;

COMMIT;