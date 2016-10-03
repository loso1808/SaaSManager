select * from
(
select utc.TABLE_NAME, utc.COLUMN_NAME, 
        case 
          when utc.DATA_TYPE <> zutc.DATA_TYPE then 'Invalid Data Types'
          when utc.DATA_LENGTH <> zutc.DATA_LENGTH then 'Inconsistent Data Lengths'
          when utc.DATA_SCALE <> zutc.DATA_SCALE then 'Inconsistent Data Scales'
          when utc.DATA_PRECISION <> zutc.DATA_PRECISION then 'Inconsistent Data Precisions'
          else null end DATA_TYPE_STATUS,
      case when zutc.NULLABLE <> 'Y' then 'Log Column Is Not Nullable' else null end LOG_COLUMN_NULLABILITY
from 
  user_tab_columns utc
    left join
  user_tab_columns zutc
    on utc.column_name = zutc.column_name
    and ('z_' || utc.table_name) = zutc.table_name
where utc.table_name not like 'z\_%' escape '\' 
and utc.TABLE_NAME not like 'clob_buffer') cmp
where cmp.DATA_TYPE_STATUS is not null or cmp.LOG_COLUMN_NULLABILITY is not null;


select * from user_tab_columns;