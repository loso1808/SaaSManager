
drop table "clob_test";
drop table "group_data";
drop table "group_project";
drop table "group_project_data";
drop table "group_project_user";
drop table "import_data";
drop table "import_file";
drop table "import_log";
drop table "import_operation";
drop table "segment_rel_type";
drop table "segment_relationship";
drop table "protein_segment";
drop table "feature_type";

drop table "z_clob_test";
drop table "z_group_data";
drop table "z_group_project";
drop table "z_group_project_data";
drop table "z_group_project_user";
drop table "z_import_data";
drop table "z_import_file";
drop table "z_import_operation";
drop table "z_segment_rel_type";
drop table "z_segment_relationship";
drop table "z_protein_segment";
drop table "z_feature_type";

/*
select * from user_constraints where constraint_type = 'P';

alter table "sequence" rename constraint "SEQ_PK" to "sequence_pk";
alter index "SEQ_PK" rename to "sequence_pk";
*/