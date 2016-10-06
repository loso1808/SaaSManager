

alter table "sequence_j5run" rename column "construct_index" to "construct_id";
alter table "z_sequence_j5run" rename column "construct_index" to "construct_id";

alter table "protocol" add ("versionStr" VARCHAR2(256));
update "protocol" set "versionStr" = TO_CHAR("version");
commit;
alter table "protocol" drop column "version";
alter table "protocol" rename column "versionStr" to "version";

alter table "z_protocol" add ("versionStr" VARCHAR2(256));
update "z_protocol" set "versionStr" = TO_CHAR("version");
commit;
alter table "z_protocol" drop column "version";
alter table "z_protocol" rename column "versionStr" to "version";