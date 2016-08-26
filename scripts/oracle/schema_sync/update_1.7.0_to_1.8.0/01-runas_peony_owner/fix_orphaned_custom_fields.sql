update
  "custom_field" cf
set 
  "user_id" =  (select 
    ac."userId"
  from 
    "access_control" ac
  where
    ac."objectName" = 'custom_field'
    and ac."objectId" = cf."id"
    and ac."creatorId" = 0);


update 
  "custom_field_value" cfv
set 
  "user_id" = (select 
    ac."userId"
  from 
    "access_control" ac
  where
    ac."objectName" = 'custom_field_value'
    and ac."objectId" = cfv."id"
    and ac."creatorId" = 0);


