
--Create Tablespaces
CREATE BIGFILE TABLESPACE &&TABLESPACE_NAME         --BIGFILE means put all data into one big file on disk
        DATAFILE '&TABLESPACE_FILE_NAME'            --If you omit the directory, it puts the data file in the default
        SIZE 20M                                    --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE 1G                    --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
        ONLINE;                                     --Bring the tablespace online immediately


CREATE TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME  --Used as a temporary workspace for the database
        TEMPFILE '&TEMP_TABLESPACE_FILE_NAME'       --If you omit the directory, it puts the data file in the default
        SIZE 5M                                     --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE 100M;                 --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
                                                    --Temp tables are online if the database is online

CREATE BIGFILE TABLESPACE &&LOG_TABLESPACE_NAME         --BIGFILE means put all data into one big file on disk
        DATAFILE '&LOG_TABLESPACE_FILE_NAME'            --If you omit the directory, it puts the data file in the default
        SIZE 20M                                    --This is the initial size of the data file
        REUSE                                       --Tells it to reuse free space from deletes
        AUTOEXTEND ON MAXSIZE 1G                    --When the file needs more room auto extend it stop at maxsize which can be UNLIMITED
        ONLINE;                                     --Bring the tablespace online immediately
