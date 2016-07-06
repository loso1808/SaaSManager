

drop table "custom_fields" cascade constraints purge;
drop table "z_custom_fields" cascade constraints purge;

drop sequence "s_custom_fields";
drop sequence "sz_custom_fields";

alter table "z_user" drop column "masterDirectSynthesesList";
alter table "z_user" drop column "masterOligoList";
alter table "z_user" drop column "masterPlasmidList";