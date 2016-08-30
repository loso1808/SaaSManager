--------------------------------------------------------
--  DDL for Sequence s_tag_access
--------------------------------------------------------

   CREATE SEQUENCE  "s_tag_access"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table tag_access
--------------------------------------------------------

  CREATE TABLE "tag_access" 
   (	"id" NUMBER DEFAULT ON NULL "s_tag_access"."NEXTVAL", 
	"dateModified" DATE, 
	"group_id" NUMBER, 
	"tag_id" NUMBER, 
	"dateCreated" DATE, 
	"user_id" NUMBER, 
	"global" NUMBER(1,0)
   );
--------------------------------------------------------
--  DDL for Index tag_access_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "tag_access_pk" ON "tag_access" ("id") ;
--------------------------------------------------------
--  Constraints for Table tag_access
--------------------------------------------------------

  ALTER TABLE "tag_access" ADD CONSTRAINT "tag_access_pk" PRIMARY KEY ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table tag_access
--------------------------------------------------------

  ALTER TABLE "tag_access" ADD CONSTRAINT "tag_access_group_fk" FOREIGN KEY ("group_id")
	  REFERENCES "group" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "tag_access" ADD CONSTRAINT "tag_access_tag_fk" FOREIGN KEY ("tag_id")
	  REFERENCES "tag" ("id") ENABLE;
  ALTER TABLE "tag_access" ADD CONSTRAINT "tag_access_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;
