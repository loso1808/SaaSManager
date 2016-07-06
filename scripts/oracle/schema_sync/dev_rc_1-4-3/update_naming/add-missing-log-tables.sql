BEGIN

  FOR logTableObj in (
    select ut.TABLE_NAME,
    'CREATE SEQUENCE "sz_' || ut.TABLE_NAME || '" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE' str1,
    'CREATE TABLE "z_' || ut.TABLE_NAME || '" ( "logId" NUMBER DEFAULT ON NULL "sz_' || ut.TABLE_NAME || 
    '".NEXTVAL, CONSTRAINT "z_' || ut.TABLE_NAME || '_pk" PRIMARY KEY ("logId"), ' ||
    '"logSessionId" VARCHAR2(50), "logAction" VARCHAR2(400), "dateLogged" TIMESTAMP DEFAULT ON NULL SYSDATE) TABLESPACE &LOG_TABLESPACE_NAME' str2
    from 
      user_tables ut
         left join
      user_tables zut
         on ('z_' || ut.TABLE_NAME) = zut.TABLE_NAME
    where
      ut.TABLE_NAME <> 'clob_buffer'
      and ut.TABLE_NAME not like 'z_%'
      and zut.TABLE_NAME is null
  )
  LOOP
    EXECUTE IMMEDIATE ('' || logTableObj.str1);
    EXECUTE IMMEDIATE ('' || logTableObj.str2);
  END LOOP;

END;
/