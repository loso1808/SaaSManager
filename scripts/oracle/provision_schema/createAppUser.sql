CREATE USER &&APP_USER                              --Create schema/login 
    IDENTIFIED BY "&APP_USER_PASSWORD";             --Set password

GRANT create synonym to &&APP_USER;
GRANT &&APP_ROLE to &&APP_USER;

