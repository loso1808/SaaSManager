BEGIN

  FOR sequenceObj in (
    select 'ALTER TABLE "' || TABLE_NAME || '" MODIFY ("' || COLUMN_NAME || '" DEFAULT ON NULL "s_' || TABLE_NAME || '".NEXTVAL ) ' str
    FROM
      (
        select uc.TABLE_NAME, ucc.COLUMN_NAME
        from 
          user_constraints uc
            inner join 
          user_cons_columns ucc
            on uc.constraint_name = ucc.constraint_name
        where uc.constraint_type = 'P' 
        and ucc.constraint_name not like 'BIN$%'
        and uc.TABLE_NAME not like 'z_%' ) idCols
    UNION ALL
    select 'ALTER TABLE "' || TABLE_NAME || '" MODIFY ("' || COLUMN_NAME || '" DEFAULT ON NULL "s' || TABLE_NAME || '".NEXTVAL ) ' str
    FROM
      (
        select uc.TABLE_NAME, ucc.COLUMN_NAME
        from 
          user_constraints uc
            inner join 
          user_cons_columns ucc
            on uc.constraint_name = ucc.constraint_name
        where uc.constraint_type = 'P' 
        and ucc.constraint_name not like 'BIN$%'
        and uc.TABLE_NAME like 'z_%' ) idCols
  )
  LOOP
    EXECUTE IMMEDIATE ('' || sequenceObj.str);
  END LOOP;

END;
/



--ALTER TABLE "devicedesign" MODIFY ("id" DEFAULT ON NULL "s_devicedesign".NEXTVAL );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
