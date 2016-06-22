

select
  count(*) "Foreign Key Invalid Names"
FROM
  
  (SELECT
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    COLUMN_NAME,
    COLUMN_SUFFIX,
    case
      when length(TABLE_NAME || '_' || COLUMN_SUFFIX || '_fk') > 30
        then TRIM(TRAILING '_' FROM substr(table_name, 1, 13)) || '_' ||
             TRIM(TRAILING '_' FROM substr(column_suffix, 1, 13)) || '_fk'
      else
            TABLE_NAME || '_' || COLUMN_SUFFIX || '_fk'
      end fkname  
  FROM
  (select 
    uc.TABLE_NAME, 
    uc.CONSTRAINT_NAME, 
    ucc.COLUMN_NAME,
    case 
      when upper(ucc.COLUMN_NAME) like '%\_ID' ESCAPE '\' THEN substr(ucc.column_name,1,(length(ucc.column_name) - 3))
      when upper(ucc.COLUMN_NAME) like '%ID' THEN substr(ucc.column_name,1,(length(ucc.column_name) - 2))
      else ucc.COLUMN_NAME end COLUMN_SUFFIX
  --uc.TABLE_NAME, ucc.COLUMN_NAME
  from 
    user_constraints uc
      inner join 
    user_cons_columns ucc
      on uc.constraint_name = ucc.constraint_name
  where uc.constraint_type = 'R' 
  and ucc.constraint_name not like 'BIN$%'
  and uc.TABLE_NAME not like 'z_%') fk_col ) fk2 

where CONSTRAINT_NAME <> FKNAME;


select 
  sequence_naming "Sequence Name Stats", count(*) "Total"
FROM
(

select  
  ut.TABLE_NAME, us.SEQUENCE_NAME, ('s_' || ut.table_name), ('s' || ut.table_name), 
  case when ut.table_name is null then 'Tables without corresponding sequences' 
       when us.sequence_name is null then 'Sequences without corresponding tables' 
       else 'Correctly named sequences' end sequence_naming 
from
  user_tables ut
    full join
  user_sequences us
    on ((('s_' || ut.table_name) = sequence_name) -- and ut.table_name not like '%z\_' escape '\') 
    or (('s' || ut.table_name) = sequence_name ))) qry
group by sequence_naming; --and ut.table_name like '%z\_' escape '\')) ;


select count(*) "Total Triggers" from user_triggers;

select  
count(*) 
"Primary Key Invalid Names"
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and constraint_name <> TABLE_NAME || '_pk';

select count(*) "PK Indexes Invalid Names"
from user_constraints 
where constraint_type = 'P' 
and constraint_name not like 'BIN$%'
and index_name <> TABLE_NAME || '_pk';

select count(*) "Log Columns Missing"
from
(
select utc.TABLE_NAME, utc.COLUMN_NAME from 
  user_tab_columns utc
    left join
  user_tab_columns zutc
    on utc.column_name = zutc.column_name
    and ('z_' || utc.table_name) = zutc.table_name
where utc.table_name not like 'z\_%' escape '\' 
and zutc.COLUMN_NAME is null 
and utc.TABLE_NAME not like 'clob_buffer');

/*
select count(zut.TABLE_NAME) "Orphaned Log Tables"
from
  user_tables ut
    right join
  user_tables zut
   on ('z_' || ut.table_name) = zut.table_name
where 
zut.table_name like 'z\_%' escape '\'
and ut.table_name is null
and zut.table_name not in ('z_activity_log', 'z_winston');
*/