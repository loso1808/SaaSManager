  select utc.TABLE_NAME, utc.COLUMN_NAME,
  
  'ALTER TABLE "z_' || utc.TABLE_NAME || '" ADD "' || utc.column_name || '" ' || utc.DATA_TYPE ||
  
  (case when utc.DATA_TYPE = 'VARCHAR2' then '(' || utc.DATA_LENGTH || ')' else '' end) str
  
  from 
    user_tab_columns utc
      left join
    user_tab_columns zutc
      on utc.column_name = zutc.column_name
      and ('z_' || utc.table_name) = zutc.table_name
  where utc.table_name not like 'z\_%' escape '\' 
  and zutc.COLUMN_NAME is null 
  and utc.TABLE_NAME not like 'clob_buffer';
      --and ('z_' || utc.table_name) in (select TABLE_NAME from user_tables);
      
    