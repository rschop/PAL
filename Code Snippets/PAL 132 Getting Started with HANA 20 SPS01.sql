--------------------------------
-- RUN AGAINST SYSTEMDB DATABASE
--------------------------------

-- CHECK AFL PAL FUNCTIONS ARE INSTALLED
SELECT * FROM SYS.AFL_FUNCTIONS WHERE PACKAGE_NAME='PAL';

-- CHECK TENANT DATABASE EXISTS AND IS STARTED
SELECT * FROM SYS.M_DATABASES;

-- CREATE TENANT DATABASE (IF NEEDED)
CREATE DATABASE SHA SYSTEM USER PASSWORD Password1;

-- START TENANT DATABASE (IF NEEDED)
ALTER SYSTEM START DATABASE SHA;

-- ADD SCRIPT SERVER TO TENANT DATABASE
ALTER DATABASE SHA ADD 'scriptserver';


------------------------------
-- RUN AGAINST TENANT DATABASE
------------------------------

-- CHECK SCRIPT SERVER
SELECT * FROM SYS.M_SERVICES;

-- CREATE USER FOR PAL DEVELOPMENT
CREATE USER DEVUSER PASSWORD Password1;

-- AUTHORIZE ACCESS TO SYS VIEWS
GRANT CATALOG READ TO DEVUSER;

-- AUTHORIZE CREATION & REMOVAL OF PAL PROCEDURES
GRANT AFLPM_CREATOR_ERASER_EXECUTE TO DEVUSER;

-- AUTHORIZE EXECUTION OF PAL PROCEDURES
GRANT AFL__SYS_AFL_AFLPAL_EXECUTE TO DEVUSER;

-- IMPORT PAL SCHEMA

-- AUTHORIZE READ ACCESS TO DATA
GRANT SELECT ON SCHEMA PAL TO DEVUSER;
