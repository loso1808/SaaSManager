set pagesize 1000;
set linesize 1000;
--select 'DROP TRIGGER "' || TRIGGER_NAME || '"; ' from user_triggers;
--select 'DROP SEQUENCE "' || SEQUENCE_NAME || '"; ' from user_sequences;

--select 'DROP SEQUENCE "' || SEQUENCE_NAME || '"; ' from user_sequences;

select 'ALTER TABLE "' || TABLE_NAME || '" MODIFY ("' || COLUMN_NAME || '" DEFAULT ON NULL "s_' || TABLE_NAME || '".NEXTVAL ); '
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
select 'ALTER TABLE "' || TABLE_NAME || '" MODIFY ("' || COLUMN_NAME || '" DEFAULT ON NULL "s' || TABLE_NAME || '".NEXTVAL ); '
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
    and uc.TABLE_NAME like 'z_%' ) idCols;
/*
select 'ALTER TABLE "' || TABLE_NAME || 
       '" RENAME CONSTRAINT "' || CONSTRAINT_NAME || '" ' ||
       ' TO "' || TABLE_NAME || '_pk";'
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and constraint_name <> TABLE_NAME || '_pk';
*/

/*
select 'ALTER INDEX "' || INDEX_NAME || 
       '" RENAME ' ||
       ' TO "' || TABLE_NAME || '_pk";'
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and index_name <> TABLE_NAME || '_pk';
*/