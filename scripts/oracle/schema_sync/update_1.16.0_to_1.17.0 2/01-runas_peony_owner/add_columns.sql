

ALTER TABLE "access_control" ADD ("privilege" VARCHAR2(50 BYTE));
ALTER TABLE "devicedesign" ADD ("isReadOnly" NUMBER);
ALTER TABLE "sequence" ADD ("isReadOnly" NUMBER);

ALTER TABLE "z_access_control" ADD ("privilege" VARCHAR2(50 BYTE));
ALTER TABLE "z_devicedesign" ADD ("isReadOnly" NUMBER);
ALTER TABLE "z_sequence" ADD ("isReadOnly" NUMBER);


ALTER TABLE "access_control" MODIFY ("privilege" DEFAULT ON NULL 'edit' );
ALTER TABLE "z_access_control" MODIFY ("privilege" DEFAULT ON NULL 'edit' );

ALTER TABLE "user_logs" ADD CONSTRAINT "user_logs_user_fk" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ENABLE;

ALTER TABLE "PEONY_OWNER"."access_control" MODIFY ("privilege" VARCHAR2(50 BYTE) NULL);
ALTER TABLE "PEONY_OWNER"."z_access_control" MODIFY ("privilege" VARCHAR2(50 BYTE) NULL);

