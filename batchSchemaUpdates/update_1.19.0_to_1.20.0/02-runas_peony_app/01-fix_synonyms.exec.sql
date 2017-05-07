
DEFINE APP_USER = PNY_ARZEDA_APP;
DEFINE SCHEMA_OWNER_NAME = PNY_ARZEDA_DBO;


--drop all the of the app user synonyms
@@dropAppUserSynonyms.sql;

--recreate all of the app user synonyms
@@createAppUserSynonyms.sql;
quit
