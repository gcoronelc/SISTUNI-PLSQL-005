
--TAREA 01
/* SE REQUIERE UN AFUNCION QUE PERMITA REALIZAR LAS OPERACIONES DE 
	SUMA
	RESTA
	MULTIPLICACIÓN
	DIVSION
*/


CREATE OR REPLACE FUNCTION SCOTT.FN_OPER
(P_N1 IN NUMBER, P_N2 IN NUMBER, P_OP IN VARCHAR2) 
RETURN VARCHAR2
IS
	V_RESULTADO VARCHAR2(50);
BEGIN
	CASE P_OP
		WHEN 'S' THEN
			V_RESULTADO := P_N1 + P_N2;
		WHEN 'R' THEN
			V_RESULTADO := P_N1 - P_N2;		
		WHEN 'M' THEN
			V_RESULTADO := P_N1 * P_N2;
		WHEN 'D' THEN
			V_RESULTADO := P_N1 / P_N2;
		ELSE 
			V_RESULTADO := 'OPCION NO VALIDA';
	END CASE;
	RETURN V_RESULTADO;
END;


SELECT SCOTT.FN_OPER(5,6,'S') FROM DUAL;

