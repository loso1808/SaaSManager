                                     

CREATE SEQUENCE "PEONY_OWNER"."sz_tag_access" INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

CREATE TABLE "PEONY_OWNER"."z_tag_access"
( 
 "logId" NUMBER DEFAULT ON NULL "PEONY_OWNER"."sz_tag_access".NEXTVAL,
 CONSTRAINT "z_tag_access_pk" PRIMARY KEY ("logId"),
 "logSessionId" VARCHAR2(50 BYTE),
 "logAction" VARCHAR2(400 BYTE),
 "dateLogged" TIMESTAMP (6) DEFAULT SYSDATE NOT NULL,
	"id" NUMBER, 
	"dateModified" DATE, 
	"group_id" NUMBER, 
	"tag_id" NUMBER, 
	"dateCreated" DATE, 
	"user_id" NUMBER
);