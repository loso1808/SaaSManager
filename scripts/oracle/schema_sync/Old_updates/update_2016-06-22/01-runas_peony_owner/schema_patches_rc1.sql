  
ALTER TABLE "eugene_rule"
DROP CONSTRAINT eugene_rule_devicedesign_fk;

ALTER TABLE "eugene_rule"
ADD CONSTRAINT "eugene_rule_devicedesign_fk"
  FOREIGN KEY ("devicedesign_id")
  REFERENCES "devicedesign"("id")
  ON DELETE CASCADE;
  
delete "dd_part"
where "id" IN
(
  select dp."id" from 
    "dd_part" dp
      left join
    "part" p
      on dp."part_id" = p."id"
  where
    p."id" is null
);

commit;

alter table "dd_part" 
      add constraint "dd_part_part_fk" foreign key("part_id") 
      references "part" ("id") ON DELETE CASCADE ENABLE;
      
ALTER TABLE "preset" ADD CONSTRAINT "preset_pk" PRIMARY KEY ("id");
CREATE SEQUENCE "s_preset" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
ALTER TABLE "preset" MODIFY ("id" DEFAULT ON NULL "s_preset".NEXTVAL );                    

ALTER TABLE "seq_blacklist" ADD CONSTRAINT "seq_blacklist_pk" PRIMARY KEY ("id");
CREATE SEQUENCE "s_seq_blacklist" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
ALTER TABLE "seq_blacklist" MODIFY ("id" DEFAULT ON NULL "s_seq_blacklist".NEXTVAL );   