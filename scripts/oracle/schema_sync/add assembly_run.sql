--------------------------------------------------------
--  DDL for Sequence s_assembly_run
--------------------------------------------------------

   CREATE SEQUENCE  "s_assembly_run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table assembly_run
--------------------------------------------------------

  CREATE TABLE "assembly_run" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_run"."NEXTVAL", 
      CONSTRAINT "assembly_run_pk" PRIMARY KEY ("id"),
      "name" VARCHAR2(400 BYTE), 
      "j5run_id" NUMBER, 
      "dateCreated" TIMESTAMP (6), 
      "dateModified" TIMESTAMP (6), 
      "user_id" NUMBER
   );

--------------------------------------------------------
--  Ref Constraints for Table assembly_run
--------------------------------------------------------

  ALTER TABLE "assembly_run" ADD CONSTRAINT "assembly_run_j5run_fk" FOREIGN KEY ("j5run_id")
	  REFERENCES "j5run" ("id") ENABLE;