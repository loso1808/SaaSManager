CREATE SEQUENCE "sz_assembly_operation" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;

  CREATE TABLE "z_assembly_operation" 
   (		"logId" NUMBER DEFAULT "sz_assembly_operation"."NEXTVAL", 
   CONSTRAINT "z_assembly_operation_pk" PRIMARY KEY ("logId"),
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
   "id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"assembly_run_id" NUMBER, 
	"description" VARCHAR2(4000 BYTE), 
	"status" VARCHAR2(400 BYTE), 
	"operationType" VARCHAR2(400 BYTE), 
	"index" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
