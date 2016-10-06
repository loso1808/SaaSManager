alter table "z_sequence_j5run" add ("newId" NUMBER);
update "z_sequence_j5run" set "newId" = "id";
commit;
alter table "z_sequence_j5run" modify ("id" default null);
alter table "z_sequence_j5run" drop column "id";
alter table "z_sequence_j5run" rename column "newId" to "id";

alter table "z_j5run_construct" modify ("id" null);
alter table "z_plate_set" modify ("id" null);

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

BEGIN

  FOR colObj in (
    select  
      'ALTER TABLE "' || TABLE_NAME || 
      '" MODIFY ("' || COLUMN_NAME || '" DEFAULT ON NULL SYSDATE) '
      str
    from user_tab_cols
    where TABLE_NAME like 'z\_%' escape '\'
    and COLUMN_NAME = 'dateLogged'
  )
  LOOP
    EXECUTE IMMEDIATE ('' || colObj.str);
  END LOOP;

END;
/