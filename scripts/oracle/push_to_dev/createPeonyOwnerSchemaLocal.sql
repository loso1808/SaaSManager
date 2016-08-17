DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE SCHEMA_OWNER_PASSWORD = 'master#0503';
DEFINE TABLESPACE_NAME = PEONY_OWNER_DATA;
DEFINE TEMP_TABLESPACE_NAME = PEONY_OWNER_TEMP;
DEFINE TABLESPACE_FILE_NAME = 'PEONY_OWNER_DATA.dat';
DEFINE TEMP_TABLESPACE_FILE_NAME = 'PEONY_OWNER_TEMP.dat';


--Create Tablespaces
CREATE BIGFILE TABLESPACE &&TABLESPACE_NAME         --BIGFILE means put all data into one big file on disk
        DATAFILE '&TABLESPACE_FILE_NAME'            --If you omit the directory, it puts the data file in the default
        SIZE 1G                                    --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE 50G                    --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
        ONLINE;                                     --Bring the tablespace online immediately


CREATE TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME  --Used as a temporary workspace for the database
        TEMPFILE '&TEMP_TABLESPACE_FILE_NAME'       --If you omit the directory, it puts the data file in the default
        SIZE 500M                                     --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE UNLIMITED;                 --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
           

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