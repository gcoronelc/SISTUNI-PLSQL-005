CREATE OR REPLACE PROCEDURE PR120(COD NUMBER, DELTA NUMBER)
IS
BEGIN
	UPDATE EMP
		SET SAL = SAL + DELTA
		WHERE EMPNO = COD;
	IF SQL%NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE('NO EXISTE');
	ELSE
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('PROCESO OK');
	END IF;
END;

SELECT * FROM EMP;

BEGIN
	SCOTT.PR120 (7369, 100);
END;