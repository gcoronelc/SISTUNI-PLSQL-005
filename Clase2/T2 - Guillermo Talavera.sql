CREATE OR REPLACE FUNCTION SCOTT.fn_106
( v_empno emp.empno%type ) RETURN VARCHAR2
IS
	v_msg VARCHAR2(40);
	v_sal emp.sal%TYPE;
BEGIN
	SELECT sal INTO v_sal FROM scott.emp WHERE empno = v_empno;
	CASE
		WHEN (v_sal > 0 AND v_Sal <= 2500) THEN
			v_msg := 'Salario Bajo';
		WHEN (v_sal > 2500 AND v_Sal <= 4000) THEN
			v_msg := 'Salario Regular';
		WHEN (v_sal > 4000) THEN
			v_msg := 'Salario Bueno';
		ELSE
			v_msg := 'Caso Desconocido';
	END CASE;
	v_msg := TO_CHAR(v_sal) || ' - ' || v_msg;
	RETURN v_msg;
END;




SELECT SCOTT.fn_106(7782) FROM DUAL;





















CREATE OR REPLACE FUNCTION SCOTT.fn_operacion
( P_N1 IN NUMBER, P_N2 IN NUMBER, P_OP IN CHAR ) RETURN VARCHAR2
IS

	V_RESULTADO VARCHAR(50);
	
BEGIN
	CASE P_OP
		WHEN '+' THEN 
			V_RESULTADO := TO_CHAR(P_N1 + P_N2);
			
		WHEN '-' THEN
			V_RESULTADO := TO_CHAR(P_N1 - P_N2);
			
		WHEN '*' THEN
			V_RESULTADO := TO_CHAR(P_N1 * P_N2);
			
		WHEN '/' THEN
			V_RESULTADO := TO_CHAR(P_N1 / P_N2);
			
		ELSE
			V_RESULTADO := 'NONE';
			
	END CASE;
	
	RETURN V_RESULTADO;
END;


SELECT SCOTT.fn_operacion(5, 3, '-') FROM DUAL;



--- ======================================================
--- Tarea 1
--- ======================================================
/*
Se requiere una funcion que permita operar dos numeros.
La operacion puede ser suma, resta, multiplicacion y division
*/


 

CREATE OR REPLACE FUNCTION SCOTT.fn_operacion
( P_N1 IN NUMBER, P_N2 IN NUMBER, P_OP IN CHAR ) RETURN NUMBER
IS;
	V_N NUMBER := 
	
BEGIN
	CASE P_OP
		WHEN '+' THEN 
			V_NUMERO := 'UNO';
			
		WHEN '-' THEN
			V_NUMERO := 'DOS';
		WHEN '*' THEN
			V_NUMERO := 'DOS';
		WHEN '/' THEN
			V_NUMERO := 'DOS';
		ELSE
			V_NUMERO := 'NONE';
	END CASE;
	
	RETURN V_NUMERO;
END;


SELECT SCOTT.fn_operacion(5, 3, '+') FROM DUAL;