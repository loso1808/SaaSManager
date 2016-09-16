alter table "plate" modify ("id" default on null "s_plate".nextval);

alter table "plate_set" modify ("id" default on null "s_plate_set".nextval);

alter table "plate_well" modify ("id" default on null "s_plate_well".nextval);

ALTER TABLE "plate_set" DROP CONSTRAINT "plate_set_assembly_oper_fk";

ALTER TABLE "plate_set" DROP CONSTRAINT "plate_set_user_fk";

ALTER TABLE "plate" DROP CONSTRAINT "plate_plate_set_fk";

  ALTER TABLE "plate_set" ADD CONSTRAINT "plate_set_assembly_oper_fk" FOREIGN KEY ("assembly_operation_id")
	  REFERENCES "assembly_operation" ("id") ON DELETE CASCADE ENABLE;
 
   ALTER TABLE "plate" ADD CONSTRAINT "plate_plate_set_fk" FOREIGN KEY ("plate_set_id")
	  REFERENCES "plate_set" ("id") ON DELETE CASCADE ENABLE;
    
       ALTER TABLE "plate_well" ADD CONSTRAINT "plate_well_plate_fk" FOREIGN KEY ("plate_id")
	  REFERENCES "plate" ("id") ON DELETE CASCADE ENABLE;
    
    
  ALTER TABLE "plate_set" ADD CONSTRAINT "plate_set_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
    
      ALTER TABLE "plate" ADD CONSTRAINT "plate_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
    
      ALTER TABLE "plate_well" ADD CONSTRAINT "plate_well_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;