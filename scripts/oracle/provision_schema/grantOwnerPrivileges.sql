--Partial Script: This script should be run from a parent script that defines the replacement values.

--GRANT privileges to allow the new user to connect and create objects
GRANT create session TO &&SCHEMA_OWNER_NAME;
GRANT create table TO &&SCHEMA_OWNER_NAME;
GRANT create view TO &&SCHEMA_OWNER_NAME;
GRANT create any trigger TO &&SCHEMA_OWNER_NAME;
GRANT create sequence TO &&SCHEMA_OWNER_NAME;
GRANT create any procedure TO &&SCHEMA_OWNER_NAME;