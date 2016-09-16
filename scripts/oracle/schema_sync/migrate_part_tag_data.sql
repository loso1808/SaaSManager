insert into "part_tag" ("part_id","tag_id", "dateCreated", "dateModified")
select "tagged_data_id","tag_id", "dateCreated", "dateModified" from "attached_tag" 
where "tag_id" in (select "id" from "tag")
and "tagged_data_id" in (select "id" from "part");

commit;

update "part_tag" pt
set "user_id" = (select "user_id" from "part" where "id" = pt."part_id");

commit;