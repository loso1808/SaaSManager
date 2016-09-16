insert into "access_control" ("objectId", "objectName", "userId", "groupId", "dateCreated", "creatorId", "dependsOn")
select 
  --count(*) "Total"
  pt."id", 'part_tag' "objectName", ac."userId", ac."groupId", ac."dateCreated", ac."creatorId", ac."dependsOn"
from
  "access_control" ac
    inner join
  "attached_tag" att
    on ac."objectId" = att."id"
    and ac."objectName" = 'attached_tag'
    inner join
  "part_tag" pt
    on pt."part_id" = att."tagged_data_id"
    and pt."tag_id" = att."tag_id";
    
    select * from "access_control" where "objectName" = 'attached_tag';
    
    update "access_control"
    set "objectName" = 'attached_tag'
    where "objectName" = 'part_tag';
    commit;
    
    select count(*) from "attached_tag";
    
    select * from "part_tag";
    
    delete "part_tag" where "id" = 53;
    
    delete "access_control" where "objectName" = 'part_tag' and "objectId" = 53;