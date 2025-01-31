select
  TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, COLUMN_SUFFIX, FKNAME
FROM
  
  (SELECT
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    COLUMN_NAME,
    COLUMN_SUFFIX,
    case
      when length(TABLE_NAME || '_' || COLUMN_SUFFIX || '_fk') > 30
        then TRIM(TRAILING '_' FROM substr(table_name, 1, 13)) || '_' ||
             TRIM(TRAILING '_' FROM substr(column_suffix, 1, 13)) || '_fk'
      else
            TABLE_NAME || '_' || COLUMN_SUFFIX || '_fk'
      end fkname  
  FROM
  (select 
    uc.TABLE_NAME, 
    uc.CONSTRAINT_NAME, 
    ucc.COLUMN_NAME,
    case 
      when upper(ucc.COLUMN_NAME) like '%\_ID' ESCAPE '\' THEN substr(ucc.column_name,1,(length(ucc.column_name) - 3))
      when upper(ucc.COLUMN_NAME) like '%ID' THEN substr(ucc.column_name,1,(length(ucc.column_name) - 2))
      else ucc.COLUMN_NAME end COLUMN_SUFFIX
  from 
    user_constraints uc
      inner join 
    user_cons_columns ucc
      on uc.constraint_name = ucc.constraint_name
  where uc.constraint_type = 'R' 
  and ucc.constraint_name not like 'BIN$%'
  and uc.TABLE_NAME not like 'z_%') fk_col ) fk2 

where CONSTRAINT_NAME <> FKNAME