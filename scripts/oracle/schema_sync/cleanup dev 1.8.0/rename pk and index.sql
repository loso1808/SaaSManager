                                                                                                                                                                                                                                                                                                                                               
ALTER TABLE "tag_access" RENAME CONSTRAINT "tag_access_PK"  TO "tag_access_pk";                                                                                                                                                                                                                                           
ALTER INDEX "tag_access_PK" RENAME  TO "tag_access_pk";  

DROP INDEX "z_activity_log_objectName_ix";