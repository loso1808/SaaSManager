--------------------------------------------------------
--  DDL for Sequence s_plate
--------------------------------------------------------

   CREATE SEQUENCE  "sz_plate"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table plate
--------------------------------------------------------

  CREATE TABLE "z_plate" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_plate"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE,
  "id" NUMBER, 
	"plate_set_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PEONY_DATA" ;
--------------------------------------------------------
--  DDL for Index plate_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_plate_pk" ON "z_plate" ("logId") ;
  
  ALTER TABLE "z_plate" ADD CONSTRAINT "z_plate_pk" PRIMARY KEY ("logId")
  USING INDEX ENABLE;
