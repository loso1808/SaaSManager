DEFINE SCHEMA_OWNER_NAME = PNY_RC_1_4_1_DBO;

ALTER SESSION SET CURRENT_SCHEMA = &&SCHEMA_OWNER_NAME;

--------------------------------------------------------
--  File created - Wednesday-June-29-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence s_DE_bin
--------------------------------------------------------

   CREATE SEQUENCE  "s_DE_bin"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10673 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_DE_bin_cell
--------------------------------------------------------

   CREATE SEQUENCE  "s_DE_bin_cell"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 44783 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_access_control
--------------------------------------------------------

   CREATE SEQUENCE  "s_access_control"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 113682 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_attached_tag
--------------------------------------------------------

   CREATE SEQUENCE  "s_attached_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 441 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_clob_buffer
--------------------------------------------------------

   CREATE SEQUENCE  "s_clob_buffer"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 381 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_custom_fields
--------------------------------------------------------

   CREATE SEQUENCE  "s_custom_fields"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_custom_j5parameters
--------------------------------------------------------

   CREATE SEQUENCE  "s_custom_j5parameters"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_dd_part
--------------------------------------------------------

   CREATE SEQUENCE  "s_dd_part"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6377 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_devicedesign
--------------------------------------------------------

   CREATE SEQUENCE  "s_devicedesign"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 935 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_eugene_rule
--------------------------------------------------------

   CREATE SEQUENCE  "s_eugene_rule"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 268 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_group
--------------------------------------------------------

   CREATE SEQUENCE  "s_group"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 65 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_group_user
--------------------------------------------------------

   CREATE SEQUENCE  "s_group_user"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 99 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_j5run
--------------------------------------------------------

   CREATE SEQUENCE  "s_j5run"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1006 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_master
--------------------------------------------------------

   CREATE SEQUENCE  "s_master"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 793 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_part
--------------------------------------------------------

   CREATE SEQUENCE  "s_part"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7326 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_preset
--------------------------------------------------------

   CREATE SEQUENCE  "s_preset"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_project
--------------------------------------------------------

   CREATE SEQUENCE  "s_project"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 924 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_protein
--------------------------------------------------------

   CREATE SEQUENCE  "s_protein"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_protein_feature
--------------------------------------------------------

   CREATE SEQUENCE  "s_protein_feature"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_protocol
--------------------------------------------------------

   CREATE SEQUENCE  "s_protocol"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 844 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_role
--------------------------------------------------------

   CREATE SEQUENCE  "s_role"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_seq_blacklist
--------------------------------------------------------

   CREATE SEQUENCE  "s_seq_blacklist"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_seq_feature
--------------------------------------------------------

   CREATE SEQUENCE  "s_seq_feature"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 173361 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_sequence
--------------------------------------------------------

   CREATE SEQUENCE  "s_sequence"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 12422 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_strain
--------------------------------------------------------

   CREATE SEQUENCE  "s_strain"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 867 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_strain_plasmid
--------------------------------------------------------

   CREATE SEQUENCE  "s_strain_plasmid"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 356 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_tag
--------------------------------------------------------

   CREATE SEQUENCE  "s_tag"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 92 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_user
--------------------------------------------------------

   CREATE SEQUENCE  "s_user"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 704 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence s_user_role
--------------------------------------------------------

   CREATE SEQUENCE  "s_user_role"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 643 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table DE_bin
--------------------------------------------------------

  CREATE TABLE "DE_bin" 
   (	"id" NUMBER DEFAULT "s_DE_bin"."NEXTVAL", 
	"directionForward" NUMBER, 
	"dsf" NUMBER, 
	"fro" NUMBER, 
	"extra5PrimeBps" VARCHAR2(256 BYTE), 
	"extra3PrimeBps" VARCHAR2(256 BYTE), 
	"binName" VARCHAR2(256 BYTE), 
	"iconID" VARCHAR2(256 BYTE), 
	"devicedesign_id" NUMBER, 
	"DEIndex" NUMBER(*,0), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table DE_bin_cell
--------------------------------------------------------

  CREATE TABLE "DE_bin_cell" 
   (	"id" NUMBER DEFAULT "s_DE_bin_cell"."NEXTVAL", 
	"index" NUMBER, 
	"fas" VARCHAR2(256 BYTE), 
	"de_bin_id" NUMBER, 
	"part_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table access_control
--------------------------------------------------------

  CREATE TABLE "access_control" 
   (	"acId" NUMBER DEFAULT "s_access_control"."NEXTVAL", 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"userId" NUMBER, 
	"groupId" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"creatorId" NUMBER, 
	"dependsOn" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table attached_tag
--------------------------------------------------------

  CREATE TABLE "attached_tag" 
   (	"id" NUMBER DEFAULT "s_attached_tag"."NEXTVAL", 
	"tagged_data_id" NUMBER, 
	"tag_id" NUMBER, 
	"tagged_data_type" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"filterLogic" VARCHAR2(400 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table clob_buffer
--------------------------------------------------------

  CREATE TABLE "clob_buffer" 
   (	"id" NUMBER DEFAULT "s_clob_buffer"."NEXTVAL", 
	"chunk" VARCHAR2(4000 BYTE), 
	"bufferId" VARCHAR2(400 BYTE), 
	"chunkIndex" NUMBER, 
	"dateCreated" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table custom_fields
--------------------------------------------------------

  CREATE TABLE "custom_fields" 
   (	"id" NUMBER DEFAULT "s_custom_fields"."NEXTVAL", 
	"objectId" NUMBER, 
	"objectName" VARCHAR2(50 BYTE), 
	"fieldName" VARCHAR2(400 BYTE), 
	"fieldValue" VARCHAR2(4000 BYTE), 
	"fieldDataType" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table custom_j5parameters
--------------------------------------------------------

  CREATE TABLE "custom_j5parameters" 
   (	"id" NUMBER DEFAULT "s_custom_j5parameters"."NEXTVAL", 
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
   ) ;
--------------------------------------------------------
--  DDL for Table dd_part
--------------------------------------------------------

  CREATE TABLE "dd_part" 
   (	"id" NUMBER DEFAULT "s_dd_part"."NEXTVAL", 
	"devicedesign_id" NUMBER, 
	"part_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table devicedesign
--------------------------------------------------------

  CREATE TABLE "devicedesign" 
   (	"id" NUMBER DEFAULT "s_devicedesign"."NEXTVAL", 
	"name" VARCHAR2(256 BYTE), 
	"combinatorial" NUMBER, 
	"isCircular" NUMBER, 
	"user_id" NUMBER, 
	"project_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table eugene_rule
--------------------------------------------------------

  CREATE TABLE "eugene_rule" 
   (	"id" NUMBER DEFAULT "s_eugene_rule"."NEXTVAL", 
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
   ) ;
--------------------------------------------------------
--  DDL for Table group
--------------------------------------------------------

  CREATE TABLE "group" 
   (	"id" NUMBER DEFAULT "s_group"."NEXTVAL", 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(4000 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table group_user
--------------------------------------------------------

  CREATE TABLE "group_user" 
   (	"id" NUMBER DEFAULT "s_group_user"."NEXTVAL", 
	"group_id" NUMBER, 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table j5run
--------------------------------------------------------

  CREATE TABLE "j5run" 
   (	"id" NUMBER DEFAULT "s_j5run"."NEXTVAL", 
	"assemblyMethod" VARCHAR2(256 BYTE), 
	"assemblyType" VARCHAR2(256 BYTE), 
	"date" DATE, 
	"devicedesign_name" VARCHAR2(256 BYTE), 
	"endDate" DATE, 
	"name" VARCHAR2(256 BYTE), 
	"status" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"devicedesign_id" NUMBER(*,0), 
	"protocol_id" NUMBER(*,0), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"results" CLOB, 
	"j5output" CLOB, 
	"project_id" NUMBER(38,0), 
	"clientTimeDiff" VARCHAR2(256 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table master
--------------------------------------------------------

  CREATE TABLE "master" 
   (	"user_id" NUMBER, 
	"masterDirectSynthesesList" CLOB, 
	"masterOligoList" CLOB, 
	"masterPlasmidList" CLOB, 
	"id" NUMBER DEFAULT "s_master"."NEXTVAL", 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table part
--------------------------------------------------------

  CREATE TABLE "part" 
   (	"id" NUMBER DEFAULT "s_part"."NEXTVAL", 
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
   ) ;
--------------------------------------------------------
--  DDL for Table preset
--------------------------------------------------------

  CREATE TABLE "preset" 
   (	"id" NUMBER DEFAULT "s_preset"."NEXTVAL", 
	"presetName" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"j5parameters" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table project
--------------------------------------------------------

  CREATE TABLE "project" 
   (	"id" NUMBER DEFAULT "s_project"."NEXTVAL", 
	"name" VARCHAR2(256 BYTE), 
	"user_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table protein
--------------------------------------------------------

  CREATE TABLE "protein" 
   (	"id" NUMBER DEFAULT "s_protein"."NEXTVAL", 
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
   ) ;
--------------------------------------------------------
--  DDL for Table protein_feature
--------------------------------------------------------

  CREATE TABLE "protein_feature" 
   (	"id" NUMBER DEFAULT "s_protein_feature"."NEXTVAL", 
	"name" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(128 BYTE), 
	"start" NUMBER, 
	"end" NUMBER, 
	"notes" VARCHAR2(4000 BYTE), 
	"protein_id" NUMBER(*,0), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"prot_feature_type_id" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table protocol
--------------------------------------------------------

  CREATE TABLE "protocol" 
   (	"id" NUMBER(*,0) DEFAULT "s_protocol"."NEXTVAL", 
	"user_id" NUMBER(*,0), 
	"author" VARCHAR2(256 BYTE), 
	"htmlContent" CLOB, 
	"assemblyMethods" VARCHAR2(4000 BYTE), 
	"name" VARCHAR2(256 BYTE), 
	"version" NUMBER(*,0), 
	"contact" VARCHAR2(256 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table role
--------------------------------------------------------

  CREATE TABLE "role" 
   (	"id" NUMBER DEFAULT "s_role"."NEXTVAL", 
	"name" VARCHAR2(400 BYTE), 
	"description" VARCHAR2(2000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table seq_blacklist
--------------------------------------------------------

  CREATE TABLE "seq_blacklist" 
   (	"user_id" NUMBER(*,0), 
	"sequence_id" NUMBER(*,0), 
	"id" NUMBER(*,0) DEFAULT "s_seq_blacklist"."NEXTVAL", 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table seq_feature
--------------------------------------------------------

  CREATE TABLE "seq_feature" 
   (	"id" NUMBER DEFAULT "s_seq_feature"."NEXTVAL", 
	"name" VARCHAR2(256 BYTE), 
	"type" VARCHAR2(128 BYTE), 
	"start" NUMBER, 
	"end" NUMBER, 
	"sequence_id" NUMBER, 
	"strand" NUMBER(*,0), 
	"notes" VARCHAR2(4000 BYTE), 
	"protein_id" NUMBER(*,0), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table sequence
--------------------------------------------------------

  CREATE TABLE "sequence" 
   (	"id" NUMBER DEFAULT "s_sequence"."NEXTVAL", 
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
   ) ;
--------------------------------------------------------
--  DDL for Table strain
--------------------------------------------------------

  CREATE TABLE "strain" 
   (	"id" NUMBER DEFAULT "s_strain"."NEXTVAL", 
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
   ) ;
--------------------------------------------------------
--  DDL for Table strain_plasmid
--------------------------------------------------------

  CREATE TABLE "strain_plasmid" 
   (	"id" NUMBER DEFAULT "s_strain_plasmid"."NEXTVAL", 
	"strain_id" NUMBER, 
	"sequence_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table tag
--------------------------------------------------------

  CREATE TABLE "tag" 
   (	"name" VARCHAR2(400 BYTE), 
	"color" VARCHAR2(400 BYTE), 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6), 
	"user_id" NUMBER, 
	"id" NUMBER DEFAULT "s_tag"."NEXTVAL"
   ) ;
--------------------------------------------------------
--  DDL for Table user
--------------------------------------------------------

  CREATE TABLE "user" 
   (	"id" NUMBER DEFAULT "s_user"."NEXTVAL", 
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
	"userRestrictionEnzymeGroups" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table user_role
--------------------------------------------------------

  CREATE TABLE "user_role" 
   (	"id" NUMBER DEFAULT "s_user_role"."NEXTVAL", 
	"user_id" NUMBER, 
	"role_id" NUMBER, 
	"dateCreated" TIMESTAMP (6), 
	"dateModified" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Index DE_bin_cell_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "DE_bin_cell_pk" ON "DE_bin_cell" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index DE_bin_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "DE_bin_pk" ON "DE_bin" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index access_control_obj_id_name_idx
--------------------------------------------------------

  CREATE INDEX "access_control_obj_id_name_idx" ON "access_control" ("objectId", "objectName") 
  ;
--------------------------------------------------------
--  DDL for Index access_control_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "access_control_pk" ON "access_control" ("acId") 
  ;
--------------------------------------------------------
--  DDL for Index attached_tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "attached_tag_pk" ON "attached_tag" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index clob_buffer_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "clob_buffer_pk" ON "clob_buffer" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index custom_field_obj_id_name_idx
--------------------------------------------------------

  CREATE INDEX "custom_field_obj_id_name_idx" ON "custom_fields" ("objectId", "objectName") 
  ;
--------------------------------------------------------
--  DDL for Index custom_fields_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "custom_fields_pk" ON "custom_fields" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index custom_j5parameter_user_id_idx
--------------------------------------------------------

  CREATE INDEX "custom_j5parameter_user_id_idx" ON "custom_j5parameters" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index custom_j5parameters_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "custom_j5parameters_pk" ON "custom_j5parameters" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index dd_part_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "dd_part_pk" ON "dd_part" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index devicedesign_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "devicedesign_pk" ON "devicedesign" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index devicedesign_user_id_idx
--------------------------------------------------------

  CREATE INDEX "devicedesign_user_id_idx" ON "devicedesign" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index eugene_rule_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "eugene_rule_pk" ON "eugene_rule" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index group_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "group_pk" ON "group" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index group_user_id_idx
--------------------------------------------------------

  CREATE INDEX "group_user_id_idx" ON "group" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index group_user_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "group_user_pk" ON "group_user" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index group_user_user_id_idx
--------------------------------------------------------

  CREATE INDEX "group_user_user_id_idx" ON "group_user" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index j5run_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "j5run_pk" ON "j5run" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index j5run_user_id_idx
--------------------------------------------------------

  CREATE INDEX "j5run_user_id_idx" ON "j5run" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index master_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "master_pk" ON "master" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index part_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "part_pk" ON "part" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index part_user_id_idx
--------------------------------------------------------

  CREATE INDEX "part_user_id_idx" ON "part" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index preset_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "preset_pk" ON "preset" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index preset_user_id_idx
--------------------------------------------------------

  CREATE INDEX "preset_user_id_idx" ON "preset" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index project_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "project_pk" ON "project" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index project_user_id_idx
--------------------------------------------------------

  CREATE INDEX "project_user_id_idx" ON "project" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index protein_feature_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "protein_feature_pk" ON "protein_feature" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index protein_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "protein_pk" ON "protein" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index protein_user_id_idx
--------------------------------------------------------

  CREATE INDEX "protein_user_id_idx" ON "protein" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index protocol_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "protocol_pk" ON "protocol" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index protocol_user_id_idx
--------------------------------------------------------

  CREATE INDEX "protocol_user_id_idx" ON "protocol" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index role_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "role_pk" ON "role" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index seq_blacklist_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "seq_blacklist_pk" ON "seq_blacklist" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index seq_blacklist_user_id_idx
--------------------------------------------------------

  CREATE INDEX "seq_blacklist_user_id_idx" ON "seq_blacklist" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index seq_feature_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "seq_feature_pk" ON "seq_feature" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index sequence_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "sequence_pk" ON "sequence" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index sequence_user_id_idx
--------------------------------------------------------

  CREATE INDEX "sequence_user_id_idx" ON "sequence" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index strain_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "strain_pk" ON "strain" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index strain_plasmid_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "strain_plasmid_pk" ON "strain_plasmid" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index strain_user_id_idx
--------------------------------------------------------

  CREATE INDEX "strain_user_id_idx" ON "strain" ("user_id") 
  ;
--------------------------------------------------------
--  DDL for Index tag_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "tag_pk" ON "tag" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index user_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "user_pk" ON "user" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index user_role_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "user_role_pk" ON "user_role" ("id") 
  ;
--------------------------------------------------------
--  DDL for Index user_role_user_id_idx
--------------------------------------------------------

  CREATE INDEX "user_role_user_id_idx" ON "user_role" ("user_id") 
  ;
--------------------------------------------------------
--  Constraints for Table DE_bin
--------------------------------------------------------

  ALTER TABLE "DE_bin" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "DE_bin" ADD CONSTRAINT "DE_bin_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DE_bin_cell
--------------------------------------------------------

  ALTER TABLE "DE_bin_cell" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "DE_bin_cell" ADD CONSTRAINT "DE_bin_cell_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table access_control
--------------------------------------------------------

  ALTER TABLE "access_control" MODIFY ("acId" NOT NULL ENABLE);
  ALTER TABLE "access_control" MODIFY ("objectId" NOT NULL ENABLE);
  ALTER TABLE "access_control" MODIFY ("objectName" NOT NULL ENABLE);
  ALTER TABLE "access_control" ADD CONSTRAINT "access_control_pk" PRIMARY KEY ("acId")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table attached_tag
--------------------------------------------------------

  ALTER TABLE "attached_tag" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "attached_tag" ADD CONSTRAINT "attached_tag_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table clob_buffer
--------------------------------------------------------

  ALTER TABLE "clob_buffer" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "clob_buffer" ADD CONSTRAINT "clob_buffer_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table custom_fields
--------------------------------------------------------

  ALTER TABLE "custom_fields" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "custom_fields" MODIFY ("objectId" NOT NULL ENABLE);
  ALTER TABLE "custom_fields" MODIFY ("objectName" NOT NULL ENABLE);
  ALTER TABLE "custom_fields" MODIFY ("fieldName" NOT NULL ENABLE);
  ALTER TABLE "custom_fields" ADD CONSTRAINT "custom_fields_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table custom_j5parameters
--------------------------------------------------------

  ALTER TABLE "custom_j5parameters" ADD CONSTRAINT "custom_j5parameters_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "custom_j5parameters" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table dd_part
--------------------------------------------------------

  ALTER TABLE "dd_part" ADD CONSTRAINT "dd_part_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "dd_part" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table devicedesign
--------------------------------------------------------

  ALTER TABLE "devicedesign" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "devicedesign" ADD CONSTRAINT "devicedesign_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table eugene_rule
--------------------------------------------------------

  ALTER TABLE "eugene_rule" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "eugene_rule" ADD CONSTRAINT "eugene_rule_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table group
--------------------------------------------------------

  ALTER TABLE "group" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "group" ADD CONSTRAINT "group_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table group_user
--------------------------------------------------------

  ALTER TABLE "group_user" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "group_user" MODIFY ("group_id" NOT NULL ENABLE);
  ALTER TABLE "group_user" MODIFY ("user_id" NOT NULL ENABLE);
  ALTER TABLE "group_user" ADD CONSTRAINT "group_user_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table j5run
--------------------------------------------------------

  ALTER TABLE "j5run" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "j5run" ADD CONSTRAINT "j5run_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table master
--------------------------------------------------------

  ALTER TABLE "master" ADD CONSTRAINT "master_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "master" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table part
--------------------------------------------------------

  ALTER TABLE "part" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "part" ADD CONSTRAINT "part_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table preset
--------------------------------------------------------

  ALTER TABLE "preset" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "preset" ADD CONSTRAINT "preset_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table project
--------------------------------------------------------

  ALTER TABLE "project" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "project" ADD CONSTRAINT "project_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table protein
--------------------------------------------------------

  ALTER TABLE "protein" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "protein" ADD CONSTRAINT "protein_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table protein_feature
--------------------------------------------------------

  ALTER TABLE "protein_feature" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "protein_feature" ADD CONSTRAINT "protein_feature_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table protocol
--------------------------------------------------------

  ALTER TABLE "protocol" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "protocol" ADD CONSTRAINT "protocol_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table role
--------------------------------------------------------

  ALTER TABLE "role" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "role" MODIFY ("name" NOT NULL ENABLE);
  ALTER TABLE "role" ADD CONSTRAINT "role_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table seq_blacklist
--------------------------------------------------------

  ALTER TABLE "seq_blacklist" ADD CONSTRAINT "seq_blacklist_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "seq_blacklist" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table seq_feature
--------------------------------------------------------

  ALTER TABLE "seq_feature" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "seq_feature" ADD CONSTRAINT "seq_feature_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table sequence
--------------------------------------------------------

  ALTER TABLE "sequence" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "sequence" ADD CONSTRAINT "sequence_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table strain
--------------------------------------------------------

  ALTER TABLE "strain" ADD CONSTRAINT "strain_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "strain" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table strain_plasmid
--------------------------------------------------------

  ALTER TABLE "strain_plasmid" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "strain_plasmid" ADD CONSTRAINT "strain_plasmid_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table tag
--------------------------------------------------------

  ALTER TABLE "tag" ADD CONSTRAINT "tag_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
  ALTER TABLE "tag" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table user
--------------------------------------------------------

  ALTER TABLE "user" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "user" ADD CONSTRAINT "user_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table user_role
--------------------------------------------------------

  ALTER TABLE "user_role" MODIFY ("id" NOT NULL ENABLE);
  ALTER TABLE "user_role" MODIFY ("user_id" NOT NULL ENABLE);
  ALTER TABLE "user_role" MODIFY ("role_id" NOT NULL ENABLE);
  ALTER TABLE "user_role" ADD CONSTRAINT "user_role_pk" PRIMARY KEY ("id")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DE_bin
--------------------------------------------------------

  ALTER TABLE "DE_bin" ADD CONSTRAINT "DE_bin_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DE_bin_cell
--------------------------------------------------------

  ALTER TABLE "DE_bin_cell" ADD CONSTRAINT "DE_bin_cell_de_bin_fk" FOREIGN KEY ("de_bin_id")
	  REFERENCES "DE_bin" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table access_control
--------------------------------------------------------

  ALTER TABLE "access_control" ADD CONSTRAINT "access_control_dependsOn_fk" FOREIGN KEY ("dependsOn")
	  REFERENCES "access_control" ("acId") ENABLE;
  ALTER TABLE "access_control" ADD CONSTRAINT "access_control_group_fk" FOREIGN KEY ("groupId")
	  REFERENCES "group" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "access_control" ADD CONSTRAINT "access_control_user_fk" FOREIGN KEY ("userId")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table custom_j5parameters
--------------------------------------------------------

  ALTER TABLE "custom_j5parameters" ADD CONSTRAINT "custom_j5parameters_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table dd_part
--------------------------------------------------------

  ALTER TABLE "dd_part" ADD CONSTRAINT "dd_part_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "dd_part" ADD CONSTRAINT "dd_part_part_fk" FOREIGN KEY ("part_id")
	  REFERENCES "part" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table devicedesign
--------------------------------------------------------

  ALTER TABLE "devicedesign" ADD CONSTRAINT "devicedesign_project_fk" FOREIGN KEY ("project_id")
	  REFERENCES "project" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "devicedesign" ADD CONSTRAINT "devicedesign_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table eugene_rule
--------------------------------------------------------

  ALTER TABLE "eugene_rule" ADD CONSTRAINT "eugene_rule_devicedesign_fk" FOREIGN KEY ("devicedesign_id")
	  REFERENCES "devicedesign" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table group
--------------------------------------------------------

  ALTER TABLE "group" ADD CONSTRAINT "group_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table group_user
--------------------------------------------------------

  ALTER TABLE "group_user" ADD CONSTRAINT "group_user_group_fk" FOREIGN KEY ("group_id")
	  REFERENCES "group" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "group_user" ADD CONSTRAINT "group_user_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table j5run
--------------------------------------------------------

  ALTER TABLE "j5run" ADD CONSTRAINT "j5run_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table part
--------------------------------------------------------

  ALTER TABLE "part" ADD CONSTRAINT "part_sequence_fk" FOREIGN KEY ("sequence_id")
	  REFERENCES "sequence" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "part" ADD CONSTRAINT "part_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table preset
--------------------------------------------------------

  ALTER TABLE "preset" ADD CONSTRAINT "preset_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table project
--------------------------------------------------------

  ALTER TABLE "project" ADD CONSTRAINT "project_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table protein
--------------------------------------------------------

  ALTER TABLE "protein" ADD CONSTRAINT "protein_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table protein_feature
--------------------------------------------------------

  ALTER TABLE "protein_feature" ADD CONSTRAINT "protein_feature_protein_fk" FOREIGN KEY ("protein_id")
	  REFERENCES "protein" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table protocol
--------------------------------------------------------

  ALTER TABLE "protocol" ADD CONSTRAINT "protocol_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table seq_blacklist
--------------------------------------------------------

  ALTER TABLE "seq_blacklist" ADD CONSTRAINT "seq_blacklist_sequence_fk" FOREIGN KEY ("sequence_id")
	  REFERENCES "sequence" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "seq_blacklist" ADD CONSTRAINT "seq_blacklist_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table seq_feature
--------------------------------------------------------

  ALTER TABLE "seq_feature" ADD CONSTRAINT "seq_feature_protein_fk" FOREIGN KEY ("protein_id")
	  REFERENCES "protein" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "seq_feature" ADD CONSTRAINT "seq_feature_sequence_fk" FOREIGN KEY ("sequence_id")
	  REFERENCES "sequence" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table sequence
--------------------------------------------------------

  ALTER TABLE "sequence" ADD CONSTRAINT "sequence_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table strain
--------------------------------------------------------

  ALTER TABLE "strain" ADD CONSTRAINT "strain_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table strain_plasmid
--------------------------------------------------------

  ALTER TABLE "strain_plasmid" ADD CONSTRAINT "strain_plasmid_sequence_fk" FOREIGN KEY ("sequence_id")
	  REFERENCES "sequence" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "strain_plasmid" ADD CONSTRAINT "strain_plasmid_strain_fk" FOREIGN KEY ("strain_id")
	  REFERENCES "strain" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table user_role
--------------------------------------------------------

  ALTER TABLE "user_role" ADD CONSTRAINT "user_role_role_fk" FOREIGN KEY ("role_id")
	  REFERENCES "role" ("id") ENABLE;
  ALTER TABLE "user_role" ADD CONSTRAINT "user_role_user_fk" FOREIGN KEY ("user_id")
	  REFERENCES "user" ("id") ENABLE;
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
