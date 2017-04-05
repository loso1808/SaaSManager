alter table "sequence" drop column "j5run_id";
alter table "z_sequence" drop column "j5run_id";

alter table "j5run" drop column "next_level_part_id";
alter table "z_j5run" drop column "next_level_part_id";

alter table "j5run" add ("isInLibrary" NUMBER, "dateAddedToLibrary" TIMESTAMP(6), "designLineage" CLOB);
alter table "z_j5run" add ("isInLibrary" NUMBER, "dateAddedToLibrary" TIMESTAMP(6), "designLineage" CLOB);

alter table "devicedesign" add ("library" VARCHAR2(400));
alter table "z_devicedesign" add ("library" VARCHAR2(400));

alter table "j5run_construct" add ("library" VARCHAR2(400));
alter table "z_j5run_construct" add ("library" VARCHAR2(400));

alter table "next_level_part" add ("startEnzyme" VARCHAR2(64), "stopEnzyme" VARCHAR2(64), "wrapsOrigin" NUMBER(1,0));
alter table "z_next_level_part" add ("startEnzyme" VARCHAR2(64), "stopEnzyme" VARCHAR2(64), "wrapsOrigin" NUMBER(1,0));