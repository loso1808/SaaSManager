
DEFINE APP_USER = PNY_TEST_APP;
DEFINE SCHEMA_OWNER_NAME = PNY_TEST_DBO;


--SELECT * FROM ALL_SYNONYMS WHERE OWNER = '&APP_USER';

BEGIN

  FOR appObj in (
    select  
      'DROP SYNONYM "&APP_USER"."' || SYNONYM_NAME || 
      '" ' str
    from ALL_SYNONYMS
    where owner = '&APP_USER'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || appObj.str);
  END LOOP;

END;
/