------ DROP ALL OBJECTS -------

BEGIN
  FOR tableObj in (
    select 'drop table "' || object_name || '" cascade constraints purge ' str
    
    from all_objects
    where generated = 'N' and object_type = 'TABLE' and owner = '{{SCHEMA_NAME}}'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || tableObj.str);
  END LOOP;


  FOR userObj in (
    select 'drop '||object_type||' "' || object_name || '" ' str
    
    from all_objects
    where generated = 'N' and owner = '{{SCHEMA_NAME}}'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || userObj.str);
  END LOOP;

END;

