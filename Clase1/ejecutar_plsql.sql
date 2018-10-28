-- ===================================
-- BLOQUE ANONIMO
-- ===================================

DECLARE
	V_1 NUMBER(5) := 5;
	V_2 NUMBER(5) := 6;
	V_3 NUMBER(5);
BEGIN
	-- Proceso
	V_3 := V_1 * V_2;
	-- Reporte
	dbms_output.PUT_LINE('V_1 = ' || v_1);
	dbms_output.PUT_LINE('V_2 = ' || v_2);
	dbms_output.PUT_LINE('V_3 = ' || v_3);
END;


-- ===================================
-- FUNCION
-- ===================================

CREATE OR REPLACE FUNCTION SCOTT.FN_SUMAR
( P_N1 NUMBER, P_N2 NUMBER )
RETURN NUMBER 
AS
	V_SUMA NUMBER(8);
BEGIN
	-- Proceso
	V_SUMA := P_N1 + P_N2;
	-- Valor de Retorno
	RETURN V_SUMA;
END;

SELECT SCOTT.FN_SUMAR(56,43) FROM DUAL;




-- ===================================
-- PROCEDIMIENTO
-- ===================================

CREATE OR REPLACE PROCEDURE SCOTT.PR_SUMAR
(P_N1 IN NUMBER, P_N2 IN NUMBER, P_SUMA OUT NUMBER)
AS
BEGIN
	P_SUMA := P_N1 + P_N2;
END;

DECLARE
	V_N1 NUMBER := 54;
	V_N2 NUMBER := 66;
	V_SUMA NUMBER;
BEGIN
	SCOTT.PR_SUMAR(V_N1, V_N2, V_SUMA);
	DBMS_OUTPUT.PUT_LINE('SUMA: ' || V_SUMA);
END;


-- Solo en SQL DBX
BEGIN
	SCOTT.PR_SUMAR (78, 34, :p_suma$NUMBER);
END;




-- ===================================
-- ASIGNAR VALORES A VARIABLES
-- ===================================

-- Ejemplo: Leer el sueldo de un empleado

CREATE OR REPLACE PROCEDURE SCOTT.PR_SAL_EMP
( P_EMPNO IN NUMBER, P_SAL OUT NUMBER)
AS
BEGIN
	SELECT SAL INTO P_SAL
	FROM SCOTT.EMP
	WHERE EMPNO = P_EMPNO;
END;

SELECT * FROM SCOTT

SELECT * FROM SCOTT.EMP;

BEGIN
	SCOTT.PR_SAL_EMP (55555, :p_sal$NUMBER);
END;


-- T1: Función para consultar el salario de un empleado.

-- T2: Desarrollar un procedimiento que retorne de una cuenta
--     su saldo y el nombre de la moneda. EUREKA.

-- T3: Ejercicios 5.1, 5.2 y 5.3






















