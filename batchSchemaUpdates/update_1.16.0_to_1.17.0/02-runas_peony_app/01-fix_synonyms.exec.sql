
DEFINE APP_USER = PNY_INTREXON_APP;
DEFINE SCHEMA_OWNER_NAME = PNY_INTREXON_DBO;


--drop all the of the app user synonyms
@@dropAppUserSynonyms.sql;

--recreate all of the app user synonyms
@@createAppUserSynonyms.sql;
quit
