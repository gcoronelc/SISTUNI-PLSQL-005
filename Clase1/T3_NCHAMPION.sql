-- ================================
-- EJERCICIOS 5.1 , 5.2 Y 5.3
-- ================================


-- ================================
-- 5.1
-- ================================
CREATE OR REPLACE FUNCTION SCOTT.FN102
(N1 NUMBER, N2 NUMBER, N3 NUMBER)
RETURN NUMBER
IS
	MAYOR NUMBER :=0;
BEGIN

	IF(N1>MAYOR) THEN
		MAYOR := N1;
	END IF;

	IF(N2>MAYOR) THEN
		MAYOR := N2;
	END IF;

	IF(N3>MAYOR) THEN
		MAYOR := N3;
	END IF;
	RETURN MAYOR;
END;



SELECT SCOTT.FN102 (12, 45, 4) FROM DUAL;



-- ================================
-- 5.2
-- ================================
CREATE OR REPLACE FUNCTION SCOTT.FN103
(N1 NUMBER, N2 NUMBER, N3 NUMBER)
RETURN NUMBER
IS
	MAYOR NUMBER;
BEGIN

	IF(N1>N2) THEN
		MAYOR := N1;
	ELSE
		MAYOR := N2;
	END IF;

	IF(N3>MAYOR) THEN
		MAYOR := N3;
	END IF;

	RETURN MAYOR;
END;



SELECT SCOTT.FN103 (-4, -8, -23) FROM DUAL;





-- ================================
-- 5.3
-- ================================
CREATE OR REPLACE FUNCTION SCOTT.FN104
(P_EMPNO EMP.EMPNO%TYPE)
RETURN VARCHAR2
IS
	V_SAL EMP.SAL%TYPE; V_MSG VARCHAR2(30);
BEGIN

   SELECT SAL INTO V_SAL FROM EMP WHERE EMPNO = P_EMPNO;
   IF(V_SAL<2500) THEN
   	V_MSG := 'Salario Bajo';
   ELSIF (V_SAL<4000) THEN
    V_MSG := 'Salario Regular';
   ELSE
   	V_MSG := 'Salario Bueno';
   END IF;
   V_MSG := TO_CHAR(V_SAL) || ' - ' || V_MSG;

	RETURN V_MSG;
END;




SELECT SCOTT.FN104 (7369) FROM DUAL;