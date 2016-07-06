--------------------------------------------------------
--  DDL for Sequence s_design_rule_tag
--------------------------------------------------------

   CREATE SEQUENCE  "s_design_rule_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table design_rule_tag
--------------------------------------------------------

  CREATE TABLE "design_rule_tag" 
   (	"id" NUMBER DEFAULT ON NULL "s_design_rule_tag"."NEXTVAL", 
	"design_rule_id" NUMBER, 
	"tag_id" NUMBER, 
	"existence" VARCHAR2(32 BYTE), 
	"dateCreated" DATE, 
	"dateModified" DATE
   ) ;
--------------------------------------------------------
--  DDL for Index design_rule_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "design_rule_tag_pk" ON "design_rule_tag" ("id") ;
--------------------------------------------------------
--  Constraints for Table design_rule_tag
--------------------------------------------------------

  ALTER TABLE "design_rule_tag" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "design_rule_tag" MODIFY ("design_rule_id" NOT NULL ENABLE);
  ALTER TABLE "design_rule_tag" MODIFY ("tag_id" NOT NULL ENABLE);
  ALTER TABLE "design_rule_tag" ADD CONSTRAINT "design_rule_tag_pk" PRIMARY KEY ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table design_rule_tag
--------------------------------------------------------

  ALTER TABLE "design_rule_tag" ADD CONSTRAINT "design_rule_tag_design_rule_fk" FOREIGN KEY ("design_rule_id")
	  REFERENCES "design_rule" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "design_rule_tag" ADD CONSTRAINT "design_rule_tag_tag_fk" FOREIGN KEY ("tag_id")
	  REFERENCES "tag" ("id") ON DELETE CASCADE ENABLE;
