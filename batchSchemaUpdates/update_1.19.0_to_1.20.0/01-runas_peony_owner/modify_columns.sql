

ALTER TABLE "user" RENAME COLUMN "labType" to "institutionType";
ALTER TABLE "user" ADD ("institutionName" VARCHAR2(256 BYTE));
ALTER TABLE "user" ADD ("department" VARCHAR2(256 BYTE));


ALTER TABLE "z_user" RENAME COLUMN "labType" to "institutionType";
ALTER TABLE "z_user" ADD ("institutionName" VARCHAR2(256 BYTE));
ALTER TABLE "z_user" ADD ("department" VARCHAR2(256 BYTE));

commit;

ALTER TABLE "j5run" RENAME COLUMN "labType" to "institutionType";
ALTER TABLE "j5run" ADD ("res_dig_group" VARCHAR2(256 BYTE));
ALTER TABLE "j5run" ADD ("pid" NUMBER);


ALTER TABLE "z_j5run" RENAME COLUMN "labType" to "institutionType";
ALTER TABLE "z_j5run" ADD ("res_dig_group" VARCHAR2(256 BYTE));
ALTER TABLE "z_j5run" ADD ("pid" NUMBER);

commit;


----- Create dd_j5run ------

-- sequences --
CREATE SEQUENCE  "sz_dd_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "s_dd_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;

-- Create table --
CREATE TABLE "dd_j5run" 
(
"id" NUMBER DEFAULT ON NULL "s_dd_j5run"."NEXTVAL" NOT NULL ENABLE ,
"devicedesign_id" NUMBER ,
"j5run_id" NUMBER ,
"dateCreated" TIMESTAMP (6) ,
"dateModified" TIMESTAMP (6)
)   ;

-- Index --
CREATE UNIQUE INDEX "dd_j5run_pk" ON "dd_j5run" ("id") 


----- Table Constraints ------
ALTER TABLE "dd_j5run" ADD CONSTRAINT "dd_j5run_pk" PRIMARY KEY ("id") USING INDEX  ENABLE;
ALTER TABLE "dd_j5run" ADD CONSTRAINT "dd_j5run_devicedesign_fk" FOREIGN KEY ("devicedesign_id") REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
ALTER TABLE "dd_j5run" ADD CONSTRAINT "dd_j5run_j5run_fk" FOREIGN KEY ("j5run_id") REFERENCES "j5run" ("id") ON DELETE CASCADE ENABLE;


commit;


----- Create z_dd_j5run ------

-- Create table --
CREATE TABLE "z_dd_j5run" 
   (
	"logId" NUMBER DEFAULT ON NULL "sz_dd_j5run"."NEXTVAL" NOT NULL ENABLE ,
	"logSessionId" VARCHAR2(50 BYTE) ,
	"id" NUMBER ,
	"devicedesign_id" NUMBER ,
	"j5run_id" NUMBER ,
	"dateCreated" TIMESTAMP (6) ,
	"dateModified" TIMESTAMP (6) ,
	"logAction" VARCHAR2(400 BYTE) ,
	"dateLogged" TIMESTAMP (6) DEFAULT ON NULL SYSDATE NOT NULL ENABLE
)   ;

-- Index --
CREATE UNIQUE INDEX "z_dd_j5run_pk" ON "z_dd_j5run" ("logId") ;


----- Table Constraints ------
ALTER TABLE "z_dd_j5run" ADD CONSTRAINT "z_dd_j5run_pk" PRIMARY KEY ("logId") USING INDEX  ENABLE;

commit;