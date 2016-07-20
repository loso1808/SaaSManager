
--------------------------------------------------------
--  DDL for Table z_activity_log
--------------------------------------------------------

  CREATE TABLE "z_activity_log" 
   (	"id" NUMBER, 
	"objectName" VARCHAR2(400 BYTE), 
	"objectId" NUMBER, 
	"user_id" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"recordsFetched" NUMBER, 
	"rawQuery" CLOB
   ) TABLESPACE &LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Index z_activity_log_pk
--------------------------------------------------------

CREATE UNIQUE INDEX "z_activity_log_pk" ON "z_activity_log" ("id") ;
--------------------------------------------------------
--  Constraints for Table z_activity_log
--------------------------------------------------------

ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_pk" PRIMARY KEY ("id");
--------------------------------------------------------
--  Ref Constraints for Table z_activity_log
--------------------------------------------------------

ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_fk_user_id" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
    
--------------------------------------------------------
--  DDL for Sequence z_activity_log_seq
--------------------------------------------------------

CREATE SEQUENCE  "z_activity_log_seq"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Trigger z_activity_log_trg_pk
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE TRIGGER "z_activity_log_trg_pk" 
   before insert on "z_activity_log"
   for each row 
begin  
   if inserting then 
      if :NEW."id" is null then 
         select "z_activity_log_seq".nextval into :NEW."id" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_activity_log_trg_pk" ENABLE;

--------------------------------------------------------
--  DDL for Table z_winston
--------------------------------------------------------

  CREATE TABLE "z_winston" 
   (	"id" NUMBER, 
	"user_id" NUMBER, 
	"requestId" VARCHAR2(100 BYTE), 
	"level" VARCHAR2(400 BYTE), 
	"message" CLOB, 
	"metadata" CLOB, 
	"dateLogged" TIMESTAMP (6), 
	"channel" VARCHAR2(400 BYTE)
   ) TABLESPACE &LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Index z_winston_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_winston_PK" ON "z_winston" ("id") ;
--------------------------------------------------------
--  Constraints for Table z_winston
--------------------------------------------------------

  ALTER TABLE "z_winston" ADD CONSTRAINT "z_winston_PK" PRIMARY KEY ("id");
  
  --------------------------------------------------------
--  DDL for Sequence z_winston_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_winston_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

--------------------------------------------------------
--  DDL for Trigger z_winston_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_winston_trg" 
   before insert on "z_winston" 
   for each row 
begin  
   if inserting then 
      if :NEW."id" is null then 
         select "z_winston_seq".nextval into :NEW."id" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_winston_trg" ENABLE;



