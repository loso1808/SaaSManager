--------------------------------------------------------
--  DDL for Sequence sz_tag_access
--------------------------------------------------------

   CREATE SEQUENCE  "sz_tag_access"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table z_tag_access
--------------------------------------------------------

  CREATE TABLE "z_tag_access" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_tag_access"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"dateModified" DATE, 
	"group_id" NUMBER, 
	"tag_id" NUMBER, 
	"dateCreated" DATE, 
	"user_id" NUMBER, 
	"global" NUMBER(1,0)
   );
--------------------------------------------------------
--  DDL for Index z_tag_access_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_tag_access_pk" ON "z_tag_access" ("logId");
--------------------------------------------------------
--  Constraints for Table z_tag_access
--------------------------------------------------------

  ALTER TABLE "z_tag_access" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_tag_access" ADD CONSTRAINT "z_tag_access_pk" PRIMARY KEY ("logId") ENABLE;
