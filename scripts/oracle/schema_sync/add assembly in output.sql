--------------------------------------------------------
--  DDL for Sequence s_assembly_run
--------------------------------------------------------

 CREATE SEQUENCE  "s_assembly_op_input"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table assembly_run
--------------------------------------------------------

  CREATE TABLE "assembly_op_input" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_op_input"."NEXTVAL", 
      CONSTRAINT "assembly_op_input_pk" PRIMARY KEY ("id"),
      "assembly_operation_id" NUMBER,
      "assembly_op_output_id" NUMBER,
      "name" VARCHAR2(400 BYTE), 
      "dataType" VARCHAR2(400),
      "textValue" VARCHAR2(4000),
      "numericValue" NUMBER,
      "dateValue" TIMESTAMP (6),
      "jsonValue" CLOB,
      "dateCreated" TIMESTAMP (6), 
      "dateModified" TIMESTAMP (6), 
      "user_id" NUMBER
   );




--------------------------------------------------------
--  Ref Constraints for Table assembly_run
--------------------------------------------------------

  ALTER TABLE "assembly_op_input" ADD CONSTRAINT "assembly_op_i_assembly_oper_fk" FOREIGN KEY ("assembly_operation_id")
	  REFERENCES "assembly_operation" ("id") ENABLE;
    
      ALTER TABLE "assembly_op_input" ADD CONSTRAINT "assembly_op_i_assembly_op_o_fk" FOREIGN KEY ("assembly_op_output_id")
	  REFERENCES "assembly_op_output" ("id") ENABLE;