DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE SCHEMA_OWNER_PASSWORD = 'master#0503';
DEFINE TABLESPACE_NAME = PEONY_OWNER_DATA;
DEFINE TEMP_TABLESPACE_NAME = PEONY_OWNER_TEMP;



--Create the tablespaces
CREATE TABLESPACE &&TABLESPACE_NAME;                --AWS manages all other tablespace options

CREATE TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME; --AWS manages all other tablespace options



--Partial Script: This script should be run from a parent script that defines the replacement values.

--Create the schema owner user and set password
CREATE USER &&SCHEMA_OWNER_NAME                     --Create schema/login 
    IDENTIFIED BY "&SCHEMA_OWNER_PASSWORD"          --Set password
    DEFAULT TABLESPACE &&TABLESPACE_NAME            --Set the default tablespace created above
    TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME;    --Set the temp tablespace

       
GRANT unlimited tablespace to &&SCHEMA_OWNER_NAME;  --Allow schema owner to use all available space in the tablespace



--Partial Script: This script should be run from a parent script that defines the replacement values.

--GRANT privileges to allow the new user to connect and create objects
GRANT create session TO &&SCHEMA_OWNER_NAME;
GRANT create table TO &&SCHEMA_OWNER_NAME;
GRANT create view TO &&SCHEMA_OWNER_NAME;
GRANT create any trigger TO &&SCHEMA_OWNER_NAME;
GRANT create sequence TO &&SCHEMA_OWNER_NAME;
GRANT create any procedure TO &&SCHEMA_OWNER_NAME;