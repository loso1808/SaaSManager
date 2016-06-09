delete "dd_part"
where "id" IN
(
  select dp."id" from 
    "dd_part" dp
      left join
    "part" p
      on dp."part_id" = p."id"
  where
    p."id" is null
);

alter table "dd_part" 
      add constraint "dd_part_part_id_fk" foreign key("part_id") 
      references "part" ("id") ON DELETE CASCADE ENABLE;