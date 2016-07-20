CREATE USER &&APP_USER                              --Create schema/login 
    IDENTIFIED BY "&APP_USER_PASSWORD"              --Set password
    DEFAULT TABLESPACE &&TABLESPACE_NAME            --Set the default tablespace created above
    TEMPORARY TABLESPACE &&TEMP_TABLESPACE_NAME;    --Set the temp tablespace

GRANT create synonym to &&APP_USER;
GRANT &&APP_ROLE to &&APP_USER;

