alter table "z_design_ruleset" drop constraint "z_design_ruleset_pk";

drop index "z_design_ruleset_pk";

alter table "z_design_ruleset" add ("newId" NUMBER);
update "z_design_ruleset" set "newId" = "id";
commit;
alter table "z_design_ruleset" modify ("id" default null);
alter table "z_design_ruleset" drop column "id" cascade constraints;
alter table "z_design_ruleset" rename column "newId" to "id";

alter table "z_design_ruleset" add ("logId" NUMBER DEFAULT ON NULL "sz_design_ruleset"."NEXTVAL", 
                                    "logSessionId" VARCHAR2(50 BYTE), 
                                    "logAction" VARCHAR2(400 BYTE), 
                                    "dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE);
                                    
CREATE UNIQUE INDEX "z_design_ruleset_pk" ON "z_design_ruleset" ("logId");

ALTER TABLE "z_design_ruleset" ADD CONSTRAINT "z_design_ruleset_pk" PRIMARY KEY ("logId")
  USING INDEX ENABLE;