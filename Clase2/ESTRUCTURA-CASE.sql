-- ==================================
-- ESTRUCTURA CASE
-- ==================================

CREATE OR REPLACE FUNCTION SCOTT.fn_numero
( P_N IN NUMBER ) RETURN VARCHAR2
IS
	V_NUMERO VARCHAR2(20);
BEGIN
	CASE P_N
		WHEN 1 THEN
			V_NUMERO := 'UNO';
		WHEN 2 THEN
			V_NUMERO := 'DOS';
		ELSE
			V_NUMERO := 'NONE';
	END CASE;
	RETURN V_NUMERO;
END;

SELECT SCOTT.FN_NUMERO( 5 ) FROM DUAL;


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





