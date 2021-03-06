CREATE OR REPLACE PROCEDURE SCOTT.UPDATESALEMP3
(CODIGO EMP.EMPNO%TYPE, SALARIO EMP.SAL%TYPE)
IS
    CONT NUMBER;
BEGIN

	SELECT COUNT(*) INTO CONT
	FROM EMP
	WHERE EMPNO = CODIGO;
	
	IF (CONT=0) THEN
		RAISE_APPLICATION_ERROR( -20000, 'CODIGO ' || CODIGO || ' NO EXISTE');
	END IF;

	UPDATE EMP
	SET SAL = SALARIO
	WHERE EMPNO = CODIGO;
	
	COMMIT;
	
	DBMS_OUTPUT.PUT_LINE ('PROCESO OK');
		
END;



BEGIN
	SCOTT.UPDATESALEMP3 (7369, 1000);
END;

/*
SELECT *
FROM EMP
WHERE EMPNO = 7369
*/