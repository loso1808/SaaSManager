--------------------------------------------------------
--  DDL for Sequence s_assembly_run
--------------------------------------------------------

 CREATE SEQUENCE  "s_assembly_op_output"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table assembly_run
--------------------------------------------------------

  CREATE TABLE "assembly_op_output" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_op_output"."NEXTVAL", 
      CONSTRAINT "assembly_op_output_pk" PRIMARY KEY ("id"),
      "name" VARCHAR2(400 BYTE), 
      "assembly_operation_id" NUMBER,
      "jsonValue" CLOB,
      "dateCreated" TIMESTAMP (6), 
      "dateModified" TIMESTAMP (6), 
      "user_id" NUMBER
   );



--------------------------------------------------------
--  Ref Constraints for Table assembly_run
--------------------------------------------------------

  ALTER TABLE "assembly_operation" ADD CONSTRAINT "assembly_oper_assembly_run_fk" FOREIGN KEY ("assembly_run_id")
	  REFERENCES "assembly_run" ("id") ENABLE;