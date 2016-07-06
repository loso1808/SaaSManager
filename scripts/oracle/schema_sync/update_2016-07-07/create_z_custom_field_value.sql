--------------------------------------------------------
--  DDL for Sequence sz_attached_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_custom_field_value"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;




--------------------------------------------------------
--  DDL for Table z_custom_field_value
--------------------------------------------------------

  CREATE TABLE "z_custom_field_value" 
   (	"id" NUMBER, 
	"custom_field_id" NUMBER, 
	"dateModified" DATE, 
	"dateCreated" DATE, 
	"objectId" NUMBER, 
	"logId" NUMBER DEFAULT ON NULL "sz_custom_field_value"."NEXTVAL", 
	"logSessionId" NUMBER, 
	"logAction" VARCHAR2(20 BYTE), 
	"dateLogged" DATE DEFAULT ON NULL SYSDATE, 
	"objectName" VARCHAR2(50 BYTE), 
	"valueString" VARCHAR2(4000 BYTE), 
	"valueNumber" NUMBER, 
	"valueDate" VARCHAR2(20 BYTE), 
	"valueFlag" NUMBER
   )  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_custom_field_value_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_field_value_pk" ON "z_custom_field_value" ("logId")  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_custom_field_value
--------------------------------------------------------

  ALTER TABLE "z_custom_field_value" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_custom_field_value" ADD CONSTRAINT "z_custom_field_value_pk" PRIMARY KEY ("logId")  ENABLE;
  ALTER TABLE "z_custom_field_value" MODIFY ("dateLogged" NOT NULL ENABLE);
