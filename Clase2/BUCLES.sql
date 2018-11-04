-- =================================
-- BUCLE: LOOP
-- =================================

-- Tarea 3
/*
  Hacer un procedimiento que permita
  mostrar un mensaje "N" Veces.
  Utilizar LOOP - END LOOP
*/



-- =================================
-- BUCLE: WHILE
-- =================================

-- Tarea 4
/*
Hacer una función para calcular el MCD de dos números.
*/

CREATE OR REPLACE FUNCTION fn_mcd
(p_n1 in NUMBER, p_n2 in NUMBER)
RETURN NUMBER
IS
  v_n1 NUMBER := p_n1;
  v_n2 NUMBER := p_n2;
BEGIN
	WHILE(v_n1 != v_n2) LOOP
		IF v_n1 > v_n2 THEN
			v_n1 := v_n1 - v_n2;
		ELSE
			v_n2 := v_n2 - v_n1;
		END IF;
	END LOOP;
	RETURN v_n1;
END;


SELECT fn_mcd(15,20) FROM DUAL;


-- =================================
-- BUCLE: FOR
-- =================================

CREATE OR REPLACE PROCEDURE PR_DEMO_FOR
AS
BEGIN
	FOR N IN 1 .. 5 LOOP
		DBMS_OUTPUT.PUT_LINE( N || '.- HOLA PL/SQL');
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('==========================');
	FOR N IN REVERSE 1 .. 5 LOOP
		DBMS_OUTPUT.PUT_LINE(N || '.- HOLA PL/SQL');
	END LOOP;
END;


CALL PR_DEMO_FOR();


CREATE OR REPLACE PROCEDURE PR_DEMO_FOR
AS
  N NUMBER := 100;
BEGIN
	DBMS_OUTPUT.PUT_LINE('N = ' || N);
	FOR N IN 1 .. 5 LOOP
		DBMS_OUTPUT.PUT_LINE( N || '.- HOLA PL/SQL ' || PR_DEMO_FOR.N);
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('N = ' || N);
	DBMS_OUTPUT.PUT_LINE('==========================');
	DBMS_OUTPUT.PUT_LINE('N = ' || N);
	FOR N IN REVERSE 1 .. 5 LOOP
		DBMS_OUTPUT.PUT_LINE(N || '.- HOLA PL/SQL');
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('N = ' || N);
END;

CALL PR_DEMO_FOR();

