BEGIN
  FOR tableObj in (
    select 'drop table "' || object_name || '" cascade constraints purge ' str
    
    from user_objects
    where generated = 'N' and object_type = 'TABLE'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || tableObj.str);
  END LOOP;


  FOR userObj in (
    select 'drop '||object_type||' "' || object_name || '" ' str
    
    from user_objects
    where generated = 'N' 
  )
  LOOP
    EXECUTE IMMEDIATE ('' || userObj.str);
  END LOOP;

END;
/

select * from user_objects;