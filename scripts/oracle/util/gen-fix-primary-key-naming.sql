select  
'ALTER TABLE "' || TABLE_NAME || '" RENAME CONSTRAINT "' || CONSTRAINT_NAME || '" TO "' || TABLE_NAME || '_pk"; ' alterScript
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and constraint_name <> TABLE_NAME || '_pk'
UNION ALL
select 
'ALTER INDEX "' || INDEX_NAME || '" RENAME TO "' || TABLE_NAME || '_pk"; ' alterScript
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and index_name <> TABLE_NAME || '_pk';