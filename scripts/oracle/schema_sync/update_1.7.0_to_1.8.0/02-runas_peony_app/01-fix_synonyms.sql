
DEFINE APP_USER = PEONY_APP;
DEFINE SCHEMA_OWNER_NAME = PEONY_OWNER;


--drop all the of the app user synonyms
@@dropAppUserSynonyms.sql;

--recreate all of the app user synonyms
@@createAppUserSynonyms.sql;

