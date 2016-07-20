BEGIN

  FOR colObj in (
    select  
      
      'ALTER TABLE "' || TABLE_NAME || 
      '" MODIFY ("' || COLUMN_NAME || '" NOT NULL) '
      str
    from user_tab_cols
    where TABLE_NAME like 'z\_%' escape '\'
    and COLUMN_NAME = 'dateLogged'
    and NULLABLE = 'Y'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || colObj.str);
  END LOOP;

END;
/