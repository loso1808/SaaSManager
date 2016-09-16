
CREATE SEQUENCE  "sz_part_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table part_tag
--------------------------------------------------------

  CREATE TABLE "PEONY_OWNER"."z_part_tag" 
   (	"logId" NUMBER DEFAULT ON NULL "PEONY_OWNER"."sz_part_tag"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE, 
  "id" NUMBER, 
	"part_id" NUMBER, 
	"tag_id" NUMBER, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index part_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "PEONY_OWNER"."z_part_tag_pk" ON "PEONY_OWNER"."z_part_tag" ("logId") ;
--------------------------------------------------------
--  Constraints for Table part_tag
--------------------------------------------------------

  ALTER TABLE "PEONY_OWNER"."z_part_tag" ADD CONSTRAINT "z_part_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;

