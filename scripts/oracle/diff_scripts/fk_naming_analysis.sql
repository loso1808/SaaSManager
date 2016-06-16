--select table_name, length(table_name), 
select *
from user_tables
order by length(table_name) desc;

select * from user_objects;

select table_name, column_name, length(column_name), table_name || '_' || column_name || '_fk', length(table_name || '_' || column_name || '_fk') 
from user_tab_cols where column_name like '%_id'
order by length(column_name) desc;