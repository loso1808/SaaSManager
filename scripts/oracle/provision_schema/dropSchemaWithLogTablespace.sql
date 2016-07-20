
--Defines replacement values such as SCHEMA_OWNER_NAME, TABLESPACE_NAME, etc..
@@schemaDefines.sql;

--Clean up script; Delete everthing in the owner schema
DROP USER &&SCHEMA_OWNER_NAME CASCADE;

--Clean up script; Delete everthing in the owner schema
DROP USER &&APP_USER CASCADE;

--Clean up script; Delete everthing in the owner schema
DROP ROLE &&APP_ROLE;

--Delete all the tablespaces
DROP TABLESPACE &&TABLESPACE_NAME
  INCLUDING CONTENTS AND DATAFILES
  CASCADE CONSTRAINTS;

DROP TABLESPACE &&LOG_TABLESPACE_NAME
  INCLUDING CONTENTS AND DATAFILES
  CASCADE CONSTRAINTS;
  
DROP TABLESPACE &&TEMP_TABLESPACE_NAME
  INCLUDING CONTENTS AND DATAFILES
  CASCADE CONSTRAINTS;

EXIT COMMIT;