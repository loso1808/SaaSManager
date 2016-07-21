ALTER TABLE "group_user" DROP CONSTRAINT "group_user_group_fk";
ALTER TABLE "group_user" ADD CONSTRAINT "group_user_group_fk" 
  FOREIGN KEY ("group_id")
  REFERENCES "group" ("id") 
  ON DELETE CASCADE;