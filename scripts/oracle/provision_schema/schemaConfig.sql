--DEFINE the following at the top of your provisionShema script or pass it in as a parameter 

DEFINE SCHEMA_CODE = 'RC_1_19_0';
DEFINE AWS_RDS = 0;
DEFINE BASE_SCHEMA_FILE = 'rc_1_9_0_snapshot_owner_schema.sql';

@@provisionSchemaOnly.sql;
--@@schemaDefines.sql;
--@@grantPrivilegesToAppRole.sql;
--@@provisionSchema.sql;
--@@dropSchema.sql