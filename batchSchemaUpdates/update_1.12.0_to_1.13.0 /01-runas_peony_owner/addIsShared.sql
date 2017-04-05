
ALTER TABLE "devicedesign" ADD ("isShared" NUMBER);                                                                                                                     
ALTER TABLE "part" ADD ("isShared" NUMBER);                                                                                                                             
ALTER TABLE "project" ADD ("isShared" NUMBER);                                                                                                                          
ALTER TABLE "protein" ADD ("isShared" NUMBER);                                                                                                                          
ALTER TABLE "protocol" ADD ("isShared" NUMBER);                                                                                                                         
ALTER TABLE "sequence" ADD ("isShared" NUMBER);                                                                                                                         
ALTER TABLE "strain" ADD ("isShared" NUMBER);    


ALTER TABLE "z_strain" ADD ("isShared" NUMBER);                                                                                                                         
ALTER TABLE "z_sequence" ADD ("isShared" NUMBER);                                                                                                                       
ALTER TABLE "z_protocol" ADD ("isShared" NUMBER);                                                                                                                       
ALTER TABLE "z_protein" ADD ("isShared" NUMBER);                                                                                                                        
ALTER TABLE "z_project" ADD ("isShared" NUMBER);                                                                                                                        
ALTER TABLE "z_part" ADD ("isShared" NUMBER);                                                                                                                           
ALTER TABLE "z_devicedesign" ADD ("isShared" NUMBER);                                                                                                                   

update "devicedesign" set "isShared" = 0; 
update "devicedesign" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'devicedesign' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                            

update "part" set "isShared" = 0; 
update "part" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'part' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                                                    

update "project" set "isShared" = 0; 
update "project" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'project' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                                           

update "protein" set "isShared" = 0; 
update "protein" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'protein' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                                           

update "protocol" set "isShared" = 0; 
update "protocol" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'protocol' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                                        

update "sequence" set "isShared" = 0; 
update "sequence" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'sequence' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                                        

update "strain" set "isShared" = 0; 
update "strain" t set "isShared" = 1 where "id" in (select "objectId" from "access_control" where "objectName" = 'strain' and "objectId" = t."id" and (("userId" <> t."user_id" and "userId" is not null) or ("groupId" is not null)));                                                                                                                                                                                                                                                                                                                                                                              
commit;