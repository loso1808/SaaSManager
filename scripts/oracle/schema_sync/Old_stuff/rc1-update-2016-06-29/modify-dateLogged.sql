BEGIN

  FOR colObj in (
    select  
      'ALTER TABLE "' || TABLE_NAME || 
      '" MODIFY ("' || COLUMN_NAME || '" DEFAULT ON NULL SYSDATE) '
      str,
      
      'ALTER TABLE "' || TABLE_NAME || 
      '" MODIFY ("' || COLUMN_NAME || '" NOT NULL) '
      str2
    from user_tab_cols
    where TABLE_NAME like 'z\_%' escape '\'
    and COLUMN_NAME = 'dateLogged'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || colObj.str);
    --EXECUTE IMMEDIATE ('' || colObj.str2);
  END LOOP;

END;
/