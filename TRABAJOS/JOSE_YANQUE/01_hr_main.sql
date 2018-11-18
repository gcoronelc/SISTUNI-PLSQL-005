SET ECHO OFF
SET TERMOUT OFF
CLEAR COLUMNS;


COLUMN c_nome_instancia NOPRINT NEW_VALUE c_Nom_Instance

SELECT  instance_name c_nome_instancia
FROM    v$instance;

-- The first dot in the spool command below is 
-- the SQL*Plus concatenation character

DEFINE spool_file = hr_main.log
SPOOL &spool_file

REM =======================================================
REM cleanup section
REM =======================================================

DROP USER hr CASCADE;

REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER hr IDENTIFIED BY hr;

ALTER USER hr DEFAULT TABLESPACE users
              QUOTA UNLIMITED ON users;

ALTER USER hr TEMPORARY TABLESPACE temp;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO hr;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE TO hr;

REM =======================================================
REM grants from sys schema
REM =======================================================

GRANT execute ON sys.dbms_stats TO hr;

REM =======================================================
REM create hr schema objects
REM =======================================================

ALTER SESSION SET CURRENT_SCHEMA = HR;
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

--
-- create tables, sequences and constraint
--
@hr_cre
-- 
-- populate tables
--
@hr_popul
--
-- create indexes
--
@hr_idx
--
-- create procedural objects
--
@hr_code
--
-- add comments to tables and columns
--
@hr_comnt
--
-- gather schema statistics
--
@hr_analz
spool off

SET TERMOUT ON
PROMPT Criacao usuario HR finalizada...