--Partial Script: This script should be run from a parent script that defines the replacement values.

--Create the schema owner user and set password
CREATE USER &&SCHEMA_OWNER_NAME                     --Create schema/login 
    IDENTIFIED BY "&SCHEMA_OWNER_PASSWORD"          --Set password
    DEFAULT TABLESPACE &&TABLESPACE_NAME            --Set the default tablespace created above
    TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME;    --Set the temp tablespace

       
GRANT unlimited tablespace to &&SCHEMA_OWNER_NAME;  --Allow schema owner to use all available space in the tablespace