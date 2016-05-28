DEFINE TESTVAL = 'foo bar';

--var foobar varchar2(1000);
--BEGIN
--  :foobar:= 'Hello &TESTVAL';
--END;
  set echo off;
  set feedback off;
  set linesize 1000;
  set sqlprompt '';
  set trimspool on;
  set termout off;
  set verify off;
  SPOOL schema_passwords.txt REPLACE
  select 'Hello &TESTVAL' from dual;
  SPOOL OFF;
  set echo on;
  set feedback on;
  set termout on;
  set verify on;