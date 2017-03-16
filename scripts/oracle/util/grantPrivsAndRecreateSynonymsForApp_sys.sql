/*
  This script combines grantPrivilegesToAppRole_owner.sql and recreateAppUserSynonyms_app.sql into 
  a single script. However this script must be run as sys.
*/


DEFINE SCHEMA_OWNER_NAME = PNY_RC_1_17_0_DBO;
DEFINE APP_ROLE = PNY_RC_1_17_0_AR;
DEFINE APP_USER = PNY_RC_1_17_0_APP;


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

  FOR appObj in (
    select  
      'DROP SYNONYM "&APP_USER"."' || SYNONYM_NAME || 
      '" ' str
    from ALL_SYNONYMS
    where owner = '&APP_USER'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || appObj.str);
  END LOOP;

  FOR appObj2 in (
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
    EXECUTE IMMEDIATE ('' || appObj2.str);
  END LOOP;
END;
/
