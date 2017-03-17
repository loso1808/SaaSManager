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

alter table "z_user_logs" MODIFY ("dateLogged" DEFAULT ON NULL SYSDATE);

UPDATE "access_control" SET "privilege" = 'edit' WHERE "privilege" IS NULL;

commit;

ALTER TABLE "access_control" MODIFY ("privilege" DEFAULT ON NULL 'edit' );

ALTER TABLE "z_access_control" DROP ("privilege");
ALTER TABLE "z_access_control" ADD ("privilege" VARCHAR2(50 BYTE));

--alter table "design_ruleset" drop ("shouldValidate", "shouldFilter");
alter table "z_design_ruleset" drop ("shouldValidate", "shouldFilter");