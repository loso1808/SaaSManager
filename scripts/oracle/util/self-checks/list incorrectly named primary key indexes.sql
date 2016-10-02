select 
TABLE_NAME, INDEX_NAME, (TABLE_NAME || '_pk') CORRECT_NAME 
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and index_name <> TABLE_NAME || '_pk';
