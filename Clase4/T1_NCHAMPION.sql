
CREATE OR REPLACE TRIGGER TR_TEST_RMP
AFTER INSERT OR DELETE OR UPDATE ON SCOTT.EMP
BEGIN
	IF INSERTING THEN
		DBMS_OUTPUT.PUT_LINE ('NUEVO EMPLEADO SE HA INSERTADO');
	ELSIF UPDATING THEN
		DBMS_OUTPUT.PUT_LINE ('UN EMPLEADO SE HA MODIFICADO');
	ELSIF DELETING THEN
		DBMS_OUTPUT.PUT_LINE ('UN EMPLEADO SE HA ELIMINADO');	
	END IF;
END TR_TEST_RMP;
	


SELECT * FROM SCOTT.EMP WHERE EMPNO = 7777;



SET SERVEROUTPUT ON;

UPDATE SCOTT.EMP SET ENAME = 'PEDRO1' WHERE EMPNO = 7777;
