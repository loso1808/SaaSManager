ALTER TABLE "z_activity_log" DROP CONSTRAINT "z_activity_log_fk_user_id";

ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_fk_user_id" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;