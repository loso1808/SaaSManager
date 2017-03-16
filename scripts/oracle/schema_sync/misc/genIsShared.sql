set pagesize 1000;
set linesize 1000;

select 'ALTER TABLE "' || TABLE_NAME || '" ADD ("isShared" NUMBER); ' 
from user_tables
where table_name in ('devicedesign','protocol','sequence','protein','part','strain','project');


select 'ALTER TABLE "' || TABLE_NAME || '" ADD ("isShared" NUMBER); ' 
from user_tables
where substr(table_name, 3) in ('devicedesign','protocol','sequence','protein','part','strain','project');

select
--TABLE_NAME,
'update "' || TABLE_NAME || '" set "isShared" = 0; ' || chr(10) ||
'update "' || TABLE_NAME || '" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = ''' || TABLE_NAME || ''' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));' updateScript

from user_tables
where table_name in ('devicedesign','protocol','sequence','protein','part','strain','project');