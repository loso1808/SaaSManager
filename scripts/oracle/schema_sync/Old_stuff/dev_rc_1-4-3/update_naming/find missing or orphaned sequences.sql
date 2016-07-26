select 
  *
from
(

select  
  ut.TABLE_NAME, us.SEQUENCE_NAME, ('s_' || ut.table_name), ('s' || ut.table_name), 
  case when ut.table_name is null then 'Sequences without corresponding tables' 
       when us.sequence_name is null then 'Tables without corresponding sequences' 
       else 'Correctly named sequences' end sequence_naming 
from
  user_tables ut
    full join
  user_sequences us
    on ((('s_' || ut.table_name) = sequence_name) -- and ut.table_name not like '%z\_' escape '\') 
    or (('s' || ut.table_name) = sequence_name )))
qry
where sequence_naming <> 'Correctly named sequences';