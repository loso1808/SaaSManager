--------------------------------------------------------
--  DDL for Sequence sz_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_design_ruleset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table z_design_ruleset
--------------------------------------------------------

  CREATE TABLE "z_design_ruleset" 
   (	"id" NUMBER DEFAULT ON NULL "sz_design_ruleset"."NEXTVAL", 
	"user_id" NUMBER, 
	"name" VARCHAR2(32 BYTE), 
	"description" VARCHAR2(256 BYTE), 
	"dateCreated" DATE, 
	"dateModified" DATE
   ) TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  DDL for Index z_design_ruleset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_design_ruleset_pk" ON "z_design_ruleset" ("id") 
  TABLESPACE &&LOG_TABLESPACE_NAME ;
--------------------------------------------------------
--  Constraints for Table z_design_ruleset
--------------------------------------------------------

  ALTER TABLE "z_design_ruleset" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "z_design_ruleset" ADD CONSTRAINT "z_design_ruleset_pk" PRIMARY KEY ("id") ENABLE;
