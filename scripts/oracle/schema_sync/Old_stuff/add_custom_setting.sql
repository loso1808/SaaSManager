--------------------------------------------------------
--  DDL for Table custom_setting
--------------------------------------------------------

  CREATE TABLE "custom_setting" 
   (	"id" NUMBER, 
	"key" VARCHAR2(400 BYTE), 
	"value" CLOB, 
	"valueType" VARCHAR2(400 BYTE), 
	"configCategory" VARCHAR2(400 BYTE)
   );
   
--------------------------------------------------------
--  DDL for Index CUSTOM_SETTING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "custom_setting_pk" ON "custom_setting" ("id");
  
--------------------------------------------------------
--  Constraints for Table custom_setting
--------------------------------------------------------

  ALTER TABLE "custom_setting" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "custom_setting" MODIFY ("key" NOT NULL ENABLE);
  ALTER TABLE "custom_setting" ADD CONSTRAINT "custom_setting_pk" PRIMARY KEY ("id");


CREATE SEQUENCE "s_custom_setting" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;

ALTER TABLE "custom_setting" MODIFY ("id" DEFAULT ON NULL "s_custom_setting".NEXTVAL );    


/*
frontEnd.config
{
  "logo": "zm.nsd78244ijuy8dp;nadf;pasvnp",
  "companyName": "Arzeda"

}

appconfig.json
{
   "logging":{
      "level": "silly"
    }
}

id, key, value, valueType, configCategory
1, logo, zm.nsd78244ijuy8dp;nadf;pasvnp, base64image, frontEnd
2, logging, { "level": "silly" }, json, appconfig

*/