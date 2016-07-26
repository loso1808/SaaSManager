
DEFINE APP_USER = PNY_PROD_APP;
DEFINE SCHEMA_OWNER_NAME = PNY_PROD_DBO;


--drop all the of the app user synonyms
@@dropAppUserSynonyms.sql;

--recreate all of the app user synonyms
@@createAppUserSynonyms.sql;

