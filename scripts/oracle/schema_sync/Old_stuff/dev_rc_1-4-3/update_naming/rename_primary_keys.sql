BEGIN

  FOR pkObj in (
    select 'ALTER TABLE "' || TABLE_NAME || 
           '" RENAME CONSTRAINT "' || CONSTRAINT_NAME || '" ' ||
           ' TO "' || TABLE_NAME || '_pk" ' str
    from user_constraints 
    where constraint_type = 'P' 
    and constraint_name not like 'BIN$%'
    and constraint_name <> TABLE_NAME || '_pk'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || pkObj.str);
  END LOOP;

END;
/