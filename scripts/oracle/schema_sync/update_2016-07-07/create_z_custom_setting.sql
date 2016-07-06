--------------------------------------------------------
--  DDL for Sequence sz_attached_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_custom_setting"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;





--------------------------------------------------------
--  DDL for Table z_custom_setting
--------------------------------------------------------

  CREATE TABLE "z_custom_setting" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_custom_setting"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"value" CLOB, 
	"dateModified" DATE, 
	"id" NUMBER, 
	"dateCreated" DATE, 
	"key" VARCHAR2(400 BYTE), 
	"valueType" VARCHAR2(400 BYTE), 
	"configCategory" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_custom_setting_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_setting_pk" ON "z_custom_setting" ("logId") TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_custom_setting
--------------------------------------------------------

  ALTER TABLE "z_custom_setting" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_custom_setting" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_custom_setting" ADD CONSTRAINT "z_custom_setting_pk" PRIMARY KEY ("logId") ENABLE;
