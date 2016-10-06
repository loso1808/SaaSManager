  ALTER TABLE "j5run" ADD CONSTRAINT "j5run_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
    
 ALTER TABLE "custom_field" ADD CONSTRAINT "custom_field_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;