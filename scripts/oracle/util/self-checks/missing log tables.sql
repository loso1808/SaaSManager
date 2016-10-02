
DEFINE LOG_TABLESPACE_NAME = PNY_DEV_1_4_3_LOG;


select ut.TABLE_NAME,
'CREATE SEQUENCE "sz_' || ut.TABLE_NAME || '" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE' str1,
'CREATE TABLE "z_' || ut.TABLE_NAME || '" ( "logId" NUMBER DEFAULT ON NULL "sz_' || ut.TABLE_NAME || 
'".NEXTVAL, "logSessionId" VARCHAR2(50), "logAction" VARCHAR2(400), "dateLogged" TIMESTAMP DEFAULT ON NULL SYSDATE) TABLESPACE &LOG_TABLESPACE_NAME' str2
from 
  user_tables ut
     left join
  user_tables zut
     on ('z_' || ut.TABLE_NAME) = zut.TABLE_NAME
where
  ut.TABLE_NAME <> 'clob_buffer'
  and ut.TABLE_NAME not like 'z_%'
  and zut.TABLE_NAME is null;