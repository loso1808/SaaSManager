BEGIN

  FOR colObj in (
    select  
      'ALTER TABLE "' || TABLE_NAME || 
      '" DROP COLUMN "' || COLUMN_NAME || '" ' str
    from user_tab_cols
    where TABLE_NAME like 'z\_%' escape '\'
    and COLUMN_NAME = 'loggedBy'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || colObj.str);
  END LOOP;

END;
/