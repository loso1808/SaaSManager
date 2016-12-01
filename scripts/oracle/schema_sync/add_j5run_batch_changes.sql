alter table "sequence" drop column "j5run_id";
alter table "z_sequence" drop column "j5run_id";

alter table "j5run" drop column "next_level_part_id";
alter table "z_j5run" drop column "next_level_part_id";

alter table "j5run" add ("isInLibrary" NUMBER, "dateAddedToLibrary" TIMESTAMP(6), "designLineage" CLOB);
alter table "z_j5run" add ("isInLibrary" NUMBER, "dateAddedToLibrary" TIMESTAMP(6), "designLineage" CLOB);