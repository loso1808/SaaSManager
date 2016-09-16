
CREATE SEQUENCE  "s_part_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER  NOCYCLE  NOPARTITION ;

ALTER TABLE "part_tag" MODIFY ("id" DEFAULT ON NULL "s_part_tag".NEXTVAL);

ALTER TABLE "part_tag" RENAME CONSTRAINT "part_tag_PK" to "part_tag_pk";

ALTER INDEX "part_tag_PK" RENAME TO "part_tag_pk";



 
 ALTER TABLE "part_tag" DROP CONSTRAINT "part_tag_tag_fk";
 ALTER TABLE "part_tag" DROP CONSTRAINT "part_tag_part_fk";
 ALTER TABLE "part_tag" DROP CONSTRAINT "part_tag_user_fk";
 
 
  ALTER TABLE "PEONY_OWNER"."part_tag" ADD CONSTRAINT "part_tag_tag_fk" FOREIGN KEY ("tag_id")
	  REFERENCES "PEONY_OWNER"."tag" ("id") ON DELETE CASCADE ENABLE;
    
      ALTER TABLE "PEONY_OWNER"."part_tag" ADD CONSTRAINT "part_tag_part_fk" FOREIGN KEY ("part_id")
	  REFERENCES "PEONY_OWNER"."part" ("id") ON DELETE CASCADE ENABLE;
    
        
      ALTER TABLE "PEONY_OWNER"."part_tag" ADD CONSTRAINT "part_tag_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "PEONY_OWNER"."user" ("id") ON DELETE CASCADE ENABLE;