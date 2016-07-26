BEGIN

  FOR sequenceObj in (
    select  
      'DROP SEQUENCE "' || SEQUENCE_NAME || 
      '" ' str
    from user_sequences
  )
  LOOP
    EXECUTE IMMEDIATE ('' || sequenceObj.str);
  END LOOP;

END;
/