#!/bin/bash
code=$(cat schemacode.txt)
echo $code
rm /home/teselagen/SaaSManager/oramgr/schema-manager/scratch/*
rm *.sql
node schema-to-script.js
node template-to-script.js > $code
node autoEmailSend.js
