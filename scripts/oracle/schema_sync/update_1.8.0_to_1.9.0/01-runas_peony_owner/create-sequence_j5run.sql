--------------------------------------------------------
--  DDL for Sequence s_sequence_j5run
--------------------------------------------------------

   CREATE SEQUENCE  "s_sequence_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table sequence_j5run
--------------------------------------------------------

  CREATE TABLE "sequence_j5run" 
   (	"id" NUMBER DEFAULT ON NULL "s_sequence_j5run"."NEXTVAL", 
	"sequence_id" NUMBER, 
	"j5run_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"construct_index" NUMBER
   )  ;
--------------------------------------------------------
--  DDL for Index sequence_j5run_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "sequence_j5run_pk" ON "sequence_j5run" ("id")  ;
--------------------------------------------------------
--  Constraints for Table sequence_j5run
--------------------------------------------------------

  ALTER TABLE "sequence_j5run" ADD CONSTRAINT "sequence_j5run_pk" PRIMARY KEY ("id")
  USING INDEX ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table sequence_j5run
--------------------------------------------------------

  ALTER TABLE "sequence_j5run" ADD CONSTRAINT "sequence_j5run_j5run_fk" FOREIGN KEY ("j5run_id")
	  REFERENCES "j5run" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "sequence_j5run" ADD CONSTRAINT "sequence_j5run_sequence_fk" FOREIGN KEY ("sequence_id")
	  REFERENCES "sequence" ("id") ON DELETE CASCADE ENABLE;
