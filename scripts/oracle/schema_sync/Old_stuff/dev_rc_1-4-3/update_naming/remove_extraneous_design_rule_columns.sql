alter table "z_design_rule" drop column "existence";
alter table "z_design_rule" drop column "operator";
alter table "z_design_rule" drop column "creatorName";

alter table "z_custom_field" modify ("defaultValueFlag" number);
alter table "z_custom_field" modify ("required" number);