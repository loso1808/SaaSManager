--------------------------------------------------------
--  DDL for Sequence s_attached_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "s_attached_design_ruleset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table attached_design_ruleset
--------------------------------------------------------

  CREATE TABLE "attached_design_ruleset" 
   (	"id" NUMBER DEFAULT ON NULL "s_attached_design_ruleset"."NEXTVAL", 
	"devicedesign_id" NUMBER, 
	"design_ruleset_id" NUMBER, 
	"dateCreated" DATE, 
	"dateModified" DATE
   )  ;
--------------------------------------------------------
--  DDL for Index attached_design_ruleset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "attached_design_ruleset_pk" ON "attached_design_ruleset" ("id")  ;
--------------------------------------------------------
--  Constraints for Table attached_design_ruleset
--------------------------------------------------------

  ALTER TABLE "attached_design_ruleset" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "attached_design_ruleset" MODIFY ("devicedesign_id" NOT NULL ENABLE);
  ALTER TABLE "attached_design_ruleset" ADD CONSTRAINT "attached_design_ruleset_pk" PRIMARY KEY ("id")  ENABLE;
  ALTER TABLE "attached_design_ruleset" MODIFY ("design_ruleset_id" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table attached_design_ruleset
--------------------------------------------------------

  ALTER TABLE "attached_design_ruleset" ADD CONSTRAINT "attached_desi_design_rulese_fk" FOREIGN KEY ("design_ruleset_id")
	  REFERENCES "design_ruleset" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "attached_design_ruleset" ADD CONSTRAINT "attached_desi_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
