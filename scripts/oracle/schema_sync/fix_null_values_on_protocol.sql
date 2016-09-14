select count(*) from "protocol" where "assemblyMethods" = 'null';

update "protocol" 
set "assemblyMethods" = null
where "assemblyMethods" = 'null';

select count(*) from "protocol" where "assemblyMethods" = 'null';

commit;