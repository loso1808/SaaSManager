
--------------------------------------------------------
--  DDL for Sequence s_j5run_construct
--------------------------------------------------------

   CREATE SEQUENCE  "s_j5run_construct"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_part_tag
--------------------------------------------------------

   CREATE SEQUENCE  "s_part_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_j5run_construct
--------------------------------------------------------

   CREATE SEQUENCE  "sz_j5run_construct"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_part_tag
--------------------------------------------------------

   CREATE SEQUENCE  "sz_part_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table j5run_construct
--------------------------------------------------------

  CREATE TABLE "j5run_construct" 
   (	"sequenceblob" CLOB, 
	"id" NUMBER DEFAULT ON NULL "s_j5run_construct"."NEXTVAL", 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"j5run_id" NUMBER, 
	"part_names_string" CLOB, 
	"sizeBP" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table part_tag
--------------------------------------------------------

  CREATE TABLE "part_tag" 
   (	"id" NUMBER DEFAULT ON NULL "s_part_tag"."NEXTVAL", 
	"part_id" NUMBER, 
	"tag_id" NUMBER, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table z_j5run_construct
--------------------------------------------------------

  CREATE TABLE "z_j5run_construct" 
   (	"sequenceblob" CLOB, 
	"id" NUMBER, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"j5run_id" NUMBER, 
	"part_names_string" CLOB, 
	"logId" NUMBER DEFAULT ON NULL "sz_j5run_construct"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"sizeBP" NUMBER, 
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE
   ) ;
--------------------------------------------------------
--  DDL for Table z_part_tag
--------------------------------------------------------

  CREATE TABLE "z_part_tag" 
   (	"logId" NUMBER DEFAULT ON NULL "sz_part_tag"."NEXTVAL", 
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
--  DDL for Index j5run_construct_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "j5run_construct_pk" ON "j5run_construct" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index part_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "part_tag_pk" ON "part_tag" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index z_j5run_construct_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_j5run_construct_pk" ON "z_j5run_construct" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_part_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_part_tag_pk" ON "z_part_tag" ("logId") 
  ;
--------------------------------------------------------
--  Constraints for Table j5run_construct
--------------------------------------------------------

  ALTER TABLE "j5run_construct" ADD CONSTRAINT "j5run_construct_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table part_tag
--------------------------------------------------------

  ALTER TABLE "part_tag" ADD CONSTRAINT "part_tag_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_j5run_construct
--------------------------------------------------------

  ALTER TABLE "z_j5run_construct" ADD CONSTRAINT "z_j5run_construct_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_part_tag
--------------------------------------------------------

  ALTER TABLE "z_part_tag" ADD CONSTRAINT "z_part_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table j5run_construct
--------------------------------------------------------

  ALTER TABLE "j5run_construct" ADD CONSTRAINT "j5run_construct_j5run_fk" FOREIGN KEY ("j5run_id")
	  REFERENCES "j5run" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table part_tag
--------------------------------------------------------

  ALTER TABLE "part_tag" ADD CONSTRAINT "part_tag_part_fk" FOREIGN KEY ("part_id")
	  REFERENCES "part" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "part_tag" ADD CONSTRAINT "part_tag_tag_fk" FOREIGN KEY ("tag_id")
	  REFERENCES "tag" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "part_tag" ADD CONSTRAINT "part_tag_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;
