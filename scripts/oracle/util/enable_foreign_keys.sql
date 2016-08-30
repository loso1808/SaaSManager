DECLARE 
                                    
BEGIN

  FOR foreignKeys in (
    select  
        'ALTER TABLE "' || TABLE_NAME || '" ' ||
        'ENABLE CONSTRAINT "' || constraint_name || '" '  str      
    from user_constraints 
    where constraint_type = 'R'
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('' || foreignKeys.str);
    EXECUTE IMMEDIATE ('' || foreignKeys.str);
  END LOOP;

END;
/
