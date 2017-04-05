--------------------------------------------------------
--  DDL for Sequence s_filesystem
--------------------------------------------------------

   CREATE SEQUENCE  "s_dd_project"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

   CREATE SEQUENCE  "sz_dd_project"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table dd_project
--------------------------------------------------------

  CREATE TABLE "dd_project" 
   (	"id" NUMBER DEFAULT ON NULL "s_dd_project"."NEXTVAL", 
	"devicedesign_id" NUMBER, 
	"filesystemProject_id" NUMBER, 
	"filesystemDesign_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Index dd_project_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "dd_project_pk" ON "dd_project" ("id");
  
--------------------------------------------------------
--  Constraints for Table dd_project
--------------------------------------------------------

  ALTER TABLE "dd_project" ADD CONSTRAINT "dd_project_pk" PRIMARY KEY ("id") ENABLE;



--------------------------------------------------------
--  DDL for Table z_dd_project
--------------------------------------------------------

  CREATE TABLE "z_dd_project" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_dd_project"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"filesystemProject_id" NUMBER, 
	"filesystemDesign_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE
   ) ;
--------------------------------------------------------
--  DDL for Index z_dd_project_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_dd_project_pk" ON "z_dd_project" ("logId")  ;
--------------------------------------------------------
--  Constraints for Table z_dd_project
--------------------------------------------------------

  ALTER TABLE "z_dd_project" ADD CONSTRAINT "z_dd_project_pk" PRIMARY KEY ("logId") ENABLE;
