CREATE OR REPLACE PROCEDURE SCOTT.PR108
(
	COD DEPT.DEPTNO%TYPE, 
	P_EMPS OUT NUMBER, 
	P_PLANILLA OUT NUMBER
)
IS
BEGIN

	SELECT COUNT(*), SUM(SAL) INTO P_EMPS, P_PLANILLA
	FROM EMP
	WHERE DEPTNO = COD;
	
END;

DECLARE 
	EMPS NUMBER := 80;
	PLANILLA NUMBER := 100000;
BEGIN
	SCOTT.PR108 (30, EMPS, PLANILLA);
	
	DBMS_OUTPUT.PUT_LINE('EMPS: ' || EMPS);
	DBMS_OUTPUT.PUT_LINE('PLANILLA: ' || PLANILLA);
END;
