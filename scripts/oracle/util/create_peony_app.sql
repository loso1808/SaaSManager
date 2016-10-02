DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;
DEFINE SCHEMA_OWNER_PASSWORD = 'master#0503';
DEFINE APP_USER = PEONY_APP;
DEFINE APP_ROLE = PEONY_APP_ROLE;
DEFINE APP_USER_PASSWORD = 'T3##Z7*rt';


CREATE USER &&APP_USER                              --Create schema/login 
    IDENTIFIED BY "&APP_USER_PASSWORD";             --Set password

CREATE ROLE &&APP_ROLE;

GRANT &&APP_ROLE TO &&APP_USER;
GRANT create session to &&APP_ROLE;

--Uncomment to keep new user/schema and tablespace
--Comment to immediately drop objects
COMMIT;

                                    
BEGIN

  FOR execObj in (
    select  
      object_name,
      'GRANT EXECUTE ON "&SCHEMA_OWNER_NAME"."' || object_name || '" TO &APP_ROLE' str
    from all_objects
    where object_type in ('FUNCTION', 'PROCEDURE','PACKAGE')
    and owner = '&SCHEMA_OWNER_NAME'
    order by object_name
  )
  LOOP
    EXECUTE IMMEDIATE ('' || execObj.str);
  END LOOP;

  FOR cruObj in (
    select  
      object_name,
      'GRANT SELECT ON "&SCHEMA_OWNER_NAME"."' || object_name || '" TO &APP_ROLE' str,
      'GRANT INSERT ON "&SCHEMA_OWNER_NAME"."' || object_name || '" TO &APP_ROLE' str2,
      'GRANT UPDATE ON "&SCHEMA_OWNER_NAME"."' || object_name || '" TO &APP_ROLE' str3
    from all_objects
    where object_type in ('TABLE')
    and owner = '&SCHEMA_OWNER_NAME'
    order by object_name
  )
  LOOP
    EXECUTE IMMEDIATE ('' || cruObj.str);
    EXECUTE IMMEDIATE ('' || cruObj.str2);
    EXECUTE IMMEDIATE ('' || cruObj.str3);
  END LOOP;

  FOR delObj in (
    select  
      object_name,
      'GRANT DELETE ON "&SCHEMA_OWNER_NAME"."' || object_name || '" TO &APP_ROLE' str
    from all_objects
    where object_type in ('TABLE')
    and object_name not like 'z_%'
    and owner = '&SCHEMA_OWNER_NAME'
    order by object_name
  )
  LOOP
    EXECUTE IMMEDIATE ('' || delObj.str);
  END LOOP;
  
  FOR seqObj in (
    select  
      object_name,
      'GRANT SELECT ON "&SCHEMA_OWNER_NAME"."' || object_name || '" TO &APP_ROLE' str
    from all_objects
    where object_type in ('SEQUENCE')
    and owner = '&SCHEMA_OWNER_NAME'
    order by object_name
  )
  LOOP
    EXECUTE IMMEDIATE ('' || seqObj.str);
  END LOOP;
END;
/

COMMIT;