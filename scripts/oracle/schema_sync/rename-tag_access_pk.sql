alter index "tag_access_PK" rename to "tag_access_pk";

alter table "tag_access" rename constraint "tag_access_PK" to "tag_access_pk";

drop index "z_activity_log_objectName_ix";