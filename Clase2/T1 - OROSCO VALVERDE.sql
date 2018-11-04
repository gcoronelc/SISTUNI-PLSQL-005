-- =========================================
-- Tarea 1
-- =========================================
/*
Se requiere una función que permita operar
dos números.

Las operacion puede ser: 
	- SUMA
	- RESTA
	- MULTIPLICACION
	- DIVISION
*/

CREATE OR REPLACE FUNCTION SCOTT.fn_operar
( P_N1 IN NUMBER, P_N2 IN NUMBER, P_N3 IN VARCHAR2 ) RETURN VARCHAR2
IS
	V_RESULTADO VARCHAR2(20);
BEGIN
	CASE P_N3
		WHEN 'S' THEN
			V_RESULTADO := P_N1 + P_N2;
		WHEN 'R' THEN
			V_RESULTADO := P_N1 - P_N2;
		WHEN 'M' THEN
			V_RESULTADO := P_N1 * P_N2;
		WHEN 'D' THEN
			V_RESULTADO := P_N1 / P_N2;
		ELSE
			V_RESULTADO := 'NONE';
	END CASE;
	RETURN 	V_RESULTADO;
END;

SELECT SCOTT.fn_operar( 5,6,'M' ) FROM DUAL;