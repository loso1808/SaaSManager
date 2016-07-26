
DEFINE LOG_TABLESPACE_NAME = 'PNY_DEV_1_4_3_LOG';

--------------------------------------------------------
--  File created - Tuesday-July-05-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence sz_design_ruleset
--------------------------------------------------------

   CREATE SEQUENCE  "sz_design_ruleset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_DE_bin_cell_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_DE_bin_cell_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1602 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_DE_bin_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_DE_bin_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1056 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_DE_bin_tag_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_DE_bin_tag_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_access_control_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_access_control_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 69963 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_activity_log_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_activity_log_seq"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 50 START WITH 27250001 CACHE 50 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_attached_tag_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_attached_tag_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_custom_field_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "z_custom_field_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_custom_field_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "z_custom_field_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_custom_field_value_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "z_custom_field_value_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_custom_fields_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_custom_fields_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 35 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_custom_j5parameters_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_custom_j5parameters_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_dd_part_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_dd_part_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 303 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_devicedesign_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_devicedesign_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 347 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_eugene_rule_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_eugene_rule_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 110 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_feature_type_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_feature_type_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_group_data_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_group_data_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_group_project_data_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_group_project_data_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_group_project_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_group_project_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_group_project_user_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_group_project_user_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_group_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_group_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 99 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_group_user_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_group_user_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 99 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_j5run_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_j5run_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 48 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_master_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_master_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_part_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_part_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 940 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_preset_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_preset_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_project_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_project_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 76 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_protein_segment_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_protein_segment_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_protein_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_protein_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 146 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_protocol_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_protocol_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 159 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_role_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_role_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_segment_rel_type_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_segment_rel_type_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_segment_relationship_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_segment_relationship_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_seq_blacklist_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_seq_blacklist_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 19 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_seq_feature_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_seq_feature_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 58509 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_sequence_segment_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_sequence_segment_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_sequence_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_sequence_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7306 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_strain_plasmid_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_strain_plasmid_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 60 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_strain_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_strain_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 218 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_tag_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_tag_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_user_role_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_user_role_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 94 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_user_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_user_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 399 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence z_winston_seq
--------------------------------------------------------

   CREATE SEQUENCE  "z_winston_seq"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 881 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table z_DE_bin
--------------------------------------------------------

  CREATE TABLE "z_DE_bin" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_DE_bin_cell
--------------------------------------------------------

  CREATE TABLE "z_DE_bin_cell" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"index" NUMBER, 
	"fas" VARCHAR2(256 BYTE), 
	"de_bin_id" NUMBER, 
	"part_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_DE_bin_tag
--------------------------------------------------------

  CREATE TABLE "z_DE_bin_tag" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"id" NUMBER, 
	"DE_bin_id" NUMBER, 
	"tag_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"filterLogic" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_access_control
--------------------------------------------------------

  CREATE TABLE "z_access_control" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"acId" NUMBER, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"userId" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"creatorId" NUMBER, 
	"dependsOn" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_activity_log
--------------------------------------------------------

  CREATE TABLE "z_activity_log" 
   (	"id" NUMBER, 
	"objectName" VARCHAR2(400 BYTE), 
	"objectId" NUMBER, 
	"user_id" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"recordsFetched" NUMBER, 
	"rawQuery" CLOB
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_attached_tag
--------------------------------------------------------

  CREATE TABLE "z_attached_tag" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"id" NUMBER, 
	"tagged_data_id" NUMBER, 
	"tag_id" NUMBER, 
	"tagged_data_type" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"filterLogic" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_custom_field
--------------------------------------------------------

  CREATE TABLE "z_custom_field" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"name" VARCHAR2(400 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"required" NUMBER(*,0), 
	"dateCreated" DATE, 
	"dateModified" DATE, 
	"searchable" NUMBER, 
	"dataType" VARCHAR2(50 BYTE), 
	"defaultValueString" VARCHAR2(4000 BYTE), 
	"defaultValueNumber" NUMBER, 
	"defaultValueDate" VARCHAR2(20 BYTE), 
	"defaultValueFlag" NUMBER(38,0)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_custom_field_value
--------------------------------------------------------

  CREATE TABLE "z_custom_field_value" 
   (	"id" NUMBER, 
	"custom_field_id" NUMBER, 
	"dateModified" DATE, 
	"dateCreated" DATE, 
	"objectId" NUMBER, 
	"logId" NUMBER, 
	"logSessionId" NUMBER, 
	"logAction" VARCHAR2(20 BYTE), 
	"dateLogged" DATE, 
	"objectName" VARCHAR2(50 BYTE), 
	"valueString" VARCHAR2(4000 BYTE), 
	"valueNumber" NUMBER, 
	"valueDate" VARCHAR2(20 BYTE), 
	"valueFlag" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_custom_j5parameters
--------------------------------------------------------

  CREATE TABLE "z_custom_j5parameters" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_dd_part
--------------------------------------------------------

  CREATE TABLE "z_dd_part" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"devicedesign_id" NUMBER, 
	"part_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_design_rule
--------------------------------------------------------

  CREATE TABLE "z_design_rule" 
   (	"id" NUMBER, 
	"user_id" NUMBER, 
	"design_ruleset_id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"existence" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(256 BYTE), 
	"regex" VARCHAR2(256 BYTE), 
	"operator" VARCHAR2(256 BYTE), 
	"creatorName" VARCHAR2(256 BYTE), 
	"dateModified" DATE, 
	"dateCreated" DATE
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_design_ruleset
--------------------------------------------------------

  CREATE TABLE "z_design_ruleset" 
   (	"id" NUMBER DEFAULT ON NULL "sz_design_ruleset"."NEXTVAL", 
	"user_id" NUMBER, 
	"name" VARCHAR2(32 BYTE), 
	"description" VARCHAR2(256 BYTE), 
	"dateCreated" DATE, 
	"dateModified" DATE
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_devicedesign
--------------------------------------------------------

  CREATE TABLE "z_devicedesign" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"combinatorial" NUMBER, 
	"isCircular" NUMBER, 
	"user_id" NUMBER, 
	"project_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_eugene_rule
--------------------------------------------------------

  CREATE TABLE "z_eugene_rule" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_feature_type
--------------------------------------------------------

  CREATE TABLE "z_feature_type" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(2000 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"code" VARCHAR2(400 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group
--------------------------------------------------------

  CREATE TABLE "z_group" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group_data
--------------------------------------------------------

  CREATE TABLE "z_group_data" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"group_id" NUMBER, 
	"objectId" NUMBER, 
	"objectName" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group_project
--------------------------------------------------------

  CREATE TABLE "z_group_project" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group_project_data
--------------------------------------------------------

  CREATE TABLE "z_group_project_data" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"group_project_id" NUMBER, 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group_project_user
--------------------------------------------------------

  CREATE TABLE "z_group_project_user" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"group_project_id" NUMBER, 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_group_user
--------------------------------------------------------

  CREATE TABLE "z_group_user" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"group_id" NUMBER, 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_j5run
--------------------------------------------------------

  CREATE TABLE "z_j5run" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"clobTest" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"clientTimeDiff" VARCHAR2(256 BYTE), 
	"project_id" NUMBER, 
	"protocol_id" NUMBER, 
	"results" CLOB, 
	"j5output" CLOB
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_master
--------------------------------------------------------

  CREATE TABLE "z_master" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"masterDirectSynthesesList" CLOB, 
	"masterOligoList" CLOB, 
	"masterPlasmidList" CLOB, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_part
--------------------------------------------------------

  CREATE TABLE "z_part" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"preferred3PrimeOverhangs" VARCHAR2(256 BYTE), 
	"preferred5PrimeOverhangs" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_preset
--------------------------------------------------------

  CREATE TABLE "z_preset" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"presetName" VARCHAR2(256 BYTE), 
	"j5parameters" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_project
--------------------------------------------------------

  CREATE TABLE "z_project" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protein
--------------------------------------------------------

  CREATE TABLE "z_protein" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"shared_repo" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protein_feature
--------------------------------------------------------

  CREATE TABLE "z_protein_feature" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(128 BYTE), 
	"start" NUMBER, 
	"end" NUMBER, 
	"notes" VARCHAR2(4000 BYTE), 
	"prot_feat_type_id" NUMBER, 
	"protein_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protein_segment
--------------------------------------------------------

  CREATE TABLE "z_protein_segment" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"segment_relationship_id" NUMBER, 
	"startPosition" NUMBER, 
	"length" NUMBER, 
	"role" VARCHAR2(400 BYTE), 
	"protein_id" NUMBER, 
	"prot_feature_id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_protocol
--------------------------------------------------------

  CREATE TABLE "z_protocol" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"author" VARCHAR2(256 BYTE), 
	"htmlContent" CLOB, 
	"assemblyMethods" VARCHAR2(4000 BYTE), 
	"name" VARCHAR2(256 BYTE), 
	"version" NUMBER, 
	"contact" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_role
--------------------------------------------------------

  CREATE TABLE "z_role" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(2000 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_segment_rel_type
--------------------------------------------------------

  CREATE TABLE "z_segment_rel_type" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"code" VARCHAR2(400 BYTE), 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_segment_relationship
--------------------------------------------------------

  CREATE TABLE "z_segment_relationship" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"type" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_seq_blacklist
--------------------------------------------------------

  CREATE TABLE "z_seq_blacklist" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"user_id" NUMBER, 
	"sequence_id" NUMBER, 
	"id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_seq_feature
--------------------------------------------------------

  CREATE TABLE "z_seq_feature" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_sequence
--------------------------------------------------------

  CREATE TABLE "z_sequence" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"shared_repo" VARCHAR2(400 BYTE), 
	"type" VARCHAR2(16 BYTE), 
	"molecule_type" VARCHAR2(400 BYTE)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_sequence_segment
--------------------------------------------------------

  CREATE TABLE "z_sequence_segment" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"segment_relationship_id" NUMBER, 
	"sequence_id" NUMBER, 
	"role" VARCHAR2(400 BYTE), 
	"seq_feature_id" NUMBER, 
	"startPosition" NUMBER, 
	"length" NUMBER, 
	"strand" NUMBER, 
	"overhang5prime" NUMBER, 
	"overhang3prime" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_strain
--------------------------------------------------------

  CREATE TABLE "z_strain" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_strain_plasmid
--------------------------------------------------------

  CREATE TABLE "z_strain_plasmid" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"strain_id" NUMBER, 
	"sequence_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_tag
--------------------------------------------------------

  CREATE TABLE "z_tag" 
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
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
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
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
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
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
   (	"logId" NUMBER, 
	"logSessionId" VARCHAR2(50 BYTE), 
	"id" NUMBER, 
	"user_id" NUMBER, 
	"role_id" NUMBER, 
	"logAction" VARCHAR2(400 BYTE), 
	"dateLogged" TIMESTAMP (6), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) TABLESPACE &&LOG_TABLESPACE_NAME;
--------------------------------------------------------
--  DDL for Table z_winston
--------------------------------------------------------

  CREATE TABLE "z_winston" 
   (	"id" NUMBER, 
	"user_id" NUMBER, 
	"requestId" VARCHAR2(100 BYTE), 
	"level" VARCHAR2(400 BYTE), 
	"message" CLOB, 
	"metadata" CLOB, 
	"dateLogged" TIMESTAMP (6), 
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
--  DDL for Index z_DE_bin_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_DE_bin_tag_pk" ON "z_DE_bin_tag" ("logId") 
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
--  DDL for Index z_custom_field_value_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_field_value_PK" ON "z_custom_field_value" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_custom_fields_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_custom_fields_pk" ON "z_custom_field" ("logId") 
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
--  DDL for Index z_design_rule_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_design_rule_PK" ON "z_design_ruleset" ("id") 
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
--  DDL for Index z_feature_type_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_feature_type_pk" ON "z_feature_type" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_data_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_data_pk" ON "z_group_data" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_pk" ON "z_group" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_project_data_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_project_data_pk" ON "z_group_project_data" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_project_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_project_pk" ON "z_group_project" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_group_project_user_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_group_project_user_pk" ON "z_group_project_user" ("logId") 
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
--  DDL for Index z_protein_segment_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_protein_segment_pk" ON "z_protein_segment" ("logId") 
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
--  DDL for Index z_segment_rel_type_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_segment_rel_type_pk" ON "z_segment_rel_type" ("logId") 
  ;
--------------------------------------------------------
--  DDL for Index z_segment_relationship_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_segment_relationship_pk" ON "z_segment_relationship" ("logId") 
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
--  DDL for Index z_sequence_segment_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "z_sequence_segment_pk" ON "z_sequence_segment" ("logId") 
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
--------------------------------------------------------
--  Constraints for Table z_DE_bin_cell
--------------------------------------------------------

  ALTER TABLE "z_DE_bin_cell" ADD CONSTRAINT "z_DE_bin_cell_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_DE_bin_tag
--------------------------------------------------------

  ALTER TABLE "z_DE_bin_tag" ADD CONSTRAINT "z_DE_bin_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_access_control
--------------------------------------------------------

  ALTER TABLE "z_access_control" ADD CONSTRAINT "z_access_control_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_activity_log
--------------------------------------------------------

  ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_attached_tag
--------------------------------------------------------

  ALTER TABLE "z_attached_tag" ADD CONSTRAINT "z_attached_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_custom_field
--------------------------------------------------------

  ALTER TABLE "z_custom_field" ADD CONSTRAINT "z_custom_fields_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_custom_field_value
--------------------------------------------------------

  ALTER TABLE "z_custom_field_value" MODIFY ("logId" NOT NULL ENABLE);
  ALTER TABLE "z_custom_field_value" ADD CONSTRAINT "z_custom_field_value_PK" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_custom_j5parameters
--------------------------------------------------------

  ALTER TABLE "z_custom_j5parameters" ADD CONSTRAINT "z_custom_j5parameters_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_dd_part
--------------------------------------------------------

  ALTER TABLE "z_dd_part" ADD CONSTRAINT "z_dd_part_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_design_ruleset
--------------------------------------------------------

  ALTER TABLE "z_design_ruleset" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "z_design_ruleset" ADD CONSTRAINT "z_design_rule_PK" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_devicedesign
--------------------------------------------------------

  ALTER TABLE "z_devicedesign" ADD CONSTRAINT "z_devicedesign_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_eugene_rule
--------------------------------------------------------

  ALTER TABLE "z_eugene_rule" ADD CONSTRAINT "z_eugene_rule_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_feature_type
--------------------------------------------------------

  ALTER TABLE "z_feature_type" ADD CONSTRAINT "z_feature_type_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_group
--------------------------------------------------------

  ALTER TABLE "z_group" ADD CONSTRAINT "z_group_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_group_data
--------------------------------------------------------

  ALTER TABLE "z_group_data" ADD CONSTRAINT "z_group_data_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_group_project
--------------------------------------------------------

  ALTER TABLE "z_group_project" ADD CONSTRAINT "z_group_project_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_group_project_data
--------------------------------------------------------

  ALTER TABLE "z_group_project_data" ADD CONSTRAINT "z_group_project_data_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_group_project_user
--------------------------------------------------------

  ALTER TABLE "z_group_project_user" ADD CONSTRAINT "z_group_project_user_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_group_user
--------------------------------------------------------

  ALTER TABLE "z_group_user" ADD CONSTRAINT "z_group_user_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_j5run
--------------------------------------------------------

  ALTER TABLE "z_j5run" ADD CONSTRAINT "z_j5run_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_master
--------------------------------------------------------

  ALTER TABLE "z_master" ADD CONSTRAINT "z_master_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_part
--------------------------------------------------------

  ALTER TABLE "z_part" ADD CONSTRAINT "z_part_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_preset
--------------------------------------------------------

  ALTER TABLE "z_preset" ADD CONSTRAINT "z_preset_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_project
--------------------------------------------------------

  ALTER TABLE "z_project" ADD CONSTRAINT "z_project_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_protein
--------------------------------------------------------

  ALTER TABLE "z_protein" ADD CONSTRAINT "z_protein_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_protein_feature
--------------------------------------------------------

  ALTER TABLE "z_protein_feature" ADD CONSTRAINT "z_protein_feature_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
  ALTER TABLE "z_protein_feature" MODIFY ("logId" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table z_protein_segment
--------------------------------------------------------

  ALTER TABLE "z_protein_segment" ADD CONSTRAINT "z_protein_segment_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_protocol
--------------------------------------------------------

  ALTER TABLE "z_protocol" ADD CONSTRAINT "z_protocol_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_role
--------------------------------------------------------

  ALTER TABLE "z_role" ADD CONSTRAINT "z_role_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_segment_rel_type
--------------------------------------------------------

  ALTER TABLE "z_segment_rel_type" ADD CONSTRAINT "z_segment_rel_type_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_segment_relationship
--------------------------------------------------------

  ALTER TABLE "z_segment_relationship" ADD CONSTRAINT "z_segment_relationship_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_seq_blacklist
--------------------------------------------------------

  ALTER TABLE "z_seq_blacklist" ADD CONSTRAINT "z_seq_blacklist_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_seq_feature
--------------------------------------------------------

  ALTER TABLE "z_seq_feature" ADD CONSTRAINT "z_seq_feature_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_sequence
--------------------------------------------------------

  ALTER TABLE "z_sequence" ADD CONSTRAINT "z_sequence_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_sequence_segment
--------------------------------------------------------

  ALTER TABLE "z_sequence_segment" ADD CONSTRAINT "z_sequence_segment_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_strain
--------------------------------------------------------

  ALTER TABLE "z_strain" ADD CONSTRAINT "z_strain_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_strain_plasmid
--------------------------------------------------------

  ALTER TABLE "z_strain_plasmid" ADD CONSTRAINT "z_strain_plasmid_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_tag
--------------------------------------------------------

  ALTER TABLE "z_tag" ADD CONSTRAINT "z_tag_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_user
--------------------------------------------------------

  ALTER TABLE "z_user" ADD CONSTRAINT "z_user_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_user_role
--------------------------------------------------------

  ALTER TABLE "z_user_role" ADD CONSTRAINT "z_user_role_pk" PRIMARY KEY ("logId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table z_winston
--------------------------------------------------------

  ALTER TABLE "z_winston" ADD CONSTRAINT "z_winston_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "z_winston" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table z_activity_log
--------------------------------------------------------

  ALTER TABLE "z_activity_log" ADD CONSTRAINT "z_activity_log_fk_user_id" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_DE_bin_cell_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_DE_bin_cell_trg" 
   before insert on "z_DE_bin_cell" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_DE_bin_cell_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_DE_bin_cell_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_DE_bin_tag_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_DE_bin_tag_trg" 
   before insert on "z_DE_bin_tag" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_DE_bin_tag_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_DE_bin_tag_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_DE_bin_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_DE_bin_trg" 
   before insert on "z_DE_bin" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_DE_bin_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_DE_bin_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_access_control_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_access_control_trg" 
   before insert on "z_access_control" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_access_control_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_access_control_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_activity_log_trg_pk
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_activity_log_trg_pk" 
   before insert on "z_activity_log"
   for each row 
begin  
   if inserting then 
      if :NEW."id" is null then 
         select "z_activity_log_seq".nextval into :NEW."id" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_activity_log_trg_pk" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_attached_tag_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_attached_tag_trg" 
   before insert on "z_attached_tag" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_attached_tag_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_attached_tag_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_custom_field_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_custom_field_TRG" 
BEFORE INSERT ON "z_custom_field" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "z_custom_field_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_custom_field_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_custom_field_TRG1" 
BEFORE INSERT ON "z_custom_field" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "z_custom_field_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_custom_field_value_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_custom_field_value_TRG" 
BEFORE INSERT ON "z_custom_field_value" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "z_custom_field_value_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_custom_fields_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_custom_fields_trg" 
   before insert on "z_custom_field" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_custom_fields_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_custom_fields_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_custom_j5parameters_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_custom_j5parameters_trg" 
   before insert on "z_custom_j5parameters" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_custom_j5parameters_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_custom_j5parameters_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_dd_part_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_dd_part_trg" 
   before insert on "z_dd_part" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_dd_part_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_dd_part_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_devicedesign_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_devicedesign_trg" 
   before insert on "z_devicedesign" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_devicedesign_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_devicedesign_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_eugene_rule_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_eugene_rule_trg" 
   before insert on "z_eugene_rule" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_eugene_rule_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_eugene_rule_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_feature_type_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_feature_type_trg" 
   before insert on "z_feature_type" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_feature_type_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_feature_type_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_group_data_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_group_data_trg" 
   before insert on "z_group_data" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_group_data_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_group_data_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_group_project_data_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_group_project_data_trg" 
   before insert on "z_group_project_data" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_group_project_data_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_group_project_data_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_group_project_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_group_project_trg" 
   before insert on "z_group_project" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_group_project_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_group_project_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_group_project_user_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_group_project_user_trg" 
   before insert on "z_group_project_user" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_group_project_user_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_group_project_user_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_group_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_group_trg" 
   before insert on "z_group" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_group_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_group_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_group_user_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_group_user_trg" 
   before insert on "z_group_user" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_group_user_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_group_user_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_j5run_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_j5run_trg" 
   before insert on "z_j5run" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_j5run_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_j5run_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_master_logId_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_master_logId_trg" 
BEFORE INSERT ON "z_master" 
FOR EACH ROW

BEGIN
  SELECT "z_master_seq".NEXTVAL
  INTO   :new."logId"
  FROM   dual;
END;
/
ALTER TRIGGER "z_master_logId_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_part_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_part_trg" 
   before insert on "z_part" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_part_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_part_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_preset_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_preset_trg" 
   before insert on "z_preset" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_preset_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_preset_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_project_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_project_trg" 
   before insert on "z_project" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_project_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_project_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_protein_segment_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_protein_segment_trg" 
   before insert on "z_protein_segment" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_protein_segment_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_protein_segment_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_protein_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_protein_trg" 
   before insert on "z_protein" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_protein_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_protein_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_protocol_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_protocol_trg" 
   before insert on "z_protocol" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_protocol_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_protocol_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_role_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_role_trg" 
   before insert on "z_role" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_role_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_role_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_segment_rel_type_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_segment_rel_type_trg" 
   before insert on "z_segment_rel_type" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_segment_rel_type_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_segment_rel_type_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_segment_relationship_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_segment_relationship_trg" 
   before insert on "z_segment_relationship" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_segment_relationship_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_segment_relationship_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_seq_blacklist_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_seq_blacklist_trg" 
   before insert on "z_seq_blacklist" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_seq_blacklist_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_seq_blacklist_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_seq_feature_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_seq_feature_trg" 
   before insert on "z_seq_feature" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_seq_feature_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_seq_feature_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_sequence_segment_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_sequence_segment_trg" 
   before insert on "z_sequence_segment" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_sequence_segment_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_sequence_segment_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_sequence_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_sequence_trg" 
   before insert on "z_sequence" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_sequence_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_sequence_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_strain_plasmid_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_strain_plasmid_trg" 
   before insert on "z_strain_plasmid" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_strain_plasmid_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_strain_plasmid_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_strain_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_strain_trg" 
   before insert on "z_strain" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_strain_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_strain_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_tag_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_tag_trg" 
   before insert on "z_tag" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_tag_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_tag_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_user_role_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_user_role_trg" 
   before insert on "z_user_role" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_user_role_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_user_role_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_user_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_user_trg" 
   before insert on "z_user" 
   for each row 
begin  
   if inserting then 
      if :NEW."logId" is null then 
         select "z_user_seq".nextval into :NEW."logId" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_user_trg" ENABLE;
--------------------------------------------------------
--  DDL for Trigger z_winston_trg
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "z_winston_trg" 
   before insert on "z_winston" 
   for each row 
begin  
   if inserting then 
      if :NEW."id" is null then 
         select "z_winston_seq".nextval into :NEW."id" from dual; 
      end if; 
      if :NEW."dateLogged" is null then 
         select CURRENT_TIMESTAMP into :NEW."dateLogged" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "z_winston_trg" ENABLE;
--------------------------------------------------------
--  DDL for Function CONCAT_CLOB_BUFFER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CONCAT_CLOB_BUFFER" 
(
  BUFFER_ID IN VARCHAR2 
) RETURN CLOB
IS
  accumulator CLOB;
  counter NUMBER := 0;
BEGIN
  FOR x IN 
    (SELECT "chunk" 
     FROM "clob_buffer"
     WHERE "bufferId" = BUFFER_ID
     ORDER BY "chunkIndex")
  LOOP
    accumulator := accumulator || x."chunk";  
  END LOOP;
  
  RETURN accumulator;
END CONCAT_CLOB_BUFFER;

/
