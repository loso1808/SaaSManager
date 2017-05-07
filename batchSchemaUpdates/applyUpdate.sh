#!/bin/bash
# NAME="PROD"
# OWNER_PASS="STdqcMM6OXAOH9sfg"
# APP_PASS="1EYtpM9HGFVAEAYED"

# NAME="IDT"
# OWNER_PASS="VYUJxBQKiFWE6HwMe"
# APP_PASS="N4OtTSZCoGP3BRnUf"

NAME="ARZEDA"
OWNER_PASS="O2FWxI0UtUP6JPSAi"
APP_PASS="2RBDVGJBtVSWOWhHl"

# NAME="INTREXON"
# OWNER_PASS="GWEOCGIFs1LJF7LGK"
# APP_PASS="49KrVo6ImXZ6Q3XiD"

# NAME="SENTIBIO"
# OWNER_PASS="K5XawUQ5UC1R9DOlG"
# APP_PASS="ZDbWQEFSRAQZVXBsJ"

# NAME="CONAGEN"
# OWNER_PASS="2BjIMvQLuZ6KEDbuw"
# APP_PASS="JJIWVx6PM3GPMUqUM"

# NAME="LANZATECH"
# OWNER_PASS="X2eRCrKXx5BXWFake"
# APP_PASS="QJTWMlVVCBIB21rZn"

# NAME="PDFOODS"
# OWNER_PASS="TEPbIcK4qH21DQbHI"
# APP_PASS="1WXlocCEwE1HJQYhp"

# NAME="PGENETICS"
# OWNER_PASS="GKYxhxDUj0BSUTJpQ"
# APP_PASS="QPyaaE40gS2MICdXw"

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
sqlplus "PNY_${NAME}_DBO/${OWNER_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=peony-prod.c1grsxamme4w.us-west-1.rds.amazonaws.com)(Port=1521))(CONNECT_DATA=(SID=ORCL)))" @$e
cd ..
cd ..
cd /Users/rpavez/Sites/SaaSManager/batchSchemaUpdates/update_${OLD}_to_${NEW}/02-runas_peony_app/
sqlplus "PNY_${NAME}_APP/${APP_PASS}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=peony-prod.c1grsxamme4w.us-west-1.rds.amazonaws.com)(Port=1521))(CONNECT_DATA=(SID=ORCL)))" @$f



