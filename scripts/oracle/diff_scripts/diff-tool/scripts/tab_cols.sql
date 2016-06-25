
select "TABLE_NAME", "COLUMN_NAME", "DATA_TYPE", "DATA_LENGTH", "DATA_PRECISION", "DATA_SCALE", "NULLABLE", "DEFAULT_ON_NULL", "DATA_DEFAULT" from user_tab_cols;

select sys_context( 'userenv', 'current_schema' ) from dual;

select * from user_tab_cols;


select utl_raw.substr(DATA_DEFAULT, 1, 4000) from user_tab_cols;

REPLACE('"' || sys_context( 'userenv', 'current_schema' ) || '".', dbms_lob.substr(DATA_DEFAULT,4000, 1)) "DEFAULT" from user_tab_cols;
REPLACE('"PNY_TEST_DBO".', dbms_lob.substr(DATA_DEFAULT,4000, 1)) "DEFAULT" ;