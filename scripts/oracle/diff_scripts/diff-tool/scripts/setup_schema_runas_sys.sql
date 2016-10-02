DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE SCHEMA_OWNER_PASSWORD = 'master#0503';
DEFINE APP_USER = PEONY_APP;
DEFINE APP_ROLE = PEONY_APP_ROLE;
DEFINE APP_USER_PASSWORD = 'T3##Z7*rt';
DEFINE TABLESPACE_NAME = peony_data;
DEFINE TABLESPACE_FILE_NAME = 'peony_data.dat';
DEFINE TEMP_TABLESPACE_NAME = tmp_peony_data;
DEFINE TEMP_TABLESPACE_FILE_NAME = 'tmp_peony_data.dat';

CREATE BIGFILE TABLESPACE &&TABLESPACE_NAME         --BIGFILE means put all data into one big file on disk
        DATAFILE '&TABLESPACE_FILE_NAME'            --If you omit the directory, it puts the data file in the default
        SIZE 20M                                    --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE UNLIMITED                    --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
        ONLINE;                                     --Bring the tablespace online immediately


CREATE TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME  --Used as a temporary workspace for the database
        TEMPFILE '&TEMP_TABLESPACE_FILE_NAME'       --If you omit the directory, it puts the data file in the default
        SIZE 5M                                     --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE UNLIMITED;                 --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
                                                    --Temp tables are online if the database is online

CREATE USER &&SCHEMA_OWNER_NAME                     --Create schema/login 
    IDENTIFIED BY "&SCHEMA_OWNER_PASSWORD"          --Set password
    DEFAULT TABLESPACE &&TABLESPACE_NAME            --Set the default tablespace created above
    TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME;    --Set the temp tablespace

       
GRANT unlimited tablespace to &&SCHEMA_OWNER_NAME;  --Allow schema owner to use all available space in the tablespace

--GRANT privileges to allow the new user to connect and create objects
GRANT create session TO &&SCHEMA_OWNER_NAME;
GRANT create table TO &&SCHEMA_OWNER_NAME;
GRANT create view TO &&SCHEMA_OWNER_NAME;
GRANT create any trigger TO &&SCHEMA_OWNER_NAME;
GRANT create sequence TO &&SCHEMA_OWNER_NAME;

CREATE USER &&APP_USER                              --Create schema/login 
    IDENTIFIED BY "&APP_USER_PASSWORD";             --Set password

CREATE ROLE &&APP_ROLE;

GRANT &&APP_ROLE TO &&APP_USER;
GRANT create session to &&APP_ROLE;

GRANT CREATE synonym to &&APP_USER;

--Uncomment to keep new user/schema and tablespace
--Comment to immediately drop objects
EXIT COMMIT;

