select * from all_constraints where constraint_type = 'R' and owner = 'PNY_TEST_DBO';

select * from all_cons_columns;


SELECT a.table_name, a.column_name, a.constraint_name, c.owner, c.delete_rule, c.status, 
       -- referenced pk
       c.r_owner, c_pk.table_name r_table_name, c_pk.constraint_name r_pk
  FROM all_cons_columns a
  JOIN all_constraints c ON a.owner = c.owner
                        AND a.constraint_name = c.constraint_name
  JOIN all_constraints c_pk ON c.r_owner = c_pk.owner
                           AND c.r_constraint_name = c_pk.constraint_name
 WHERE c.constraint_type = 'R'
 and c.owner = 'PNY_TEST_DBO';