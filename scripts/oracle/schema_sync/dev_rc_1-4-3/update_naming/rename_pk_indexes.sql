BEGIN

  FOR pkObj in (
     select 'ALTER INDEX "' || INDEX_NAME || 
       '" RENAME ' ||
       ' TO "' || TABLE_NAME || '_pk" ' str
      from user_constraints 
      where constraint_type = 'P' 
      and constraint_name not like 'BIN$%'
      and index_name <> TABLE_NAME || '_pk' 
  )
  LOOP
    EXECUTE IMMEDIATE ('' || pkObj.str);
  END LOOP;

END;
/