alter table "user" drop column "company_id";
alter table "z_j5run" drop column "clobTest";
alter table "z_protein_feature" drop column "prot_feat_type_id";
alter table "z_user" drop column "company_id";
alter table "access_control" modify ("dateCreated" timestamp);
alter table "z_access_control" modify ("dateCreated" timestamp);
alter table "z_preset" modify ("j5parameters" varchar2(4000));



  ALTER TABLE "preset" ADD CONSTRAINT "preset_pk" PRIMARY KEY ("id") ENABLE;  
  ALTER TABLE "seq_blacklist" ADD CONSTRAINT "seq_blacklist_pk" PRIMARY KEY ("id") ENABLE;
  ALTER TABLE "lock" ADD CONSTRAINT "lock_pk" PRIMARY KEY ("id") ENABLE;
  
  
  ALTER TABLE "access_control" ADD CONSTRAINT "access_control_dependsOn_fk" FOREIGN KEY ("dependsOn")
	  REFERENCES "access_control" ("acId") ENABLE;
  ALTER TABLE "access_control" ADD CONSTRAINT "access_control_group_fk" FOREIGN KEY ("groupId")
	  REFERENCES "group" ("id") ON DELETE CASCADE ENABLE;
    

  ALTER TABLE "lock" ADD CONSTRAINT "lock_locked_by_fk" FOREIGN KEY ("locked_by")
	  REFERENCES "user" ("id") ENABLE;