
select "TABLE_NAME", "COLUMN_NAME", "DATA_TYPE", "DATA_LENGTH", "DATA_PRECISION", "DATA_SCALE", "NULLABLE", "DEFAULT_ON_NULL", "DATA_DEFAULT" from user_tab_cols;

select sys_context( 'userenv', 'current_schema' ) from dual;

select * from user_tab_cols;


select utl_raw.substr(DATA_DEFAULT, 1, 4000) from user_tab_cols;

REPLACE('"' || sys_context( 'userenv', 'current_schema' ) || '".', dbms_lob.substr(DATA_DEFAULT,4000, 1)) "DEFAULT" from user_tab_cols;
REPLACE('"PNY_TEST_DBO".', dbms_lob.substr(DATA_DEFAULT,4000, 1)) "DEFAULT" ;


select count(*) from user_tab_cols;

select 
  TABLE_NAME, CONSTRAINT_NAME, R_CONSTRAINT_NAME, DELETE_RULE, STATUS, DEFERRABLE, DEFERRED
from 
  user_constraints 
where 
  generated = 'USER NAME'
  and constraint_type = 'R';


select 
  TABLE_NAME, CONSTRAINT_NAME, INDEX_NAME, STATUS, DEFERRABLE, DEFERRED
from 
  user_constraints 
where 
  generated = 'USER NAME'
  and constraint_type = 'P';

select
 *
  --table_name, constraint_name, constraint_type
from 
  user_constraints;

select * from user_cons_columns where constraint_name not like 'SYS\_%' escape '\'; -- where generated = 'USER NAME'

select uic.INDEX_NAME, uic.TABLE_NAME, uic.COLUMN_NAME, uic.COLUMN_POSITION, uic.DESCEND from 
  user_objects uo
    inner join
  user_ind_columns uic
    on uo.object_name = uic.index_name    
where 
  uo.object_type = 'INDEX' 
  and uo.generated = 'N';

select * from user_objects;

select * from user_indexes;

select * from user_ind_columns;

select * from user_tablespaces;

select utl_raw.cast_to_varchar2(DATA_DEFAULT) FROM user_tab_cols where DATA_DEFAULT is not null;

select dbms_xmlgen.getxmltype('select TABLE_NAME, COLUMN_NAME, DATA_DEFAULT from user_tab_cols') from dual;

describe user_constraints;

select * from user_synonyms;

select * from all_objects where owner = 'PNY_TEST_DBO' and object_name = 'CONCAT_CLOB_BUFFER';