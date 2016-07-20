SET SERVEROUTPUT ON;

--Defines replacement values such as SCHEMA_OWNER_NAME, TABLESPACE_NAME, etc..
@@schemaDefines.sql; 

--Create the tablespaces
@@&&PROVISION_TABLESPACE;

--Create the schema owner user and set password
@@createSchemaUser.sql;

--GRANT privileges to allow the new schema owner user to connect and create objects
@@grantOwnerPrivileges.sql;

--Create the app role and grant privileges
@@createAppRole.sql;

--Create the app user and add to app role
@@createAppUser.sql;

--save passwords
@@savePasswords.sql;

EXIT COMMIT;

