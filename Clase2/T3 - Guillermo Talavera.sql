-- Tarea 3
/*
Hacer un procedimiento que permita mostrar un mensaje n veces. Utilizar LOOP - END LOOP
*/



CREATE OR REPLACE PROCEDURE SCOTT.prMensaje
(proc_mensaje VARCHAR2, proc_repeticiones NUMBER)
IS
	proc_contador NUMBER:= 0;
BEGIN	
	
	LOOP 
		DBMS_OUTPUT.PUT_LINE(proc_mensaje);
		proc_contador := proc_contador + 1;
		EXIT WHEN (proc_contador >= proc_repeticiones);
	END LOOP;
END;


COMMIT;




CREATE OR REPLACE PROCEDURE SCOTT.prMensaje
(proc_mensaje VARCHAR2, proc_repeticiones NUMBER)
IS
	proc_contador NUMBER:= 0;
BEGIN	
	
	LOOP 
		DBMS_OUTPUT.PUT_LINE(proc_mensaje);
		proc_contador := proc_contador + 1;
		EXIT WHEN (proc_contador >= proc_repeticiones);
	END LOOP;
END;


BEGIN
	SCOTT.PRMENSAJE ('Hola', -5);
END;
