--------------------------------------------------------
--  DDL for Sequence sz_design_rule_tag
--------------------------------------------------------

   CREATE SEQUENCE  "sz_design_rule_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table z_design_rule_tag
--------------------------------------------------------

  CREATE TABLE "z_design_rule_tag" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_design_rule_tag"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"dateCreated" DATE, 
	"existence" VARCHAR2(32 BYTE), 
	"id" NUMBER, 
	"dateModified" DATE, 
	"design_rule_id" NUMBER, 
	"tag_id" NUMBER
   )
  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_design_rule_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_design_rule_tag_pk" ON "z_design_rule_tag" ("logId") 
  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_design_rule_tag
--------------------------------------------------------

  ALTER TABLE "z_design_rule_tag" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_design_rule_tag" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_design_rule_tag" ADD CONSTRAINT "z_design_rule_tag_pk" PRIMARY KEY ("logId") ENABLE;
