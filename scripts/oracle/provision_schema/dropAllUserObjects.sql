BEGIN

  FOR userObj in (
    select 'drop '||object_type||' '|| object_name||  DECODE(OBJECT_TYPE,'TABLE',' CASCADE CONSTRAINTS','') str
    
    from user_objects
    where generated = 'N'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || userObj.str);
  END LOOP;

END;
/