create or replace procedure pr120 (cod NUMBER , delta NUMBER)
IS
BEGIN
UPDATE EMP
SET SAL = SAL + DELTA
WHERE EMPNO= COD;

IF SQL%NOTFOUND THEN
	dbms_output.put_line(' no existe');
ELSE
	COMMIT; 
	dbms_output.put_line(' proceso ok');
END if; 

END; 
