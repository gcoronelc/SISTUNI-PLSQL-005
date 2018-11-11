CREATE OR REPLACE PROCEDURE SCOTT.pr120(COD NUMBER, DELTA NUMBER)
IS
BEGIN
	UPDATE EMP
		SET SAL = SAL+ DELTA
		WHERE EMPNO = COD;
	IF SQL%NOTFOUND THEN	
		DBMS_OUTPUT.PUT_LINE('NO EXISTE');
	ELSE
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('PROCESO OK');
	END IF;
	
END;

BEGIN
	SCOTT.PR120(7369,200);
END;