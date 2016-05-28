Instructions for using the provisioning scripts.

The main script to run is provisionSchema.sql. 
Before running this script open on schemaConfig.sql
and modify the define values to match what you're doing.
You must run provisionSchema as sys.

The passwords for the schemas you just provisioned will
be written to a file schema_passwords.txt. If that file
already exists values will be appended to it. The file is
placed in current working directory of the client 
(SQL Plus or SQL Developer) you're using to execute the script.

You can delete a schema (and associated tablespaces) by
running the dropSchema_sys.sql file. It also uses the 
schemaConfig.sql so make sure to update that file before
running the drop script.

These scripts don't yet setup any starter data
including roles or an admin user.

