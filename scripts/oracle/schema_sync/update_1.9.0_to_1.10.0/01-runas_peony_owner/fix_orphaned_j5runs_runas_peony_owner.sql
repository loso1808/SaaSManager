delete "j5run"
where "devicedesign_id" not in (select "id" from "devicedesign");

commit;

ALTER TABLE "j5run" ADD CONSTRAINT "j5run_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
    