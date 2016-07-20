--------------------------------------------------------
--  DDL for Sequence sz_attached_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_custom_field"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table z_custom_field
--------------------------------------------------------

  CREATE TABLE "z_custom_field" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_custom_field"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"name" VARCHAR2(400 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"required" NUMBER, 
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"searchable" NUMBER, 
	"dataType" VARCHAR2(50 BYTE), 
	"defaultValueString" VARCHAR2(4000 BYTE), 
	"defaultValueNumber" NUMBER, 
	"defaultValueDate" VARCHAR2(20 BYTE), 
	"defaultValueFlag" NUMBER
   )  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_custom_field_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_field_pk" ON "z_custom_field" ("logId")  TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  Constraints for Table z_custom_field
--------------------------------------------------------

  --ALTER TABLE "z_custom_field" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_custom_field" ADD CONSTRAINT "z_custom_field_pk" PRIMARY KEY ("logId") ENABLE;
  --ALTER TABLE "z_custom_field" MODIFY ("dateLogged" NOT NULL ENABLE);
