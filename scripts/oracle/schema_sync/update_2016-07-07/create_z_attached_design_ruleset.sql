--------------------------------------------------------
--  DDL for Sequence sz_attached_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_attached_design_ruleset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table z_attached_design_ruleset
--------------------------------------------------------

  CREATE TABLE "z_attached_design_ruleset" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_attached_design_ruleset"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
  "shouldFilter" VARCHAR2(1),
  "shouldValidate" VARCHAR2(1),
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"design_ruleset_id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"id" NUMBER
   )  TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Index z_attached_design_ruleset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_attached_design_ruleset_pk" ON "z_attached_design_ruleset" ("logId")  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_attached_design_ruleset
--------------------------------------------------------

 -- ALTER TABLE "z_attached_design_ruleset" MODIFY ("logId" NOT NULL ENABLE);
 -- ALTER TABLE "z_attached_design_ruleset" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_attached_design_ruleset" ADD CONSTRAINT "z_attached_design_ruleset_pk" PRIMARY KEY ("logId") ENABLE;
