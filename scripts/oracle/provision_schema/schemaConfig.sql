--DEFINE the following at the top of your provisionShema script or pass it in as a parameter 

DEFINE SCHEMA_CODE = 'IDT';
DEFINE AWS_RDS = 1;
DEFINE BASE_SCHEMA_FILE = 'fullSchema_rc_1_7_0.sql';

--@@provisionSchemaOnly.sql;
--@@schemaDefines.sql;
--@@grantPrivilegesToAppRole.sql;
@@provisionSchema.sql;
--@@dropSchema.sql