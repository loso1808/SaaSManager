CREATE SEQUENCE "sz_assembly_op_input" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;

  CREATE TABLE "z_assembly_op_input" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_assembly_op_input"."NEXTVAL", 
   CONSTRAINT "z_assembly_op_input_pk" PRIMARY KEY ("logId"),
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
  "id" NUMBER,
	"assembly_operation_id" NUMBER, 
	"assembly_op_output_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"dataType" VARCHAR2(400 BYTE), 
	"textValue" VARCHAR2(4000 BYTE), 
	"numericValue" NUMBER, 
	"dateValue" TIMESTAMP (6), 
	"jsonValue" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   );