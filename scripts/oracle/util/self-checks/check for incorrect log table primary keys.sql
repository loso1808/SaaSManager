

select 
  *
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
where
  COLUMN_NAME <> 'logId' AND
  (TABLE_NAME not in ('z_winston','z_activity_log') AND COLUMN_NAME = 'id');