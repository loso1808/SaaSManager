#!/bin/bash
NAME="DOCKER"
OWNER_PASS="3BOoRM1UV3BE9SLwx"
APP_PASS="ZZvWwxBIlZVNVOICn"

OLD="1.19.0"
NEW="1.20.0"

a="update_"$OLD"_to_$NEW/01-runas_peony_owner/01-update_to_rc_"$NEW".sql"
b="update_"$OLD"_to_$NEW/01-runas_peony_owner/01-update_to_rc_"$NEW".exec.sql"

c="update_"$OLD"_to_"$NEW"/02-runas_peony_app/01-fix_synonyms.sql"
d="update_"$OLD"_to_"$NEW"/02-runas_peony_app/01-fix_synonyms.exec.sql"

e="01-update_to_rc_"$NEW".exec.sql"
f="01-fix_synonyms.exec.sql"

echo "Updating PNY_${NAME}_DBO from ${OLD} to ${NEW}"
sed -e s/PEONY_OWNER/PNY_${NAME}_DBO/g -e s/PEONY_APP_ROLE/PNY_${NAME}_AR/g $a > $b
sed -e s/PEONY_OWNER/PNY_${NAME}_DBO/g -e s/PEONY_APP/PNY_${NAME}_APP/g $c > $d

echo "quit" >> $b
echo "quit" >> $d


cd /Users/rpavez/Sites/SaaSManager/batchSchemaUpdates/update_${OLD}_to_${NEW}/01-runas_peony_owner/
sqlplus "PNY_${NAME}_DBO/${OWNER_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=192.168.1.29)(Port=3521))(CONNECT_DATA=(SID=ORCL)))" @$e
cd ..
cd ..
cd /Users/rpavez/Sites/SaaSManager/batchSchemaUpdates/update_${OLD}_to_${NEW}/02-runas_peony_app/
sqlplus "PNY_${NAME}_APP/${APP_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=192.168.1.29)(Port=3521))(CONNECT_DATA=(SID=ORCL)))" @$f



