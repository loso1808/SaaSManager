ALTER TABLE "user_role" DROP CONSTRAINT "user_role_role_fk" ;

ALTER TABLE "user_role" ADD CONSTRAINT "user_role_role_fk" FOREIGN KEY ("role_id")
	  REFERENCES "role" ("id") ON DELETE CASCADE ENABLE;

ALTER TABLE "user_role" DROP CONSTRAINT "user_role_user_fk";    

ALTER TABLE "user_role" ADD CONSTRAINT "user_role_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;