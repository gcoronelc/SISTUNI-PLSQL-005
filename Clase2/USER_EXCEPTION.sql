CREATE OR REPLACE PROCEDURE SCOTT.UPDATESALEMP
(CODIGO EMP.EMPNO%TYPE, SALARIO EMP.SAL%TYPE)
IS
    CONT NUMBER;
BEGIN

	SELECT COUNT(*) INTO CONT
	FROM EMP
	WHERE EMPNO = CODIGO;
	
	IF (CONT=0) THEN
		RAISE NO_DATA_FOUND;
	END IF;

	UPDATE EMP
	SET SAL = SALARIO
	WHERE EMPNO = CODIGO;
	
	COMMIT;
	
	DBMS_OUTPUT.PUT_LINE ('PROCESO OK');
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('CODIGO NO EXISTE.');	
	
END;



BEGIN
	SCOTT.UPDATESALEMP (17369, 1000);
END;

/*
SELECT *
FROM EMP
WHERE EMPNO = 7369
*/