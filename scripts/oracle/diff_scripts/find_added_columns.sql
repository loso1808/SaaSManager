select 
  rc.table_name RC_TABLE,
  rc.column_name RC_COLUMN,
  dow.table_name DOW_TABLE,
  dow.column_name DOW_COLUMN
from 
  all_tab_cols rc
    left join
  all_tab_cols dow
    on rc.table_name = dow.table_name
    and rc.column_name = dow.column_name
    and dow.owner = 'PNY_DOWTEST_DBO'
where
    rc.owner = 'PNY_TEST_DBO'
--  ( or rc.owner is null)
--  and ( or dow.owner is null)
  --and (dow.column_name is null or rc.column_name is null)
and dow.column_name is null
and rc.column_name <> 'loggedBy'
order by 
  rc.table_name, rc.column_id
  ;