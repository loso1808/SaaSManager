
--------------------------------------------------------
--  DDL for Sequence sz_sequence_j5run
--------------------------------------------------------

   CREATE SEQUENCE  "sz_sequence_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table z_sequence_j5run
--------------------------------------------------------

  CREATE TABLE "z_sequence_j5run" 
   (	"logId" NUMBER DEFAULT "sz_sequence_j5run"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"id" NUMBER DEFAULT ON NULL "sz_sequence_j5run"."NEXTVAL", 
	"sequence_id" NUMBER, 
	"j5run_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"construct_index" NUMBER
   )  ;
--------------------------------------------------------
--  DDL for Index z_sequence_j5run_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_sequence_j5run_pk" ON "z_sequence_j5run" ("id");
  
--------------------------------------------------------
--  Constraints for Table z_sequence_j5run
--------------------------------------------------------

  ALTER TABLE "z_sequence_j5run" ADD CONSTRAINT "z_sequence_j5run_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
