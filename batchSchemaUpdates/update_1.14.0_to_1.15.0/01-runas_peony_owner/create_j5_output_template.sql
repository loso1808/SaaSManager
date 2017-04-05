--------------------------------------------------------
--  DDL for Sequence s_j5_output_naming_template
--------------------------------------------------------

   CREATE SEQUENCE  "s_j5_output_naming_template"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Sequence sz_j5_output_naming_template
--------------------------------------------------------

   CREATE SEQUENCE  "sz_j5_output_naming_template"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
   
--------------------------------------------------------
--  DDL for Table j5_output_naming_template
--------------------------------------------------------

  CREATE TABLE "j5_output_naming_template" 
   (	"id" NUMBER DEFAULT ON NULL "s_j5_output_naming_template"."NEXTVAL", 
	"devicedesign_id" NUMBER, 
	"outputTarget" VARCHAR2(512 BYTE), 
	"template" VARCHAR2(4000 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index j5_output_naming_template_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "j5_output_naming_template_pk" ON "j5_output_naming_template" ("id");
--------------------------------------------------------
--  Constraints for Table j5_output_naming_template
--------------------------------------------------------

  ALTER TABLE "j5_output_naming_template" ADD CONSTRAINT "j5_output_naming_template_pk" PRIMARY KEY ("id") ENABLE;

--------------------------------------------------------
--  DDL for Table z_j5_output_naming_template
--------------------------------------------------------

  CREATE TABLE "z_j5_output_naming_template" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_j5_output_naming_template"."NEXTVAL", 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"template" VARCHAR2(4000 BYTE), 
	"outputTarget" VARCHAR2(512 BYTE), 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE)
   );
--------------------------------------------------------
--  DDL for Index z_j5_output_naming_templat_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_j5_output_naming_templat_pk" ON "z_j5_output_naming_template" ("logId");
--------------------------------------------------------
--  Constraints for Table z_j5_output_naming_template
--------------------------------------------------------

  ALTER TABLE "z_j5_output_naming_template" ADD CONSTRAINT "z_j5_output_naming_templat_pk" PRIMARY KEY ("logId") ENABLE;