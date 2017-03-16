select 1 from dual where exists(
select * from "access_control" where "userId" = 0 and "creatorId" = 0 and "objectId" in (1176, 1188, 1194) and "objectName" = 'custom_field');

select 
NVL(
(select "objectName" from "access_control" where ("userId" = 0 or "groupId" in (0,1)) and "objectId" in ("custom_field"."id") and "objectName" = 'custom_field' and rownum = 1)
,'read') priv,
"id"
from 
"custom_field";

select 
NVL(
(select "objectName" from "access_control" where ("userId" = 0 or "groupId" in (0,1)) and "creatorId" = 0 and "objectId" in (-1) and "objectName" = 'custom_field' and rownum = 1)
,'read') priv,
"id"
from 
"custom_field";