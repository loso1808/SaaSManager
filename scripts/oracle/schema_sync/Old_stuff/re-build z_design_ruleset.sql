DROP TABLE "PEONY_OWNER"."z_design_ruleset"  CASCADE CONSTRAINTS PURGE;

--------------------------------------------------------
--  DDL for Table z_design_ruleset
--------------------------------------------------------

  CREATE TABLE "PEONY_OWNER"."z_design_ruleset" 
   (	"logId" NUMBER DEFAULT "PEONY_OWNER"."sz_design_ruleset"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
  "id" NUMBER , 
	"user_id" NUMBER, 
	"name" VARCHAR2(32 BYTE), 
	"description" VARCHAR2(256 BYTE), 
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"shouldFilter" VARCHAR2(1 BYTE), 
	"shouldValidate" VARCHAR2(1 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Index z_design_ruleset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "PEONY_OWNER"."z_design_ruleset_pk" ON "PEONY_OWNER"."z_design_ruleset" ("logId");
--------------------------------------------------------
--  Constraints for Table z_design_ruleset
--------------------------------------------------------

  ALTER TABLE "PEONY_OWNER"."z_design_ruleset" ADD CONSTRAINT "z_design_ruleset_pk" PRIMARY KEY ("logId")
  USING INDEX ENABLE;
