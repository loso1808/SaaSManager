
SELECT 
  count(distinct "user_id")
FROM
  "z_activity_log"
WHERE
  "user_id" NOT IN (SELECT "id" FROM "user");
  
DELETE
  "z_activity_log"
WHERE
  "user_id" NOT IN (SELECT "id" FROM "user");
  
COMMIT;
  
SELECT 
  count(distinct "user_id")
FROM
  "z_activity_log"
WHERE
  "user_id" NOT IN (SELECT "id" FROM "user");
  
ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_fk_user_id" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;