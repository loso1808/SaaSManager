--------------------------------------------------------
--  DDL for Sequence s_custom_field_value
--------------------------------------------------------

   CREATE SEQUENCE  "s_custom_field_value"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table custom_field_value
--------------------------------------------------------

  CREATE TABLE "custom_field_value" 
   (	"id" NUMBER DEFAULT ON NULL "s_custom_field_value"."NEXTVAL", 
	"custom_field_id" NUMBER, 
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"valueString" VARCHAR2(4000 BYTE), 
	"valueNumber" NUMBER, 
	"valueDate" VARCHAR2(20 BYTE), 
	"valueFlag" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index custom_field_value_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "custom_field_value_pk" ON "custom_field_value" ("id")  ;
--------------------------------------------------------
--  Constraints for Table custom_field_value
--------------------------------------------------------

  --ALTER TABLE "custom_field_value" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "custom_field_value" MODIFY ("custom_field_id" NOT NULL ENABLE);
  ALTER TABLE "custom_field_value" ADD CONSTRAINT "custom_field_value_pk" PRIMARY KEY ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table custom_field_value
--------------------------------------------------------

  ALTER TABLE "custom_field_value" ADD CONSTRAINT "custom_field_custom_field_fk" FOREIGN KEY ("custom_field_id")
	  REFERENCES "custom_field" ("id") ON DELETE CASCADE ENABLE;
