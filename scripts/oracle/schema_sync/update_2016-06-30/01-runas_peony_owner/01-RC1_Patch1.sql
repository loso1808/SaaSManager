--Run as the schema owner

--Set default value for dateLogged column in log tables
@@modify-dateLogged.sql;

--Set dateLogged column to not null in log tables
@@modify-dateLogged-not-null.sql;

--Drop extraneous clobTest column from j5run
@@drop-j5run-clobTest.sql;

--Set userId to be nullable in access_control table
@@access_control-userId-nullable.sql;

--Add cascade on delete for group_user.group_id foreign key to group table
@@add-group-cascade-on-delete.sql;

--Increase j5parameter column size to max in preset table
@@modify-j5parameters.sql;