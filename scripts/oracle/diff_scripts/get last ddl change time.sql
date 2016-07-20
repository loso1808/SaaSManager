select 
--max(last_ddl_time) last_changed 
max(timestamp)
from user_objects where generated = 'N';

describe user_objects;