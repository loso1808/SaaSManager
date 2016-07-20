--------------------------------------------------------
--  DDL for Sequence s_custom_setting
--------------------------------------------------------

   CREATE SEQUENCE  "s_custom_setting"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table custom_setting
--------------------------------------------------------

  CREATE TABLE "custom_setting" 
   (	"id" NUMBER DEFAULT ON NULL "s_custom_setting"."NEXTVAL", 
	"key" VARCHAR2(400 BYTE), 
	"value" CLOB, 
	"valueType" VARCHAR2(400 BYTE), 
	"configCategory" VARCHAR2(400 BYTE), 
	"dateModified" DATE, 
	"dateCreated" DATE
   )  ;
--------------------------------------------------------
--  DDL for Index custom_setting_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "custom_setting_pk" ON "custom_setting" ("id") ;
  
--------------------------------------------------------
--  Constraints for Table custom_setting
--------------------------------------------------------

  --ALTER TABLE "custom_setting" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "custom_setting" MODIFY ("key" NOT NULL ENABLE);
  ALTER TABLE "custom_setting" ADD CONSTRAINT "custom_setting_pk" PRIMARY KEY ("id") ENABLE;
