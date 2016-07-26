--------------------------------------------------------
--  DDL for Sequence s_custom_field
--------------------------------------------------------

   CREATE SEQUENCE  "s_custom_field"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table custom_field
--------------------------------------------------------

  CREATE TABLE "custom_field" 
   (	"id" NUMBER DEFAULT ON NULL "s_custom_field"."NEXTVAL", 
	"objectName" VARCHAR2(50 BYTE), 
	"name" VARCHAR2(400 BYTE), 
	"required" NUMBER(*,0), 
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"searchable" NUMBER, 
	"dataType" VARCHAR2(50 BYTE), 
	"defaultValueString" VARCHAR2(4000 BYTE), 
	"defaultValueNumber" NUMBER, 
	"defaultValueDate" VARCHAR2(20 BYTE), 
	"defaultValueFlag" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index custom_field_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "custom_field_pk" ON "custom_field" ("id")  ;
--------------------------------------------------------
--  Constraints for Table custom_field
--------------------------------------------------------

  ALTER TABLE "custom_field" ADD CONSTRAINT "custom_field_pk" PRIMARY KEY ("id") ENABLE;
  ALTER TABLE "custom_field" MODIFY ("name" NOT NULL ENABLE);
  ALTER TABLE "custom_field" MODIFY ("objectName" NOT NULL ENABLE);
  --ALTER TABLE "custom_field" MODIFY ("id" NOT NULL ENABLE);
