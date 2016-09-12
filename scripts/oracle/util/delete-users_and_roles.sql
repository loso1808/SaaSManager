--select * from user_sequences order by last_number desc;

delete "user_role";
delete "user";
delete "role";

commit;

--select * from user_sequences order by last_number desc;