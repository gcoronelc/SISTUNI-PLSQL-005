CREATE OR REPLACE FUNCTION SCOTT.FN_SAL_EMP
( P_EMPNO NUMBER )
RETURN NUMBER
AS
	P_SAL NUMBER(8);
BEGIN
	SELECT SAL INTO P_SAL
	FROM SCOTT.EMP
	WHERE EMPNO = P_EMPNO;
	RETURN P_SAL;
END;



SELECT SCOTT.FN_SAL_EMP (5678) FROM DUAL;
