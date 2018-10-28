
-- =================================
-- BLOQUE ANOMINO
-- =================================
	
	DECLARE
		V_1 NUMBER(5) :=5;
		V_2 NUMBER(5) :=6;
		V_3 NUMBER(5);
	BEGIN
		-- Proceso
		V_3 := V_1 * V_2;
		-- Reporte
		-- para llevar utilizoo dbms
		dbms_output.PUT_LINE('V_1 = ' || V_1);
		dbms_output.PUT_LINE('V_2 = ' || V_2);
		dbms_output.PUT_LINE('V31 = ' || v_3);
	
	END;
	
-- ===============
-- FUNCION
-- =================

CREATE OR REPLACE FUNCTION	SCOTT.FN_SUMAR
( P_N1 NUMBER, P_N2 NUMBER)
RETURN NUMBER
AS
	V_SUMA NUMBER (8);
	
BEGIN
	-- Proceso
	V_SUMA := P_N1 + P_N2;
	-- Valor de retorno
	RETURN V_SUMA;
	
END;
SELECT SCOTT.FN_SUMAR(56,43) FROM DUAL;


-- ===============
-- PROCEDIMIENTO
-- =================

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
	SCOTT.PR_SUMAR(V_N1, V_N, V_SUMA)
	dbms_output.PUT_LINE('SUMA = ' || V_SUMA);
END;

-- Solo en SQL DBX

BEGIN

	SCOTT.PR_SUMAR (78, 34, :p_suma$NUMBER);
END;


-- ===============
-- ASIGNAR VALORES A VARIABLES
-- =================

-- Ejemplo: leer el sueldo de un empleado:

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
	SCOTT.PR_SAL_EMP (7369, :p_sal$NUMBER);
END;

-----------------------------------------------------


-- ===============
-- FUNCION -- FALTA CULMINAR
-- =================

CREATE OR REPLACE FUNCTION	SCOTT.FN_BUSCAR
( P_EMPNO NUMBER)
RETURN NUMBER
AS
	V_BUSQUEDA NUMBER (8);
	
BEGIN
	-- Proceso
	SELECT SAL INTO V_SAL;
	FROM SCOTT.EMP
	-- Valor de retorno
	RETURN V_SUMA;
	
END;
SELECT SCOTT.FN_SUMAR(56,43) FROM DUAL;


--- TAREA 2: DESARROLLAR UN PROCEDIMIENTO QUE RETORNE DE UNA CUENTA SU SALDO Y EL NOMBRE DE LA MONEDA. EUREKA

-- ===============
-- HACER DE LA TAREA 2
-- =================

-- Ejemplo: leer el sueldo de un empleado:

CREATE OR REPLACE PROCEDURE EUREKA.PR_SALDO_MON 
( P_CUENTA IN NUMBER, P_SAL OUT NUMBER, P_MON OUT VARCHAR2)


AS 

BEGIN
	SELECT CUENTA INTO P_CUENTA 
	FROM EUREKA.EMP
	WHERE EMPNO = P_EMPNO;
	
END;

SELECT * FROM SCOTT

SELECT * FROM SCOTT.EMP;

BEGIN
	SCOTT.PR_SAL_EMP (7369, :p_sal$NUMBER);
END;


-- T3: EJERCICIOS 5.1-5.2-5.3

--- 5.1

create or replace function fn102 (n1 number, n2 number, n3 number) return
number
is
mayor number := 0;
begin
if (n1>mayor) then
mayor := n1;
end if;
if (n2>mayor) then
mayor := n2;
end if;
if (n3>mayor) then
mayor := n3;
end if;
return mayor;
end;


---- 5.2

create or replace function fn103 (n1 number, n2 number, n3 number) return
number
is
mayor number;
begin
if (n1>n2) then
mayor := n1;
else
mayor := n2;
end if;
if (n3>mayor) then
mayor := n3;
end if;
return mayor;
end;


----5.3

create or replace function fn104 (p_empno emp.empno%type) return varchar2
is
v_sal emp.sal%type; v_msg varchar2(30);
begin
select sal into v_sal from emp where empno = p_empno;
if (v_sal<2500) then
v_msg := 'Salario Bajo';
elsif (v_sal<4000) then
v_msg := 'Salario Regular';
else
v_msg := 'Salario Bueno';
end if;
v_msg := to_char(v_sal) || ' - ' || v_msg;
return v_msg;
end;











