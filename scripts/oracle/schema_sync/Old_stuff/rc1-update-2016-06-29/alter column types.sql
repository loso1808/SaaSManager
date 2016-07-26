alter table "attached_tag" modify ("tagged_data_type" varchar2(400));
alter table "z_attached_tag" modify ("tagged_data_type" varchar2(400));

alter table "attached_tag" modify ("filterLogic" varchar2(400));
alter table "z_attached_tag" modify ("filterLogic" varchar2(400));

alter table "tag" modify ("name" varchar2(400));
alter table "z_tag" modify ("name" varchar2(400));

alter table "tag" modify ("color" varchar2(400));
alter table "z_tag" modify ("color" varchar2(400));

alter table "z_j5run" modify ("project_id" number);
alter table "z_j5run" modify ("devicedesign_id" number);
alter table "z_j5run" modify ("protocol_id" number);

alter table "z_DE_bin" modify ("DEIndex" number);

alter table "z_protein_feature" modify ("protein_id" number);

alter table "z_protocol" modify ("id" number);
alter table "z_protocol" modify ("user_id" number);
alter table "z_protocol" modify ("version" number);

alter table "z_seq_blacklist" modify ("id" number);
alter table "z_seq_blacklist" modify ("user_id" number);
alter table "z_seq_blacklist" modify ("sequence_id" number);

alter table "z_seq_feature" modify ("strand" number);
alter table "z_seq_feature" modify ("protein_id" number);

