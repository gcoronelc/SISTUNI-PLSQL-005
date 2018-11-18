
CREATE OR REPLACE TRIGGER scott.tr_test_emp
AFTER INSERT OR DELETE OR UPDATE ON scott.emp
FOR EACH ROW
BEGIN
	IF inserting THEN
		dbms_output.PUT_LINE('nuevo empleado se ha insertado');
	ELSIF updating THEN
		dbms_output.PUT_LINE('un empleado se ha modificado');
	ELSIF deleting THEN
		dbms_output.PUT_LINE('un empleado ha sido eliminado');
	END IF;
END tr_test_emp;

INSERT INTO scott.emp(empno, ename, sal)
VALUES(9999,'9999',9999);


ROLLBACK;

