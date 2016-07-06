--------------------------------------------------------
--  DDL for Sequence sz_lock
--------------------------------------------------------

   CREATE SEQUENCE  "sz_lock"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table z_lock
--------------------------------------------------------

  CREATE TABLE "z_lock" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_lock"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"lockExpires" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"objectId" NUMBER, 
	"id" NUMBER, 
	"objectName" VARCHAR2(20 BYTE), 
	"locked_by" NUMBER
   ) 
  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_lock_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_lock_pk" ON "z_lock" ("logId") 
  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_lock
--------------------------------------------------------

  ALTER TABLE "z_lock" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_lock" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_lock" ADD CONSTRAINT "z_lock_pk" PRIMARY KEY ("logId") ENABLE;
