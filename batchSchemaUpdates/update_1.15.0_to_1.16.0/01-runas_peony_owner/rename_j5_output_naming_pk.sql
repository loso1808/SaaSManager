  
  ALTER TABLE "z_j5_output_naming_template" DROP CONSTRAINT "z_j5_output_naming_templat_pk";
  DROP INDEX "z_j5_output_naming_templat_pk";
  
  CREATE UNIQUE INDEX "z_j5_output_naming_template_pk" ON "z_j5_output_naming_template" ("logId");
  ALTER TABLE "z_j5_output_naming_template" ADD CONSTRAINT "z_j5_output_naming_template_pk" PRIMARY KEY ("logId")
  USING INDEX;