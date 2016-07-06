--DEFINE the following at the top of your provisionShema script or pass it in as a parameter 

DEFINE SCHEMA_CODE = 'RC_1_4_3';
DEFINE AWS_RDS = 0;
DEFINE BASE_SCHEMA_FILE = 'baseSchema2016_05_26.sql';

@@provisionSchemaOnly.sql;
--@@schemaDefines.sql;
--@@grantPrivilegesToAppRole.sql;
--@@provisionSchema.sql;
--@@dropSchema.sql