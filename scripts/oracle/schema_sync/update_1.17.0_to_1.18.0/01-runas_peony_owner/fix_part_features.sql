alter table "part" rename column "features" to "oldfeatures";
alter table "z_part" rename column "features" to "oldfeatures";

alter table "part" add ("features" CLOB);
alter table "z_part" add ("features" CLOB);

update "part"
set "features" = "oldfeatures";

update "z_part"
set "features" = "oldfeatures";

commit;

alter table "part" drop ("oldfeatures");
alter table "z_part" drop ("oldfeatures");