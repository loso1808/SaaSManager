--------------------------------------------------------
--  DDL for Sequence s_assembly_run
--------------------------------------------------------

 CREATE SEQUENCE  "s_assembly_operation"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table assembly_run
--------------------------------------------------------

  CREATE TABLE "assembly_operation" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_operation"."NEXTVAL", 
      CONSTRAINT "assembly_operation_pk" PRIMARY KEY ("id"),
      "name" VARCHAR2(400 BYTE), 
      "assembly_run_id" NUMBER,
      "description" VARCHAR2(4000),
      "status" VARCHAR2(400),
      "operationType" VARCHAR2(400),
      "index" NUMBER,
      "dateCreated" TIMESTAMP (6), 
      "dateModified" TIMESTAMP (6), 
      "user_id" NUMBER
   );



--------------------------------------------------------
--  Ref Constraints for Table assembly_run
--------------------------------------------------------

  ALTER TABLE "assembly_operation" ADD CONSTRAINT "assembly_oper_assembly_run_fk" FOREIGN KEY ("assembly_run_id")
	  REFERENCES "assembly_run" ("id") ENABLE;