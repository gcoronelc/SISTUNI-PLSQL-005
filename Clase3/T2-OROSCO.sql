----------------------
-- TAREA 2
----------------------

CREATE OR REPLACE PROCEDURE PR112 (EMPNO NUMBER)
IS 
BEGIN
	DELETE FROM EMP WHERE EMPNO = EMPNO;
END;

SELECT * FROM EMP;

BEGIN
	SCOTT.PR112 (7369);
END;

