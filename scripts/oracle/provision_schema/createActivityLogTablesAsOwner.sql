DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;

EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'STORAGE',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SEGMENT_ATTRIBUTES',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'TABLESPACE',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'REF_CONSTRAINTS',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'CONSTRAINTS_AS_ALTER',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'OID',false);
EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SIZE_BYTE_KEYWORD',true);

DECLARE 
  logDetailColumns VARCHAR2(1000) :=  'CREATE TABLE "&SCHEMA_OWNER_NAME".\1' || chr(10) || '( ' || chr(10) ||
                                      ' "logId" NUMBER DEFAULT ON NULL "&SCHEMA_OWNER_NAME"."sz_{TABLE_NAME}".NEXTVAL,' || chr(10) ||
                                      ' CONSTRAINT "z_{TABLE_NAME}_pk" PRIMARY KEY ("logId"),' || chr(10) ||
                                      ' "logSessionId" VARCHAR2(50 BYTE),' || chr(10) ||
                                      ' "logAction" VARCHAR2(400 BYTE),' || chr(10) ||
                                      ' "dateLogged" TIMESTAMP (6) DEFAULT SYSDATE NOT NULL,' || chr(10) ||
                                      '\3 ';
                                      
  logDetailSearch VARCHAR2(1000) :=   'CREATE TABLE\s+(".+")\s+(\()([^.]+)'; 
  
                                    
BEGIN

  FOR logTableSchema in (
    select
        REPLACE(
            REPLACE(
                    REGEXP_REPLACE(
                            REPLACE(
                                    REPLACE(DBMS_METADATA.GET_DDL('TABLE',TABLE_NAME,'&SCHEMA_OWNER_NAME'), 
                                                                  'TABLE "&SCHEMA_OWNER_NAME"."' || TABLE_NAME || '" ', 
                                                                  'TABLE "' || TABLE_NAME || '" '),
                                   'TABLE "' || TABLE_NAME || '" ',  
                                   'TABLE "z_' || TABLE_NAME || '" '),
                            logDetailSearch, logDetailColumns,1,1),
                    '{TABLE_NAME}',
                    TABLE_NAME),
                  'DEFAULT ON NULL "&SCHEMA_OWNER_NAME" ."s_' || TABLE_NAME || '".NEXTVAL',
                  '')
                str2,
        'CREATE SEQUENCE "&SCHEMA_OWNER_NAME"."sz_' || TABLE_NAME || '" INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE' str1,
        TABLE_NAME
    from all_tables 
    where TABLE_NAME not like 'z_%' 
    and TABLE_NAME not in ('import_log','clob_buffer')
    and TABLE_NAME in ('tag_access') 
    and owner = '&SCHEMA_OWNER_NAME'
    order by table_name
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('' || logTableSchema.str1);
    DBMS_OUTPUT.PUT_LINE('' || logTableSchema.str2);
 --   EXECUTE IMMEDIATE ('' || logTableSchema.str1);
 --   EXECUTE IMMEDIATE ('' || logTableSchema.str2);
  END LOOP;


END;
/

EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'DEFAULT');
