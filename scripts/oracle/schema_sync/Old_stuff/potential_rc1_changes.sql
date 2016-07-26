ALTER TABLE "attached_design_rule"
DROP CONSTRAINT devicedesign_fk;

ALTER TABLE "attached_design_rule"
ADD CONSTRAINT "design_rule_devicedesign_fk"
  FOREIGN KEY ("devicedesign_id")
  REFERENCES "devicedesign"("id")
  ON DELETE CASCADE;
  
ALTER TABLE "eugene_rule"
DROP CONSTRAINT eugene_rule_devicedesign_fk;

ALTER TABLE "eugene_rule"
ADD CONSTRAINT "eugene_rule_devicedesign_fk"
  FOREIGN KEY ("devicedesign_id")
  REFERENCES "devicedesign"("id")
  ON DELETE CASCADE;
  
  
CREATE SEQUENCE  "PEONY_OWNER"."lock_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

create or replace TRIGGER "lock_trg" 
BEFORE INSERT ON "lock" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."id" IS NULL THEN
      SELECT "lock_seq".NEXTVAL INTO :NEW."id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



CREATE SEQUENCE  "PEONY_OWNER"."company_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


create or rEplaCE TRIGGER "company_trg" 
   before insert on "company" 
   for each row 
begin  
   if inserting then 
      if :NEW."id" is null then 
         select "company_seq".nextval into :NEW."id" from dual; 
      end if; 
   end if; 
end;


Alter table "preset" MODIFY "j5parameters" varchar2(4000);
 
CREATE SEQUENCE  "PEONY_OWNER"."preset_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;


create or replace TRIGGER "preset_trg" 
BEFORE INSERT ON "preset" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."id" IS NULL THEN
      SELECT "preset_seq".NEXTVAL INTO :NEW."id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;