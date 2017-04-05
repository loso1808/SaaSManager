
BEGIN

  FOR appObj in (
    select  
      object_name,
      'CREATE OR REPLACE SYNONYM "&APP_USER"."' || object_name || 
      '" FOR "&SCHEMA_OWNER_NAME"."' || OBJECT_NAME || '" '  str
    from all_objects
    where object_type in ('FUNCTION', 'PROCEDURE', 'PACKAGE', 'TABLE', 'SEQUENCE')
    and owner = '&SCHEMA_OWNER_NAME'
    order by object_name
  )
  LOOP
    EXECUTE IMMEDIATE ('' || appObj.str);
  END LOOP;

END;
/

