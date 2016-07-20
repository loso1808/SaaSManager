select * from "z_activity_log" where rownum < 100 

--and "dateLogged" < to_timestamp('2016-07-07 03:57:09', 'yyyy-mm-dd hh24:mi:ss') AT TIME ZONE 'UTC'
--and "logAction" like '%error%'
--and "description" like '%577dc6f911726a02a2f27ff5%'
and "description" like 'On 2016-07-07 03:5%'
order by "dateLogged" desc;

select "logAction" from "z_activity_log" group by "logAction";