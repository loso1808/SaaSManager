ALTER TABLE "dd_project" ADD CONSTRAINT "dd_project_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
    
ALTER TABLE "dd_project" ADD CONSTRAINT "dd_project_filesystemDesign_fk" FOREIGN KEY ("filesystemDesign_id")
	  REFERENCES "filesystem" ("id") ON DELETE CASCADE ENABLE;
    
ALTER TABLE "dd_project" ADD CONSTRAINT "dd_project_filesystemPro_fk" FOREIGN KEY ("filesystemProject_id")
	  REFERENCES "filesystem" ("id") ON DELETE CASCADE ENABLE;