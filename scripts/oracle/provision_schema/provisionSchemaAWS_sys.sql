
--Defines replacement values such as SCHEMA_OWNER_NAME, TABLESPACE_NAME, etc..
@@schemaConfig.sql; 


--Create the tablespaces
CREATE TABLESPACE &&TABLESPACE_NAME;                --AWS manages all other tablespace options

CREATE TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME; --AWS manages all other tablespace options


--Create the schema owner user and set password
@@createSchemaUser.sql;

--GRANT privileges to allow the new schema owner user to connect and create objects
@@grantOwnerPrivileges.sql;


EXIT COMMIT;

