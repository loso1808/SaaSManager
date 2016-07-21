--------------------------------------------------------
--  DDL for Sequence s_design_rule
--------------------------------------------------------

   CREATE SEQUENCE  "s_design_rule"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table design_rule
--------------------------------------------------------

  CREATE TABLE "design_rule" 
   (	"id" NUMBER DEFAULT ON NULL "s_design_rule"."NEXTVAL", 
	"name" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateModified" DATE, 
	"dateCreated" DATE, 
	"type" VARCHAR2(256 BYTE), 
	"regex" VARCHAR2(256 BYTE), 
	"design_ruleset_id" NUMBER, 
	"columnName" VARCHAR2(256 BYTE), 
	"columnIndex" VARCHAR2(32 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Index design_rule_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "design_rule_pk" ON "design_rule" ("id")  ;
--------------------------------------------------------
--  Constraints for Table design_rule
--------------------------------------------------------

  --ALTER TABLE "design_rule" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "design_rule" ADD CONSTRAINT "design_rule_pk" PRIMARY KEY ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table design_rule
--------------------------------------------------------

  ALTER TABLE "design_rule" ADD CONSTRAINT "design_rule_design_ruleset_fk" FOREIGN KEY ("design_ruleset_id")
	  REFERENCES "design_ruleset" ("id") ON DELETE CASCADE ENABLE;
