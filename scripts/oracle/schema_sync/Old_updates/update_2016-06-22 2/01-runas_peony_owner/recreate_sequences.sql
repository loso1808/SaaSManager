DECLARE 
   sql_stmt    VARCHAR2(1000);     
   seq_start_val NUMBER;
BEGIN

  FOR idColumns in (
    select uc.TABLE_NAME, ucc.COLUMN_NAME
    from 
      user_constraints uc
        inner join 
      user_cons_columns ucc
        on uc.constraint_name = ucc.constraint_name
    where uc.constraint_type = 'P' 
    and ucc.constraint_name not like 'BIN$%'
    and uc.TABLE_NAME not like 'z_%'
  )
  LOOP
    sql_stmt := 'SELECT NVL((MAX("' || idColumns.COLUMN_NAME || '") + 1), 1) FROM "' || idColumns.TABLE_NAME || '" ';
    EXECUTE IMMEDIATE sql_stmt INTO seq_start_val;
    
    DBMS_OUTPUT.PUT_LINE('' || sql_stmt);
    DBMS_OUTPUT.PUT_LINE('' || seq_start_val);
    sql_stmt := 'CREATE SEQUENCE "s_' || idColumns.TABLE_NAME || '" START WITH ' || seq_start_val || ' INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE'; 
    
    DBMS_OUTPUT.PUT_LINE('' || sql_stmt);
    EXECUTE IMMEDIATE sql_stmt;
  END LOOP;

  FOR idColumns in (
    select uc.TABLE_NAME, ucc.COLUMN_NAME
    from 
      user_constraints uc
        inner join 
      user_cons_columns ucc
        on uc.constraint_name = ucc.constraint_name
    where uc.constraint_type = 'P' 
    and ucc.constraint_name not like 'BIN$%'
    and uc.TABLE_NAME like 'z_%'
  )
  LOOP
    sql_stmt := 'SELECT NVL((MAX("' || idColumns.COLUMN_NAME || '") + 1), 1) FROM "' || idColumns.TABLE_NAME || '" ';
    EXECUTE IMMEDIATE sql_stmt INTO seq_start_val;
    
    DBMS_OUTPUT.PUT_LINE('' || sql_stmt);
    DBMS_OUTPUT.PUT_LINE('' || seq_start_val);
    sql_stmt := 'CREATE SEQUENCE "s' || idColumns.TABLE_NAME || '" START WITH ' || seq_start_val || ' INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE'; 
    
    DBMS_OUTPUT.PUT_LINE('' || sql_stmt);
    EXECUTE IMMEDIATE sql_stmt;
  END LOOP;

END;
/
