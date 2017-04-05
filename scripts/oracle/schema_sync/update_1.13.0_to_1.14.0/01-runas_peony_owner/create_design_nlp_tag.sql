--------------------------------------------------------
--  DDL for Sequence s_filesystem
--------------------------------------------------------

   CREATE SEQUENCE  "s_design_nlp_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

   CREATE SEQUENCE  "sz_design_nlp_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Table design_nlp_tag
--------------------------------------------------------

  CREATE TABLE "design_nlp_tag" 
   (	"id" NUMBER DEFAULT ON NULL "s_design_nlp_tag"."NEXTVAL", 
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"tag_id" NUMBER, 
	"devicedesign_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index design_nlp_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "design_nlp_tag_pk" ON "design_nlp_tag" ("id") ;
--------------------------------------------------------
--  Constraints for Table design_nlp_tag
--------------------------------------------------------

  ALTER TABLE "design_nlp_tag" ADD CONSTRAINT "design_nlp_tag_pk" PRIMARY KEY ("id") ENABLE;
  ALTER TABLE "design_nlp_tag" MODIFY ("devicedesign_id" NOT NULL ENABLE);
  ALTER TABLE "design_nlp_tag" MODIFY ("tag_id" NOT NULL ENABLE);


--------------------------------------------------------
--  DDL for Table z_design_nlp_tag
--------------------------------------------------------

  CREATE TABLE "z_design_nlp_tag" 
   (	"id" NUMBER DEFAULT NULL, 
	"tag_id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logId" NUMBER DEFAULT ON NULL "sz_design_nlp_tag"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"logAction" VARCHAR2(400 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Index z_design_nlp_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_design_nlp_tag_pk" ON "z_design_nlp_tag" ("logId");
  
--------------------------------------------------------
--  Constraints for Table z_design_nlp_tag
--------------------------------------------------------

  ALTER TABLE "z_design_nlp_tag" ADD CONSTRAINT "z_design_nlp_tag_pk" PRIMARY KEY ("logId") ENABLE;
