set pagesize 1000;
set linesize 1000;

--select 'SELECT  ''' || object_name || ''' TABLE_NAME, COUNT(*) RECORD_COUNT FROM "' || object_name || '" WHERE "dateLogged" > (SYSDATE - 7) union all ' from user_objects where object_name like 'z_%' and object_type = 'TABLE';



select 'DELETE "' || object_name || '" WHERE "logSessionId" not in (SELECT "logSessionId" from "z_activity_log" where "logSessionId" is not null); ' 
from user_objects where object_name like 'z_%' and object_type = 'TABLE' and object_name not in ('z_activity_log', 'z_winston');