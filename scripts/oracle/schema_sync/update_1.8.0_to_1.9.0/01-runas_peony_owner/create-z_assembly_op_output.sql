CREATE SEQUENCE "sz_assembly_op_output" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;

  CREATE TABLE "z_assembly_op_output" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_assembly_op_output"."NEXTVAL", 
   CONSTRAINT "z_assembly_op_output_pk" PRIMARY KEY ("logId"),
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
  "id" NUMBER,
	"name" VARCHAR2(400 BYTE), 
	"fullName" VARCHAR2(400 BYTE), 
	"outputType" VARCHAR2(400 BYTE), 
	"assembly_operation_id" NUMBER, 
	"jsonValue" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   );