CREATE OR REPLACE FUNCTION SCOTT.FN_SAL_EMP
( P_EMPNO NUMBER )
RETURN NUMBER
AS
	v_suma NUMBER(8);
BEGIN
	-- Proceso
	SELECT SAL INTO v_suma
	FROM SCOTT.EMP
	WHERE EMPNO = P_EMPNO;
	-- Valor de Retorno
RETURN V_SUMA;
END;

SELECT SCOTT.FN_SAL_EMP (7369) FROM DUAL;
