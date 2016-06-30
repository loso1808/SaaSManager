
DEFINE LOG_TABLESPACE_NAME = 'PNY_ARZEDA_LOG';

--http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.CommonDBATasks.html#Appendix.Oracle.CommonDBATasks.SettingDefaultTablespace
--alter database default tablespace PNY_PROD_LOG; --for local tablespaces
--exec rdsadmin.rdsadmin_util.alter_default_tablespace('PNY_PROD_LOG');
--ALTER SESSION SET CURRENT_SCHEMA = PNY_PROD_DBO;


--------------------------------------------------------
--  File created - Wednesday-June-29-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence sz_DE_bin
--------------------------------------------------------

   CREATE SEQUENCE  "sz_DE_bin"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1096 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_DE_bin_cell
--------------------------------------------------------

   CREATE SEQUENCE  "sz_DE_bin_cell"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1844 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_access_control
--------------------------------------------------------

   CREATE SEQUENCE  "sz_access_control"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 29061 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_activity_log
--------------------------------------------------------

   CREATE SEQUENCE  "sz_activity_log"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 183795 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_attached_tag
--------------------------------------------------------

   CREATE SEQUENCE  "sz_attached_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 65 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_custom_fields
--------------------------------------------------------

   CREATE SEQUENCE  "sz_custom_fields"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_custom_j5parameters
--------------------------------------------------------

   CREATE SEQUENCE  "sz_custom_j5parameters"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_dd_part
--------------------------------------------------------

   CREATE SEQUENCE  "sz_dd_part"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 674 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_devicedesign
--------------------------------------------------------

   CREATE SEQUENCE  "sz_devicedesign"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 315 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_eugene_rule
--------------------------------------------------------

   CREATE SEQUENCE  "sz_eugene_rule"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_group
--------------------------------------------------------

   CREATE SEQUENCE  "sz_group"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 27 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_group_user
--------------------------------------------------------

   CREATE SEQUENCE  "sz_group_user"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 39 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_j5run
--------------------------------------------------------

   CREATE SEQUENCE  "sz_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 156 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_master
--------------------------------------------------------

   CREATE SEQUENCE  "sz_master"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 76 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_part
--------------------------------------------------------

   CREATE SEQUENCE  "sz_part"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1029 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_preset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_preset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_project
--------------------------------------------------------

   CREATE SEQUENCE  "sz_project"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 67 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_protein
--------------------------------------------------------

   CREATE SEQUENCE  "sz_protein"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_protein_feature
--------------------------------------------------------

   CREATE SEQUENCE  "sz_protein_feature"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_protocol
--------------------------------------------------------

   CREATE SEQUENCE  "sz_protocol"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 111 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_role
--------------------------------------------------------

   CREATE SEQUENCE  "sz_role"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_seq_blacklist
--------------------------------------------------------

   CREATE SEQUENCE  "sz_seq_blacklist"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_seq_feature
--------------------------------------------------------

   CREATE SEQUENCE  "sz_seq_feature"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15691 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_sequence
--------------------------------------------------------

   CREATE SEQUENCE  "sz_sequence"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 515 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_strain
--------------------------------------------------------

   CREATE SEQUENCE  "sz_strain"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 122 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_strain_plasmid
--------------------------------------------------------

   CREATE SEQUENCE  "sz_strain_plasmid"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_tag
--------------------------------------------------------

   CREATE SEQUENCE  "sz_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_user
--------------------------------------------------------

   CREATE SEQUENCE  "sz_user"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 238 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_user_role
--------------------------------------------------------

   CREATE SEQUENCE  "sz_user_role"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 92 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence sz_winston
--------------------------------------------------------

   CREATE SEQUENCE  "sz_winston"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table z_DE_bin
--------------------------------------------------------

  CREATE TABLE "z_DE_bin" 
   (	"logId" NUMBER DEFAULT "sz_DE_bin"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"directionForward" NUMBER, 
	"dsf" NUMBER, 
	"fro" NUMBER, 
	"extra5PrimeBps" VARCHAR2(256 BYTE), 
	"extra3PrimeBps" VARCHAR2(256 BYTE), 
	"binName" VARCHAR2(256 BYTE), 
	"iconID" VARCHAR2(256 BYTE), 
	"devicedesign_id" NUMBER, 
	"DEIndex" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_DE_bin_cell
--------------------------------------------------------

  CREATE TABLE "z_DE_bin_cell" 
   (	"logId" NUMBER DEFAULT "sz_DE_bin_cell"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"index" NUMBER, 
	"fas" VARCHAR2(256 BYTE), 
	"de_bin_id" NUMBER, 
	"part_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_access_control
--------------------------------------------------------

  CREATE TABLE "z_access_control" 
   (	"logId" NUMBER DEFAULT "sz_access_control"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"acId" NUMBER, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"userId" NUMBER, 
	"groupId" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"creatorId" NUMBER, 
	"dependsOn" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_activity_log
--------------------------------------------------------

  CREATE TABLE "z_activity_log" 
   (	"id" NUMBER DEFAULT "sz_activity_log"."NEXTVAL", 
	"objectName" VARCHAR2(400 BYTE), 
	"objectId" NUMBER, 
	"user_id" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"recordsFetched" NUMBER, 
	"rawQuery" CLOB
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_attached_tag
--------------------------------------------------------

  CREATE TABLE "z_attached_tag" 
   (	"logId" NUMBER DEFAULT "sz_attached_tag"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"tagged_data_id" NUMBER, 
	"tag_id" NUMBER, 
	"tagged_data_type" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"filterLogic" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_custom_fields
--------------------------------------------------------

  CREATE TABLE "z_custom_fields" 
   (	"logId" NUMBER DEFAULT "sz_custom_fields"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"fieldName" VARCHAR2(400 BYTE), 
	"fieldValue" VARCHAR2(4000 BYTE), 
	"fieldDataType" VARCHAR2(50 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_custom_j5parameters
--------------------------------------------------------

  CREATE TABLE "z_custom_j5parameters" 
   (	"logId" NUMBER DEFAULT "sz_custom_j5parameters"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"suppress_primer_annotations" NUMBER, 
	"suppress_pure_primers" NUMBER, 
	"hmlgy_max_fraction_mismatches" NUMBER, 
	"hmlgy_min_length_bps" NUMBER, 
	"output_seq_format" VARCHAR2(256 BYTE), 
	"mispriming_oligo_conc" NUMBER, 
	"mispriming_salt_conc" NUMBER, 
	"mispriming_min_tm" NUMBER, 
	"mispriming_3pbp_to_warn_if_hit" NUMBER, 
	"primer_dna_conc" NUMBER, 
	"primer_salt_corrections" NUMBER, 
	"primer_tm_santalucia" NUMBER, 
	"primer_pair_max_compl_end_th" NUMBER, 
	"primer_pair_max_compl_any_th" NUMBER, 
	"primer_max_self_end_th" NUMBER, 
	"primer_max_self_any_th" NUMBER, 
	"primer_max_diff_tm" NUMBER, 
	"primer_max_tm" NUMBER, 
	"primer_min_tm" NUMBER, 
	"primer_max_size" NUMBER, 
	"primer_min_size" NUMBER, 
	"primer_gc_clamp" NUMBER, 
	"dir_synth_min_cost_per_piece" NUMBER, 
	"dir_synth_cost_per_bp" NUMBER, 
	"min_pcr_product_bps" NUMBER, 
	"oligo_max_len_no_page_pur_bps" NUMBER, 
	"oligo_page_pur_cost_per_piece" NUMBER, 
	"oligo_synthesis_cost_per_bp" NUMBER, 
	"max_ids_ggate_overhangs_cmptbl" NUMBER, 
	"ggate_termini_extra_seq" VARCHAR2(256 BYTE), 
	"ggate_recognition_seq" VARCHAR2(256 BYTE), 
	"ggate_overhang_bps" NUMBER, 
	"min_fragment_size_gibson_bps" NUMBER, 
	"max_oligo_length_bps" NUMBER, 
	"gibson_overlap_max_tm" NUMBER, 
	"gibson_overlap_min_tm" NUMBER, 
	"gibson_overlap_bps" NUMBER, 
	"master_plasmid_num_of_digits" NUMBER, 
	"master_oligo_num_of_digits" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_dd_part
--------------------------------------------------------

  CREATE TABLE "z_dd_part" 
   (	"logId" NUMBER DEFAULT "sz_dd_part"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"part_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_devicedesign
--------------------------------------------------------

  CREATE TABLE "z_devicedesign" 
   (	"logId" NUMBER DEFAULT "sz_devicedesign"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"combinatorial" NUMBER, 
	"isCircular" NUMBER, 
	"user_id" NUMBER, 
	"project_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_eugene_rule
--------------------------------------------------------

  CREATE TABLE "z_eugene_rule" 
   (	"logId" NUMBER DEFAULT "sz_eugene_rule"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"operand1_id" NUMBER, 
	"operand2_id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"originalRuleLine" VARCHAR2(256 BYTE), 
	"negationOperator" NUMBER, 
	"operand2IsNumber" NUMBER, 
	"operand2Number" NUMBER, 
	"compositionalOperator" VARCHAR2(256 BYTE), 
	"devicedesign_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group
--------------------------------------------------------

  CREATE TABLE "z_group" 
   (	"logId" NUMBER DEFAULT "sz_group"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group_user
--------------------------------------------------------

  CREATE TABLE "z_group_user" 
   (	"logId" NUMBER DEFAULT "sz_group_user"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"group_id" NUMBER, 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_j5run
--------------------------------------------------------

  CREATE TABLE "z_j5run" 
   (	"logId" NUMBER DEFAULT "sz_j5run"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"assemblyMethod" VARCHAR2(256 BYTE), 
	"assemblyType" VARCHAR2(256 BYTE), 
	"date" DATE, 
	"devicedesign_name" VARCHAR2(256 BYTE), 
	"endDate" DATE, 
	"name" VARCHAR2(256 BYTE), 
	"status" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"protocol_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"results" CLOB, 
	"j5output" CLOB, 
	"project_id" NUMBER, 
	"clientTimeDiff" VARCHAR2(256 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_master
--------------------------------------------------------

  CREATE TABLE "z_master" 
   (	"logId" NUMBER DEFAULT "sz_master"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"user_id" NUMBER, 
	"masterDirectSynthesesList" CLOB, 
	"masterOligoList" CLOB, 
	"masterPlasmidList" CLOB, 
	"id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_part
--------------------------------------------------------

  CREATE TABLE "z_part" 
   (	"logId" NUMBER DEFAULT "sz_part"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"definitionHash" VARCHAR2(64 BYTE), 
	"FQDN" VARCHAR2(512 BYTE), 
	"genbankStartBP" NUMBER, 
	"endBP" NUMBER, 
	"revComp" NUMBER, 
	"directionForward" NUMBER, 
	"features" VARCHAR2(1028 BYTE), 
	"iconID" VARCHAR2(256 BYTE), 
	"size" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"sequence_id" NUMBER, 
	"partSource" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"preferred3PrimeOverhangs" VARCHAR2(256 BYTE), 
	"preferred5PrimeOverhangs" VARCHAR2(256 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_preset
--------------------------------------------------------

  CREATE TABLE "z_preset" 
   (	"logId" NUMBER DEFAULT "sz_preset"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"presetName" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"j5parameters" VARCHAR2(4000 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_project
--------------------------------------------------------

  CREATE TABLE "z_project" 
   (	"logId" NUMBER DEFAULT "sz_project"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protein
--------------------------------------------------------

  CREATE TABLE "z_protein" 
   (	"logId" NUMBER DEFAULT "sz_protein"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"FQDN" VARCHAR2(512 BYTE), 
	"hash" VARCHAR2(256 BYTE), 
	"circular" NUMBER, 
	"description" VARCHAR2(512 BYTE), 
	"size" NUMBER, 
	"user_id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"sequence" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"shared_repo" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protein_feature
--------------------------------------------------------

  CREATE TABLE "z_protein_feature" 
   (	"logId" NUMBER DEFAULT "sz_protein_feature"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(128 BYTE), 
	"start" NUMBER, 
	"end" NUMBER, 
	"notes" VARCHAR2(4000 BYTE), 
	"protein_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"prot_feature_type_id" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protocol
--------------------------------------------------------

  CREATE TABLE "z_protocol" 
   (	"logId" NUMBER DEFAULT "sz_protocol"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"author" VARCHAR2(256 BYTE), 
	"htmlContent" CLOB, 
	"assemblyMethods" VARCHAR2(4000 BYTE), 
	"name" VARCHAR2(256 BYTE), 
	"version" NUMBER, 
	"contact" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_role
--------------------------------------------------------

  CREATE TABLE "z_role" 
   (	"logId" NUMBER DEFAULT "sz_role"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(2000 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_seq_blacklist
--------------------------------------------------------

  CREATE TABLE "z_seq_blacklist" 
   (	"logId" NUMBER DEFAULT "sz_seq_blacklist"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"user_id" NUMBER, 
	"sequence_id" NUMBER, 
	"id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_seq_feature
--------------------------------------------------------

  CREATE TABLE "z_seq_feature" 
   (	"logId" NUMBER DEFAULT "sz_seq_feature"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(128 BYTE), 
	"start" NUMBER, 
	"end" NUMBER, 
	"sequence_id" NUMBER, 
	"strand" NUMBER, 
	"notes" VARCHAR2(4000 BYTE), 
	"protein_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_sequence
--------------------------------------------------------

  CREATE TABLE "z_sequence" 
   (	"logId" NUMBER DEFAULT "sz_sequence"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"FQDN" VARCHAR2(512 BYTE), 
	"hash" VARCHAR2(256 BYTE), 
	"circular" NUMBER, 
	"description" VARCHAR2(512 BYTE), 
	"size" NUMBER, 
	"user_id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"sequence" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"shared_repo" VARCHAR2(400 BYTE), 
	"type" VARCHAR2(16 BYTE), 
	"molecule_type" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_strain
--------------------------------------------------------

  CREATE TABLE "z_strain" 
   (	"logId" NUMBER DEFAULT "sz_strain"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"FQDN" VARCHAR2(512 BYTE), 
	"selectionMarkers" VARCHAR2(1024 BYTE), 
	"principalInvestigator" VARCHAR2(512 BYTE), 
	"intellectualProperty" VARCHAR2(1024 BYTE), 
	"references" VARCHAR2(1024 BYTE), 
	"summary" VARCHAR2(4000 BYTE), 
	"keywords" VARCHAR2(512 BYTE), 
	"genotype" VARCHAR2(512 BYTE), 
	"links" VARCHAR2(512 BYTE), 
	"parentStrain" VARCHAR2(512 BYTE), 
	"bioSafetyLevel" VARCHAR2(512 BYTE), 
	"status" VARCHAR2(64 BYTE), 
	"fundingSource" VARCHAR2(512 BYTE), 
	"creatorEmail" VARCHAR2(256 BYTE), 
	"creator" VARCHAR2(256 BYTE), 
	"alias" VARCHAR2(256 BYTE), 
	"name" VARCHAR2(512 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_strain_plasmid
--------------------------------------------------------

  CREATE TABLE "z_strain_plasmid" 
   (	"logId" NUMBER DEFAULT "sz_strain_plasmid"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"strain_id" NUMBER, 
	"sequence_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_tag
--------------------------------------------------------

  CREATE TABLE "z_tag" 
   (	"logId" NUMBER DEFAULT "sz_tag"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"name" VARCHAR2(400 BYTE), 
	"color" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"id" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_user
--------------------------------------------------------

  CREATE TABLE "z_user" 
   (	"logId" NUMBER DEFAULT "sz_user"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"username" VARCHAR2(256 BYTE), 
	"password" VARCHAR2(256 BYTE), 
	"firstName" VARCHAR2(256 BYTE), 
	"lastName" VARCHAR2(256 BYTE), 
	"email" VARCHAR2(256 BYTE), 
	"activationCode" VARCHAR2(256 BYTE), 
	"groupName" VARCHAR2(256 BYTE), 
	"groupType" VARCHAR2(256 BYTE), 
	"lastAccess" DATE, 
	"debugAccess" NUMBER, 
	"verifiedEmail" NUMBER, 
	"activated" NUMBER, 
	"token" VARCHAR2(256 BYTE), 
	"middleName" VARCHAR2(256 BYTE), 
	"activeFlag" VARCHAR2(1 BYTE), 
	"phoneNumber" VARCHAR2(64 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"userAccount" VARCHAR2(256 BYTE), 
	"userRestrictionEnzymeGroups" CLOB, 
	"masterDirectSynthesesList" CLOB, 
	"masterOligoList" CLOB, 
	"masterPlasmidList" CLOB
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_user_role
--------------------------------------------------------

  CREATE TABLE "z_user_role" 
   (	"logId" NUMBER DEFAULT "sz_user_role"."NEXTVAL", 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"role_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_winston
--------------------------------------------------------

  CREATE TABLE "z_winston" 
   (	"id" NUMBER DEFAULT "sz_winston"."NEXTVAL", 
	"user_id" NUMBER, 
	"requestId" VARCHAR2(100 BYTE), 
	"level" VARCHAR2(400 BYTE), 
	"message" CLOB, 
	"metadata" CLOB, 
	"dateLogged" TIMESTAMP (6) DEFAULT SYSDATE, 
	"channel" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Index z_DE_bin_cell_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_DE_bin_cell_pk" ON "z_DE_bin_cell" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_DE_bin_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_DE_bin_pk" ON "z_DE_bin" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_access_control_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_access_control_pk" ON "z_access_control" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_activity_log_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_activity_log_pk" ON "z_activity_log" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index z_attached_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_attached_tag_pk" ON "z_attached_tag" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_custom_fields_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_fields_pk" ON "z_custom_fields" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_custom_j5parameters_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_j5parameters_pk" ON "z_custom_j5parameters" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_dd_part_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_dd_part_pk" ON "z_dd_part" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_devicedesign_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_devicedesign_pk" ON "z_devicedesign" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_eugene_rule_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_eugene_rule_pk" ON "z_eugene_rule" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_pk" ON "z_group" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_user_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_user_pk" ON "z_group_user" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_j5run_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_j5run_pk" ON "z_j5run" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_master_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_master_pk" ON "z_master" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_part_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_part_pk" ON "z_part" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_preset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_preset_pk" ON "z_preset" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_project_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_project_pk" ON "z_project" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_protein_feature_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_protein_feature_pk" ON "z_protein_feature" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_protein_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_protein_pk" ON "z_protein" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_protocol_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_protocol_pk" ON "z_protocol" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_role_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_role_pk" ON "z_role" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_seq_blacklist_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_seq_blacklist_pk" ON "z_seq_blacklist" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_seq_feature_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_seq_feature_pk" ON "z_seq_feature" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_sequence_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_sequence_pk" ON "z_sequence" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_strain_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_strain_pk" ON "z_strain" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_strain_plasmid_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_strain_plasmid_pk" ON "z_strain_plasmid" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_tag_pk" ON "z_tag" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_user_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_user_pk" ON "z_user" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_user_role_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_user_role_pk" ON "z_user_role" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_winston_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_winston_pk" ON "z_winston" ("id") 
  ;
--------------------------------------------------------
--  Constraints for Table z_DE_bin
--------------------------------------------------------

  ALTER TABLE "z_DE_bin" ADD CONSTRAINT "z_DE_bin_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_DE_bin" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_DE_bin" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_DE_bin_cell
--------------------------------------------------------

  ALTER TABLE "z_DE_bin_cell" ADD CONSTRAINT "z_DE_bin_cell_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_DE_bin_cell" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_DE_bin_cell" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_access_control
--------------------------------------------------------

  ALTER TABLE "z_access_control" ADD CONSTRAINT "z_access_control_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_access_control" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_access_control" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_activity_log
--------------------------------------------------------

  ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "z_activity_log" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_activity_log" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_attached_tag
--------------------------------------------------------

  ALTER TABLE "z_attached_tag" ADD CONSTRAINT "z_attached_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_attached_tag" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_attached_tag" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_custom_fields
--------------------------------------------------------

  ALTER TABLE "z_custom_fields" ADD CONSTRAINT "z_custom_fields_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_custom_fields" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_custom_fields" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_custom_j5parameters
--------------------------------------------------------

  ALTER TABLE "z_custom_j5parameters" ADD CONSTRAINT "z_custom_j5parameters_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_custom_j5parameters" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_custom_j5parameters" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_dd_part
--------------------------------------------------------

  ALTER TABLE "z_dd_part" ADD CONSTRAINT "z_dd_part_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_dd_part" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_dd_part" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_devicedesign
--------------------------------------------------------

  ALTER TABLE "z_devicedesign" ADD CONSTRAINT "z_devicedesign_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_devicedesign" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_devicedesign" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_eugene_rule
--------------------------------------------------------

  ALTER TABLE "z_eugene_rule" ADD CONSTRAINT "z_eugene_rule_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_eugene_rule" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_eugene_rule" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_group
--------------------------------------------------------

  ALTER TABLE "z_group" ADD CONSTRAINT "z_group_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_group" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_group" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_group_user
--------------------------------------------------------

  ALTER TABLE "z_group_user" ADD CONSTRAINT "z_group_user_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_group_user" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_group_user" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_j5run
--------------------------------------------------------

  ALTER TABLE "z_j5run" ADD CONSTRAINT "z_j5run_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_j5run" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_j5run" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_master
--------------------------------------------------------

  ALTER TABLE "z_master" ADD CONSTRAINT "z_master_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_master" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_master" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_part
--------------------------------------------------------

  ALTER TABLE "z_part" ADD CONSTRAINT "z_part_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_part" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_part" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_preset
--------------------------------------------------------

  ALTER TABLE "z_preset" ADD CONSTRAINT "z_preset_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_preset" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_preset" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_project
--------------------------------------------------------

  ALTER TABLE "z_project" ADD CONSTRAINT "z_project_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_project" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_project" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_protein
--------------------------------------------------------

  ALTER TABLE "z_protein" ADD CONSTRAINT "z_protein_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_protein" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_protein" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_protein_feature
--------------------------------------------------------

  ALTER TABLE "z_protein_feature" ADD CONSTRAINT "z_protein_feature_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_protein_feature" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_protein_feature" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_protocol
--------------------------------------------------------

  ALTER TABLE "z_protocol" ADD CONSTRAINT "z_protocol_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_protocol" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_protocol" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_role
--------------------------------------------------------

  ALTER TABLE "z_role" ADD CONSTRAINT "z_role_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_role" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_role" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_seq_blacklist
--------------------------------------------------------

  ALTER TABLE "z_seq_blacklist" ADD CONSTRAINT "z_seq_blacklist_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_seq_blacklist" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_seq_blacklist" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_seq_feature
--------------------------------------------------------

  ALTER TABLE "z_seq_feature" ADD CONSTRAINT "z_seq_feature_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_seq_feature" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_seq_feature" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_sequence
--------------------------------------------------------

  ALTER TABLE "z_sequence" ADD CONSTRAINT "z_sequence_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_sequence" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_sequence" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_strain
--------------------------------------------------------

  ALTER TABLE "z_strain" ADD CONSTRAINT "z_strain_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_strain" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_strain" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_strain_plasmid
--------------------------------------------------------

  ALTER TABLE "z_strain_plasmid" ADD CONSTRAINT "z_strain_plasmid_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_strain_plasmid" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_strain_plasmid" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_tag
--------------------------------------------------------

  ALTER TABLE "z_tag" ADD CONSTRAINT "z_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_tag" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_tag" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_user
--------------------------------------------------------

  ALTER TABLE "z_user" ADD CONSTRAINT "z_user_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_user" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_user" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_user_role
--------------------------------------------------------

  ALTER TABLE "z_user_role" ADD CONSTRAINT "z_user_role_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_user_role" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_user_role" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_winston
--------------------------------------------------------

  ALTER TABLE "z_winston" MODIFY ("dateLogged" NOT NULL ENABLE);
  ALTER TABLE "z_winston" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "z_winston" ADD CONSTRAINT "z_winston_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table z_activity_log
--------------------------------------------------------

  ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_fk_user_id" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;


--alter database default tablespace PNY_PROD_LOG; --for local tablespaces
--exec rdsadmin.rdsadmin_util.alter_default_tablespace('PNY_PROD_DATA');
