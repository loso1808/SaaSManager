select 
  rc.table_name RC_TABLE,
  rc.column_name RC_COLUMN,
  dow.table_name DOW_TABLE,
  dow.column_name DOW_COLUMN
from 
  all_tab_cols dow
    left join
  all_tab_cols rc
    on rc.table_name = dow.table_name
    and rc.column_name = dow.column_name
    and rc.owner = 'PNY_TEST_DBO'
where
    dow.owner = 'PNY_DOWTEST_DBO'
    and rc.column_name is null
order by 
  dow.table_name, dow.column_id;