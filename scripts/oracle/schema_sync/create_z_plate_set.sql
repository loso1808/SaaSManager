
   CREATE SEQUENCE  "sz_plate_set"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table plate_set
--------------------------------------------------------

  CREATE TABLE "z_plate_set" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_plate_set"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE,
  "id" NUMBER, 
	"assembly_operation_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"sampleType" VARCHAR2(400 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"plateFormat" VARCHAR2(400 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Index plateset_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_plate_set_pk" ON "z_plate_set" ("logId");
--------------------------------------------------------
--  Constraints for Table plate_set
--------------------------------------------------------

  ALTER TABLE "z_plate_set" ADD CONSTRAINT "z_plate_set_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;