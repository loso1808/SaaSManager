ALTER TABLE "tag_access" DROP CONSTRAINT "tag_access_tag_fk";

ALTER TABLE "tag_access" ADD CONSTRAINT "tag_access_tag_fk" FOREIGN KEY ("tag_id")
	  REFERENCES "tag" ("id") ON DELETE CASCADE ENABLE;
    
