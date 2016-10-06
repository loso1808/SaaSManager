    
  delete "plate_set" 
  where "assembly_operation_id" not in (select "id" from "assembly_operation");
  
  commit;
  
  ALTER TABLE "plate_set" ADD CONSTRAINT "plate_set_assembly_oper_fk" FOREIGN KEY ("assembly_operation_id")
	  REFERENCES "assembly_operation" ("id") ON DELETE CASCADE ENABLE;