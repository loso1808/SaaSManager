
select
  *
from
    (SELECT 
      a.table_name, 
      a.column_name, 
      a.constraint_name, 
      c.owner, 
      c.delete_rule, 
      c.status, 
           -- referenced pk
      c.r_owner, 
      c_pk.table_name r_table_name, 
      c_pk.constraint_name r_pk
    FROM 
      all_cons_columns a
        JOIN 
      all_constraints c 
          ON a.owner = c.owner
          AND a.constraint_name = c.constraint_name
        JOIN 
      all_constraints c_pk 
          ON c.r_owner = c_pk.owner
          AND c.r_constraint_name = c_pk.constraint_name
     WHERE 
      c.constraint_type = 'R'
      and c.owner = 'PNY_TEST_DBO') fkrc
        left join
     (SELECT 
      a.table_name, 
      a.column_name, 
      a.constraint_name, 
      c.owner, 
      c.delete_rule, 
      c.status, 
           -- referenced pk
      c.r_owner, 
      c_pk.table_name r_table_name, 
      c_pk.constraint_name r_pk
    FROM 
      all_cons_columns a
        JOIN 
      all_constraints c 
          ON a.owner = c.owner
          AND a.constraint_name = c.constraint_name
        JOIN 
      all_constraints c_pk 
          ON c.r_owner = c_pk.owner
          AND c.r_constraint_name = c_pk.constraint_name
     WHERE 
      c.constraint_type = 'R'
      and c.owner = 'PNY_DOWTEST_DBO') fkdow
        on fkrc.table_name = fkdow.table_name
        and fkrc.column_name = fkdow.column_name
        and fkrc.delete_rule = fkdow.delete_rule
        and fkrc.status = fkdow.status
        and fkrc.r_table_name = fkdow.r_table_name
        and fkrc.r_pk = fkdow.r_pk
WHERE
  fkdow.table_name is null
order by
  fkrc.table_name, fkrc.column_name;
