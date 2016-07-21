BEGIN

  FOR triggerObj in (
    select  
      'DROP TRIGGER "' || TRIGGER_NAME || 
      '" ' str
    from user_triggers
  )
  LOOP
    EXECUTE IMMEDIATE ('' || triggerObj.str);
  END LOOP;

END;
/