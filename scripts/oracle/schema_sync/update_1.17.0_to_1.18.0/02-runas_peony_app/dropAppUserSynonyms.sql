

BEGIN

  FOR appObj in (
    select  
      'DROP SYNONYM "&APP_USER"."' || SYNONYM_NAME || 
      '" ' str
    from USER_SYNONYMS
  )
  LOOP
    EXECUTE IMMEDIATE ('' || appObj.str);
  END LOOP;

END;
/
