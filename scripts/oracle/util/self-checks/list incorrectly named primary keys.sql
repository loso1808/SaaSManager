select  
TABLE_NAME,
CONSTRAINT_NAME,
SUBSTR(TABLE_NAME, 1, 29) || '_pk' CORRECT_NAME,
LENGTH(SUBSTR(TABLE_NAME, 1, 29) || '_pk') NAME_LEN
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and constraint_name <> SUBSTR(TABLE_NAME, 1, 29) || '_pk' ;