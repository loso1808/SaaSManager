alter table "attached_design_ruleset" rename column "shouldFilter" to "oldshouldFilter";
alter table "attached_design_ruleset" rename column "shouldValidate" to "oldshouldValidate";
alter table "attached_design_ruleset" add ("shouldFilter" NUMBER, "shouldValidate" NUMBER);

alter table "z_attached_design_ruleset" rename column "shouldFilter" to "oldshouldFilter";
alter table "z_attached_design_ruleset" rename column "shouldValidate" to "oldshouldValidate";
alter table "z_attached_design_ruleset" add ("shouldFilter" NUMBER, "shouldValidate" NUMBER);

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
  
commit;


alter table "attached_design_ruleset" drop ("oldshouldFilter", "oldshouldValidate");
alter table "z_attached_design_ruleset" drop ("oldshouldFilter", "oldshouldValidate");