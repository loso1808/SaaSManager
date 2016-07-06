--------------------------------------------------------
--  DDL for Sequence s_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE "s_design_ruleset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table design_ruleset
--------------------------------------------------------

  CREATE TABLE "design_ruleset" 
   (	"id" NUMBER DEFAULT ON NULL "s_design_ruleset"."NEXTVAL", 
	"name" VARCHAR2(32 BYTE), 
	"description" VARCHAR2(256 BYTE), 
  "shouldFilter" VARCHAR2(1),
  "shouldValidate" VARCHAR2(1),
	"user_id" NUMBER, 
	"dateCreated" DATE, 
	"dateModified" DATE
   ) ;
--------------------------------------------------------
--  DDL for Index design_ruleset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "design_ruleset_pk" ON "design_ruleset" ("id");
--------------------------------------------------------
--  Constraints for Table design_ruleset
--------------------------------------------------------

  --ALTER TABLE "design_ruleset" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "design_ruleset" ADD CONSTRAINT "design_ruleset_pk" PRIMARY KEY ("id") ENABLE;
