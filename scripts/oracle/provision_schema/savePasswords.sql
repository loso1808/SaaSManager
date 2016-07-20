--@@schemaDefines.sql;

set echo off;
set feedback off;
set linesize 1000;
set sqlprompt '';
set trimspool on;
set verify off;
SPOOL schema_passwords.txt APPEND

SELECT '&SCHEMA_OWNER_PASSWORD'  || chr(10) "&SCHEMA_OWNER_NAME" FROM dual;

SELECT '&APP_USER_PASSWORD' || chr(10) "&APP_USER" FROM dual;

SPOOL OFF
set echo on;
set feedback on;
set verify on;