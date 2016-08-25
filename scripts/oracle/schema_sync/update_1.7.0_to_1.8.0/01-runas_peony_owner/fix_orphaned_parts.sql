
SELECT count(1) as broken_parts FROM "part" INNER JOIN "sequence" ON "part"."sequence_id"="sequence"."id" WHERE "part"."user_id" IS NULL OR "part"."user_id" = 0;

UPDATE
(SELECT "part"."user_id" as "user_id", "sequence"."user_id" as "new_user_id" FROM "part" INNER JOIN "sequence" ON "part"."sequence_id"="sequence"."id" WHERE "part"."user_id" IS NULL  OR "part"."user_id" = 0) "t"
SET "t"."user_id"="t"."new_user_id";