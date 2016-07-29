set linesize 4000;
set pagesize 1000;
set long 4000;

DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE LOG_DETAIL_COLUMNS = 'CREATE TABLE \1' || chr(10) || '( ' || chr(10) ||
                                      ' "logId" NUMBER DEFAULT ON NULL ""sz_{TABLE_NAME}".NEXTVAL,' || chr(10) ||
                                      ' CONSTRAINT "z_{TABLE_NAME}_pk" PRIMARY KEY ("logId"),' || chr(10) ||
                                      ' "logSessionId" VARCHAR2(50 BYTE),' || chr(10) ||
                                      ' "logAction" VARCHAR2(400 BYTE),' || chr(10) ||
                                      ' "dateLogged" TIMESTAMP (6) DEFAULT SYSDATE NOT NULL,' || chr(10) ||
                                      '\3 ';
                                      
DEFINE LOG_DETAIL_SEARCH = 'CREATE TABLE\s+(".+")\s+(\()([^.]+)';     
    
    
    select  
        REPLACE(
                REGEXP_REPLACE(
                        REPLACE(
                                REPLACE(DBMS_METADATA.GET_DDL('TABLE',TABLE_NAME,'&SCHEMA_OWNER_NAME'), 
                                                              'TABLE "&SCHEMA_OWNER_NAME"."' || TABLE_NAME || '" ', 
                                                              'TABLE "' || TABLE_NAME || '" '),
                               'TABLE "' || TABLE_NAME || '" ',  
                               'TABLE "z_' || TABLE_NAME || '" '),
                        '&LOG_DETAIL_SEARCH', '&LOG_DETAIL_COLUMNS',1,1),
                '{TABLE_NAME}',
                TABLE_NAME)
                str2,
        'CREATE SEQUENCE "&SCHEMA_OWNER_NAME"."sz_' || TABLE_NAME || '" INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE' str1,
        TABLE_NAME
    from all_tables 
    where TABLE_NAME not like 'z_%' 
    and TABLE_NAME not in ('import_log','clob_buffer')
    and TABLE_NAME in ('tag_access') 
    and owner = '&SCHEMA_OWNER_NAME'
    order by table_name;