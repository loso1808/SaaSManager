alter table "z_sequence_j5run" drop constraint "z_sequence_j5run_pk";

drop index "z_sequence_j5run_pk";

alter table "z_sequence_j5run" add ("newId" NUMBER);
update "z_sequence_j5run" set "newId" = "id";
commit;
alter table "z_sequence_j5run" modify ("id" default null);
alter table "z_sequence_j5run" drop column "id";
alter table "z_sequence_j5run" rename column "newId" to "id";

alter table "z_sequence_j5run" modify ("logId" NUMBER DEFAULT ON NULL "sz_sequence_j5run"."NEXTVAL");


                                    
CREATE UNIQUE INDEX "z_sequence_j5run_pk" ON "z_sequence_j5run" ("logId");

ALTER TABLE "z_sequence_j5run" ADD CONSTRAINT "z_sequence_j5run_pk" PRIMARY KEY ("logId")
  USING INDEX ENABLE;