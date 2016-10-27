
CREATE SEQUENCE  "sz_next_level_part_tag"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 52 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "sz_next_level_part"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 127 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "s_next_level_part_tag"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 52 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "s_next_level_part"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 119 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

----- Tables ------
CREATE TABLE "next_level_part_tag" 
   (
	"id" NUMBER DEFAULT "s_next_level_part_tag"."NEXTVAL" NOT NULL ENABLE ,
	"tag_id" NUMBER ,
	"next_level_part_id" NUMBER ,
	"dateCreated" DATE ,
	"dateModified" DATE
)   ;
CREATE TABLE "z_next_level_part_tag" 
   (
	"id" NUMBER ,
	"tag_id" NUMBER ,
	"next_level_part_id" NUMBER ,
	"dateCreated" DATE ,
	"dateModified" DATE ,
	"logId" NUMBER DEFAULT "sz_next_level_part_tag"."NEXTVAL" NOT NULL ENABLE ,
	"logSessionId" VARCHAR2(50 BYTE) ,
	"logAction" VARCHAR2(400 BYTE) ,
	"dateLogged" TIMESTAMP (6)
)   ;
CREATE TABLE "z_next_level_part" 
   (
	"id" NUMBER NOT NULL ENABLE ,
	"namePrefix" VARCHAR2(64 BYTE) ,
	"devicedesign_id" NUMBER ,
	"startBinIndex" NUMBER ,
	"stopBinIndex" NUMBER ,
	"dateModified" DATE ,
	"dateCreated" DATE ,
	"logId" NUMBER DEFAULT "sz_next_level_part"."NEXTVAL" NOT NULL ENABLE ,
	"logSessionId" VARCHAR2(50 BYTE) ,
	"logAction" VARCHAR2(400 BYTE) ,
	"dateLogged" TIMESTAMP (6) ,
	"revComp" NUMBER ,
	"createFeature" NUMBER
)   ;
CREATE TABLE "next_level_part" 
   (
	"id" NUMBER DEFAULT "s_next_level_part"."NEXTVAL" NOT NULL ENABLE ,
	"namePrefix" VARCHAR2(64 BYTE) ,
	"devicedesign_id" NUMBER ,
	"startBinIndex" NUMBER ,
	"stopBinIndex" NUMBER ,
	"dateModified" DATE ,
	"dateCreated" DATE ,
	"revComp" NUMBER ,
	"createFeature" NUMBER
)   ;

CREATE UNIQUE INDEX "z_next_level_part_pk" ON "z_next_level_part" ("logId") 
    ;
CREATE UNIQUE INDEX "z_next_level_part_tag_pk" ON "z_next_level_part_tag" ("logId") 
    ;
CREATE UNIQUE INDEX "next_level_part_pk" ON "next_level_part" ("id") 
    ;
CREATE UNIQUE INDEX "next_level_part_tag_pk" ON "next_level_part_tag" ("id") 
    ;
    
    ----- Table Constraints ------
ALTER TABLE "next_level_part" ADD CONSTRAINT "next_level_part_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
ALTER TABLE "z_next_level_part" ADD CONSTRAINT "z_next_level_part_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
ALTER TABLE "z_next_level_part_tag" ADD CONSTRAINT "z_next_level_part_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
ALTER TABLE "next_level_part_tag" ADD CONSTRAINT "next_level_part_tag_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;

----- Table Ref Constraints ------
ALTER TABLE "next_level_part_tag" ADD CONSTRAINT "next_level_part_tag_tag_fk" FOREIGN KEY ("tag_id")
	  REFERENCES "tag" ("id") ON DELETE CASCADE ENABLE;
ALTER TABLE "next_level_part" ADD CONSTRAINT "next_level_pa_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
ALTER TABLE "next_level_part_tag" ADD CONSTRAINT "next_level_pa_next_level_pa_fk" FOREIGN KEY ("next_level_part_id")
	  REFERENCES "next_level_part" ("id") ON DELETE CASCADE ENABLE;
    
  
