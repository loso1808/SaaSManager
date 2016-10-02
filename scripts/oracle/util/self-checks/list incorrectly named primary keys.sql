select  
*
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and constraint_name <> TABLE_NAME || '_pk';