alter table "j5run" add ("preset_id" number);

alter table "z_j5run" add ("preset_id" number);

ALTER TABLE "j5run" ADD CONSTRAINT "j5run_preset_fk" FOREIGN KEY ("preset_id")
	  REFERENCES "preset" ("id") ENABLE;
