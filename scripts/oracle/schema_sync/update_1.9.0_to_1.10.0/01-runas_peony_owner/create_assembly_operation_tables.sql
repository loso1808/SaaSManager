--------------------------------------------------------
--  DDL for Sequence s_assembly_op_input
--------------------------------------------------------

   CREATE SEQUENCE  "s_assembly_op_input"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_assembly_op_output
--------------------------------------------------------

   CREATE SEQUENCE  "s_assembly_op_output"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_assembly_operation
--------------------------------------------------------

   CREATE SEQUENCE  "s_assembly_operation"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_assembly_run
--------------------------------------------------------

   CREATE SEQUENCE  "s_assembly_run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_plate
--------------------------------------------------------

   CREATE SEQUENCE  "s_plate"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_plate_set
--------------------------------------------------------

   CREATE SEQUENCE  "s_plate_set"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_plate_well
--------------------------------------------------------

   CREATE SEQUENCE  "s_plate_well"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_assembly_op_input
--------------------------------------------------------

   CREATE SEQUENCE  "sz_assembly_op_input"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_assembly_op_output
--------------------------------------------------------

   CREATE SEQUENCE  "sz_assembly_op_output"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_assembly_operation
--------------------------------------------------------

   CREATE SEQUENCE  "sz_assembly_operation"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_assembly_run
--------------------------------------------------------

   CREATE SEQUENCE  "sz_assembly_run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_plate
--------------------------------------------------------

   CREATE SEQUENCE  "sz_plate"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_plate_set
--------------------------------------------------------

   CREATE SEQUENCE  "sz_plate_set"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_plate_well
--------------------------------------------------------

   CREATE SEQUENCE  "sz_plate_well"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   
   
--------------------------------------------------------
--  DDL for Table assembly_op_input
--------------------------------------------------------

  CREATE TABLE "assembly_op_input" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_op_input"."NEXTVAL", 
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
	"user_id" NUMBER, 
	"plate_set_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table assembly_op_output
--------------------------------------------------------

  CREATE TABLE "assembly_op_output" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_op_output"."NEXTVAL", 
	"name" VARCHAR2(400 BYTE), 
	"assembly_operation_id" NUMBER, 
	"jsonValue" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table assembly_operation
--------------------------------------------------------

  CREATE TABLE "assembly_operation" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_operation"."NEXTVAL", 
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
--------------------------------------------------------
--  DDL for Table assembly_run
--------------------------------------------------------

  CREATE TABLE "assembly_run" 
   (	"id" NUMBER DEFAULT ON NULL "s_assembly_run"."NEXTVAL", 
	"name" VARCHAR2(400 BYTE), 
	"j5run_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table plate
--------------------------------------------------------

  CREATE TABLE "plate" 
   (	"id" NUMBER DEFAULT ON NULL "s_plate"."NEXTVAL", 
	"plate_set_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table plate_set
--------------------------------------------------------

  CREATE TABLE "plate_set" 
   (	"id" NUMBER DEFAULT ON NULL "s_plate_set"."NEXTVAL", 
	"name" VARCHAR2(400 BYTE), 
	"sampleType" VARCHAR2(400 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"plateFormat" VARCHAR2(400 BYTE), 
	"assembly_operation_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table plate_well
--------------------------------------------------------

  CREATE TABLE "plate_well" 
   (	"id" NUMBER DEFAULT ON NULL "s_plate_well"."NEXTVAL", 
	"plate_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"sampleName" VARCHAR2(400 BYTE), 
	"concentration" NUMBER, 
	"volume" NUMBER, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"sourceMaterial" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table z_assembly_op_input
--------------------------------------------------------

  CREATE TABLE "z_assembly_op_input" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_assembly_op_input"."NEXTVAL", 
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
	"user_id" NUMBER, 
	"plate_set_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table z_assembly_op_output
--------------------------------------------------------

  CREATE TABLE "z_assembly_op_output" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_assembly_op_output"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"assembly_operation_id" NUMBER, 
	"jsonValue" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table z_assembly_operation
--------------------------------------------------------

  CREATE TABLE "z_assembly_operation" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_assembly_operation"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
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
--------------------------------------------------------
--  DDL for Table z_assembly_run
--------------------------------------------------------

  CREATE TABLE "z_assembly_run" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_assembly_run"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"j5run_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table z_plate
--------------------------------------------------------

  CREATE TABLE "z_plate" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_plate"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"id" NUMBER, 
	"plate_set_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table z_plate_set
--------------------------------------------------------

  CREATE TABLE "z_plate_set" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_plate_set"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"sampleType" VARCHAR2(400 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"plateFormat" VARCHAR2(400 BYTE), 
	"assembly_operation_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table z_plate_well
--------------------------------------------------------

  CREATE TABLE "z_plate_well" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_plate_well"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"id" NUMBER, 
	"plate_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"sampleName" VARCHAR2(400 BYTE), 
	"concentration" NUMBER, 
	"volume" NUMBER, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"sourceMaterial" VARCHAR2(4000 BYTE)
   ) ;

--------------------------------------------------------
--  DDL for Index assembly_op_input_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "assembly_op_input_pk" ON "assembly_op_input" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index assembly_op_output_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "assembly_op_output_pk" ON "assembly_op_output" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index assembly_operation_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "assembly_operation_pk" ON "assembly_operation" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index assembly_run_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "assembly_run_pk" ON "assembly_run" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index z_assembly_op_input_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_assembly_op_input_pk" ON "z_assembly_op_input" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_assembly_op_output_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_assembly_op_output_pk" ON "z_assembly_op_output" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_assembly_operation_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_assembly_operation_pk" ON "z_assembly_operation" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_assembly_run_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_assembly_run_pk" ON "z_assembly_run" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index plate_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "plate_pk" ON "plate" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index plate_set_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "plate_set_pk" ON "plate_set" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index plate_well_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "plate_well_pk" ON "plate_well" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index z_plate_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_plate_pk" ON "z_plate" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_plate_set_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_plate_set_pk" ON "z_plate_set" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_plate_well_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_plate_well_pk" ON "z_plate_well" ("logId") 
  ;
--------------------------------------------------------
--  Constraints for Table assembly_op_input
--------------------------------------------------------

  ALTER TABLE "assembly_op_input" ADD CONSTRAINT "assembly_op_input_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table assembly_op_output
--------------------------------------------------------

  ALTER TABLE "assembly_op_output" ADD CONSTRAINT "assembly_op_output_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table assembly_operation
--------------------------------------------------------

  ALTER TABLE "assembly_operation" ADD CONSTRAINT "assembly_operation_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table assembly_run
--------------------------------------------------------

  ALTER TABLE "assembly_run" ADD CONSTRAINT "assembly_run_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table plate
--------------------------------------------------------

  ALTER TABLE "plate" ADD CONSTRAINT "plate_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table plate_set
--------------------------------------------------------

  ALTER TABLE "plate_set" ADD CONSTRAINT "plate_set_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table plate_well
--------------------------------------------------------

  ALTER TABLE "plate_well" ADD CONSTRAINT "plate_well_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_assembly_op_input
--------------------------------------------------------

  ALTER TABLE "z_assembly_op_input" ADD CONSTRAINT "z_assembly_op_input_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_assembly_op_output
--------------------------------------------------------

  ALTER TABLE "z_assembly_op_output" ADD CONSTRAINT "z_assembly_op_output_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_assembly_operation
--------------------------------------------------------

  ALTER TABLE "z_assembly_operation" ADD CONSTRAINT "z_assembly_operation_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_assembly_run
--------------------------------------------------------

  ALTER TABLE "z_assembly_run" ADD CONSTRAINT "z_assembly_run_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_plate
--------------------------------------------------------

  ALTER TABLE "z_plate" ADD CONSTRAINT "z_plate_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_plate_set
--------------------------------------------------------

  ALTER TABLE "z_plate_set" ADD CONSTRAINT "z_plate_set_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_plate_well
--------------------------------------------------------

  ALTER TABLE "z_plate_well" ADD CONSTRAINT "z_plate_well_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table assembly_op_input
--------------------------------------------------------

  ALTER TABLE "assembly_op_input" ADD CONSTRAINT "assembly_op_i_assembly_op_o_fk" FOREIGN KEY ("assembly_op_output_id")
	  REFERENCES "assembly_op_output" ("id") ENABLE;
  ALTER TABLE "assembly_op_input" ADD CONSTRAINT "assembly_op_i_assembly_oper_fk" FOREIGN KEY ("assembly_operation_id")
	  REFERENCES "assembly_operation" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "assembly_op_input" ADD CONSTRAINT "assembly_op_input_plate_set_fk" FOREIGN KEY ("plate_set_id")
	  REFERENCES "plate_set" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table assembly_op_output
--------------------------------------------------------

  ALTER TABLE "assembly_op_output" ADD CONSTRAINT "assembly_op_o_assembly_oper_fk" FOREIGN KEY ("assembly_operation_id")
	  REFERENCES "assembly_operation" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table assembly_operation
--------------------------------------------------------

  ALTER TABLE "assembly_operation" ADD CONSTRAINT "assembly_oper_assembly_run_fk" FOREIGN KEY ("assembly_run_id")
	  REFERENCES "assembly_run" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table assembly_run
--------------------------------------------------------

  ALTER TABLE "assembly_run" ADD CONSTRAINT "assembly_run_j5run_fk" FOREIGN KEY ("j5run_id")
	  REFERENCES "j5run" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table plate
--------------------------------------------------------

  ALTER TABLE "plate" ADD CONSTRAINT "plate_plate_set_fk" FOREIGN KEY ("plate_set_id")
	  REFERENCES "plate_set" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "plate" ADD CONSTRAINT "plate_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table plate_set
--------------------------------------------------------

  ALTER TABLE "plate_set" ADD CONSTRAINT "plate_set_assembly_oper_fk" FOREIGN KEY ("assembly_operation_id")
	  REFERENCES "assembly_operation" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "plate_set" ADD CONSTRAINT "plate_set_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table plate_well
--------------------------------------------------------

  ALTER TABLE "plate_well" ADD CONSTRAINT "plate_well_plate_fk" FOREIGN KEY ("plate_id")
	  REFERENCES "plate" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "plate_well" ADD CONSTRAINT "plate_well_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
