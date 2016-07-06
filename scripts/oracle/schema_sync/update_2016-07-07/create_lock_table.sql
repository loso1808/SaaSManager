--------------------------------------------------------
--  DDL for Sequence s_lock
--------------------------------------------------------

   CREATE SEQUENCE  "s_lock"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


--------------------------------------------------------
--  DDL for Table lock
--------------------------------------------------------

  CREATE TABLE "lock" 
   (	"id" NUMBER DEFAULT ON NULL "s_lock"."NEXTVAL", 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(20 BYTE), 
	"locked_by" NUMBER, 
	"dateModified" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"lockExpires" NUMBER
   );

--------------------------------------------------------
--  DDL for Index lock_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "lock_pk" ON "lock" ("id");
  
--------------------------------------------------------
--  Constraints for Table lock
--------------------------------------------------------

  ALTER TABLE "lock" ADD CONSTRAINT "lock_pk" PRIMARY KEY ("id") ENABLE;
  --ALTER TABLE "lock" MODIFY ("id" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Ref Constraints for Table lock
--------------------------------------------------------

  ALTER TABLE "lock" ADD CONSTRAINT "lock_locked_by_fk" FOREIGN KEY ("locked_by")
	  REFERENCES "user" ("id") ENABLE;
