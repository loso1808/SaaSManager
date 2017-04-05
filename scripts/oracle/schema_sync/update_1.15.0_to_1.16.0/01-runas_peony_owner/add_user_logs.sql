--------------------------------------------------------
--  DDL for Sequence s_user_logs
--------------------------------------------------------

   CREATE SEQUENCE  "s_user_logs"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22174 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Sequence s_user_logs
--------------------------------------------------------

   CREATE SEQUENCE  "sz_user_logs"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22174 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table user_logs
--------------------------------------------------------

  CREATE TABLE "user_logs" 
   (	"id" NUMBER DEFAULT ON NULL "s_user_logs"."NEXTVAL", 
	"user_id" NUMBER, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(1000 BYTE), 
	"success" NUMBER, 
	"message" VARCHAR2(4000 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   )  ;
--------------------------------------------------------
--  DDL for Index user_logs_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "user_logs_pk" ON "user_logs" ("id")  ;
--------------------------------------------------------
--  Constraints for Table user_logs
--------------------------------------------------------

  ALTER TABLE "user_logs" ADD CONSTRAINT "user_logs_pk" PRIMARY KEY ("id")
  USING INDEX;



--------------------------------------------------------
--  DDL for Table z_user_logs
--------------------------------------------------------

  CREATE TABLE "z_user_logs" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_user_logs"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(1000 BYTE), 
	"success" NUMBER, 
	"message" VARCHAR2(4000 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE
   ) ;
--------------------------------------------------------
--  DDL for Index z_user_logs_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_user_logs_pk" ON "z_user_logs" ("logId") ;
--------------------------------------------------------
--  Constraints for Table z_user_logs
--------------------------------------------------------

  ALTER TABLE "z_user_logs" ADD CONSTRAINT "z_user_logs_pk" PRIMARY KEY ("logId")
  USING INDEX ;
