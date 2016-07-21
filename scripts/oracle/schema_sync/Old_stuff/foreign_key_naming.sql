select uc.TABLE_NAME, ucc.COLUMN_NAME
from 
  user_constraints uc
    inner join 
  user_cons_columns ucc
    on uc.constraint_name = ucc.constraint_name
where uc.constraint_type = 'P' 
and ucc.constraint_name not like 'BIN$%';

select * from user_constraints where constraint_type = 'P';


select table_name, substr(table_name, 1, 12) from user_tables;


select table_code || '_' || fk_col_code || '_fk'
from (

select table_name, 
substr(table_name, 1, 13) table_code, 
TRIM(TRAILING '_' FROM substr(substr(column_name,1,(length(column_name) - 3)), 1, 13)) 
fk_col_code
from user_tab_cols where column_name like '%_id') fknames;