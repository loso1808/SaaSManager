alter table "user_logs" rename column "message" to "oldmessage";
alter table "z_user_logs" rename column "message" to "oldmessage";

alter table "user_logs" add ("message" CLOB);
alter table "z_user_logs" add ("message" CLOB);

update "user_logs"
set "message" = "oldmessage";

update "z_user_logs"
set "message" = "oldmessage";

commit;

alter table "user_logs" drop ("oldmessage");
alter table "z_user_logs" drop ("oldmessage");