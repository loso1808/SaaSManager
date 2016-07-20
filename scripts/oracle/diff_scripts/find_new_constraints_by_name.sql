

select
  *
from
  all_constraints rc
    left join
  all_constraints dow
    on rc.constraint_name = dow.constraint_name
    and rc.table_name = dow.table_name
    and dow.owner = 'PNY_DOWTEST_DBO'
where
  rc.owner = 'PNY_TEST_DBO'
  and dow.constraint_name is null
  and rc.constraint_name not like 'SYS_%'
order by
  rc.table_name, rc.constraint_name;