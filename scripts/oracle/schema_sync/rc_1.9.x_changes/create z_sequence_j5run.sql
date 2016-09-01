--------------------------------------------------------
--  DDL for Sequence s_sequence_j5run
--------------------------------------------------------

   CREATE SEQUENCE  "PEONY_OWNER"."sz_sequence_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table sequence_j5run
--------------------------------------------------------

  CREATE TABLE "PEONY_OWNER"."z_sequence_j5run" 
   (	
   "logId" NUMBER DEFAULT "PEONY_OWNER"."sz_sequence_j5run"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
   "id" NUMBER, 
	"sequence_id" NUMBER, 
	"j5run_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"construct_index" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index sequence_j5run_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PEONY_OWNER"."z_sequence_j5run_pk" ON "PEONY_OWNER"."z_sequence_j5run" ("id") ;
--------------------------------------------------------
--  Constraints for Table sequence_j5run
--------------------------------------------------------

  ALTER TABLE "PEONY_OWNER"."z_sequence_j5run" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "PEONY_OWNER"."z_sequence_j5run" ADD CONSTRAINT "z_sequence_j5run_pk" PRIMARY KEY ("id") ENABLE;
