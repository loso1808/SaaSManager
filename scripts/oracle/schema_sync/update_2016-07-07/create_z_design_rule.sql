--------------------------------------------------------
--  DDL for Sequence sz_design_rule
--------------------------------------------------------

   CREATE SEQUENCE  "sz_design_rule"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table z_design_rule
--------------------------------------------------------

  CREATE TABLE "z_design_rule" 
   (	"id" NUMBER, 
	"user_id" NUMBER, 
	"design_ruleset_id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(256 BYTE), 
	"regex" VARCHAR2(256 BYTE), 
	"dateModified" DATE, 
	"dateCreated" DATE, 
	"logId" NUMBER DEFAULT ON NULL "sz_design_rule"."NEXTVAL", 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"columnName" VARCHAR2(256 BYTE), 
	"columnIndex" VARCHAR2(32 BYTE)
   )
  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_design_rule_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_design_rule_pk" ON "z_design_rule" ("logId") 
  TABLESPACE  &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_design_rule
--------------------------------------------------------

  ALTER TABLE "z_design_rule" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_design_rule" ADD CONSTRAINT "z_design_rule_pk" PRIMARY KEY ("logId") ENABLE;
  ALTER TABLE "z_design_rule" MODIFY ("dateLogged" NOT NULL ENABLE);
