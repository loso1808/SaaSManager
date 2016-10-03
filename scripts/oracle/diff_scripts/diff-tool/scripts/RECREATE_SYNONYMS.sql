create or replace PROCEDURE RECREATE_SYNONYMS 
(
  OWNER_SCHEMA IN VARCHAR2 
)
IS
  v_sql varchar2(4000) := null;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Executing RECREATE_SYNONYMS');
  FOR appObj in (
    select  
      'DROP SYNONYM "' || SYNONYM_NAME || 
      '" ' str
    from USER_SYNONYMS
  )
  LOOP
    --EXECUTE IMMEDIATE ('' || appObj.str);
    DBMS_OUTPUT.PUT_LINE(appObj.str);
  END LOOP;

  FOR appObj2 in (
    select  
      object_name,
      'CREATE OR REPLACE SYNONYM "' || object_name || 
      '" FOR "{{SCHEMA_NAME}}"."' || OBJECT_NAME || '" '  str
    from all_objects
    where object_type in ('FUNCTION', 'PROCEDURE', 'PACKAGE', 'TABLE', 'SEQUENCE')
    and owner = 'PEONY_OWNER'
    order by object_name
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(appObj2.str);
    --v_sql := REPLACE(appObj2.str, '{{SCHEMA_NAME}}', OWNER_SCHEMA);
    --EXECUTE IMMEDIATE ('' || appObj2.str);
    --DBMS_OUTPUT.PUT_LINE(v_sql);
  END LOOP;
END RECREATE_SYNONYMS;