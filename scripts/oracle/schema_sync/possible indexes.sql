create index "access_control_obj_id_name_idx" on "access_control" ("objectId", "objectName") ;

create index "access_control_groupUserId_idx" on "access_control" ("userId", "groupId", "creatorId") ;

create index "access_control_dependsOn_idx" on "access_control" ("dependsOn") ;

create index "z_activity_log_logSessId_idx" on "z_activity_log" ("logSessionId") ;

create index "z_sequence_id_idx" on "z_sequence" ("id") ; 

create index "z_sequence_logSessionId_idx" on "z_sequence" ("logSessionId") ;

create index "z_part_id_idx" on "z_part" ("id") ; 

create index "z_seq_feature_id_idx" on "z_seq_feature" ("id") ; 

create index "user_role_userRoleIds_idx" on "user_role" ("user_id", "role_id") ;


alter index "access_control_obj_id_name_idx" rebuild;
alter index "access_control_groupUserId_idx" rebuild;
alter index "access_control_dependsOn_idx" rebuild;
alter index "z_activity_log_logSessId_idx" rebuild;
alter index "z_sequence_id_idx" rebuild;
alter index "z_sequence_logSessionId_idx" rebuild;
alter index "z_part_id_idx" rebuild;
alter index "user_role_userRoleIds_idx" rebuild;