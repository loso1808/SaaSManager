
DEFINE APP_USER = PNY_RC_1_19_0_APP;
DEFINE SCHEMA_OWNER_NAME = PNY_RC_1_19_0_DBO;

--drop all the of the app user synonyms
@@dropAppUserSynonyms.sql;

--recreate all of the app user synonyms
@@createAppUserSynonyms.sql;
quit
