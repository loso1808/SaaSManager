--------------------------------------------------------
--  DDL for Sequence s_filesystem
--------------------------------------------------------

   CREATE SEQUENCE  "s_filesystem"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_filesystem
--------------------------------------------------------

   CREATE SEQUENCE  "sz_filesystem"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;



--------------------------------------------------------
--  DDL for Table filesystem
--------------------------------------------------------

  CREATE TABLE "filesystem" 
   (	"id" NUMBER DEFAULT ON NULL "s_filesystem"."NEXTVAL", 
	"user_id" NUMBER, 
	"type" VARCHAR2(256 BYTE), 
	"objectId" NUMBER, 
	"parentId" NUMBER, 
	"displayName" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   );
--------------------------------------------------------
--  DDL for Index filesystem_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "filesystem_pk" ON "filesystem" ("id");
--------------------------------------------------------
--  Constraints for Table filesystem
--------------------------------------------------------

  ALTER TABLE "filesystem" ADD CONSTRAINT "filesystem_pk" PRIMARY KEY ("id") ENABLE;

--------------------------------------------------------
--  DDL for Table z_filesystem
--------------------------------------------------------

  CREATE TABLE "z_filesystem" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_filesystem"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"type" VARCHAR2(256 BYTE), 
	"objectId" NUMBER, 
	"parentId" NUMBER, 
	"displayName" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE
   );
--------------------------------------------------------
--  DDL for Index z_filesystem_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_filesystem_pk" ON "z_filesystem" ("logId") ;
--------------------------------------------------------
--  Constraints for Table z_filesystem
--------------------------------------------------------

  ALTER TABLE "z_filesystem" ADD CONSTRAINT "z_filesystem_pk" PRIMARY KEY ("logId") ENABLE;
