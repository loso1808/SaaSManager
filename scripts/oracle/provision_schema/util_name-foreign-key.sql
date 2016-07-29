DEFINE TABLE_NAME = 'assembly_operation';
DEFINE COLUMN_NAME = 'assembly_run_id';



SELECT
          case
            when length(TABLE_NAME || '_' || COLUMN_SUFFIX || '_fk') > 30
              then TRIM(TRAILING '_' FROM substr(table_name, 1, 13)) || '_' ||
                   TRIM(TRAILING '_' FROM substr(column_suffix, 1, 13)) || '_fk'
            else
                  TABLE_NAME || '_' || COLUMN_SUFFIX || '_fk'
            end fkname  
FROM  
(      
        SELECT
            '&TABLE_NAME' as TABLE_NAME,
            case 
              when upper('&COLUMN_NAME') like '%\_ID' ESCAPE '\' THEN substr('&COLUMN_NAME',1,(length('&COLUMN_NAME') - 3))
              when upper('&COLUMN_NAME') like '%ID' THEN substr('&COLUMN_NAME',1,(length('&COLUMN_NAME') - 2))
              else '&COLUMN_NAME' end COLUMN_SUFFIX
        FROM dual
) qry;