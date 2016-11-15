/*
  Release Notes for RC 1.12.x 2016-11-03
  
  This is a patch release to update from RC 1.11.x to RC 1.12.x.
  
  This is the only script required for this update.
  
  This update scripts needs to run as PEONY_OWNER and adds a column which 
  enables the ability to specify the feature type on a next level part.
*/

alter table "next_level_part" add ("featureType" varchar2(400));

alter table "z_next_level_part" add ("featureType" varchar2(400));

update "next_level_part" 
set "featureType" = 'misc_feature';

commit;