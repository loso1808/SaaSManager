
   CREATE SEQUENCE  "sz_plate_well"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table plate_well
--------------------------------------------------------

  CREATE TABLE "z_plate_well" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_plate_well"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE,
  "id" NUMBER , 
	"plate_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"sampleName" VARCHAR2(400 BYTE), 
	"concentration" NUMBER, 
	"volume" NUMBER, 
	"metaData" CLOB, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   )  ;
--------------------------------------------------------
--  DDL for Index plate_well_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_plate_well_pk" ON "z_plate_well" ("logId")  ;
--------------------------------------------------------
--  Constraints for Table plate_well
--------------------------------------------------------

  ALTER TABLE "z_plate_well" ADD CONSTRAINT "z_plate_well_pk" PRIMARY KEY ("logId")
  USING INDEX ENABLE;
