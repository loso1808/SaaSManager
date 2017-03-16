update 
  "attached_design_ruleset"
set 
  "shouldFilter" = TO_NUMBER("oldshouldFilter"), 
  "shouldValidate" = TO_NUMBER("oldshouldValidate");

update 
  "z_attached_design_ruleset"
set 
  "shouldFilter" = TO_NUMBER("oldshouldFilter"), 
  "shouldValidate" = TO_NUMBER("oldshouldValidate");
  
alter table "z_attached_design_ruleset" drop ("oldshouldFilter", "oldshouldValidate");
commit;