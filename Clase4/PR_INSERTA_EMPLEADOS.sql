/*
    P_DATOS   :  Datos de los empleados
                 Filas separadas por ¬
                 Campos separados por |
    p_ESTADO  :  Resultado del proceso
                 OK: Proceso ejecutado correctamente
                 OTRO VALOR: Mensaje de error
    Capos     :  CODIGO|NOMBRE|SUELDO
*/
CREATE OR REPLACE PROCEDURE SCOTT.PR_INSERTA_EMPLEADOS
( P_DATOS IN VARCHAR2, P_ESTADO OUT VARCHAR2 )
AS
    V_REGISTROS SCOTT.PKG_EGCC_UTIL.T_ARRAY_STRING;
	V_CAMPOS    SCOTT.PKG_EGCC_UTIL.T_ARRAY_STRING;

BEGIN
    V_REGISTROS := SCOTT.PKG_EGCC_UTIL.SPLIT(P_DATOS,'¬');
    FOR I in 1 .. V_REGISTROS.COUNT LOOP 
		
        V_CAMPOS := SCOTT.PKG_EGCC_UTIL.SPLIT(V_REGISTROS(I),'|');
        
        INSERT INTO EMP(EMPNO, ENAME, SAL) 
        VALUES(TO_NUMBER(V_CAMPOS(1)), V_CAMPOS(2), TO_NUMBER(V_CAMPOS(3)) );
        
	END LOOP;    
    COMMIT;
    P_ESTADO := 'OK';
EXCEPTION
    WHEN OTHERS THEN
        P_ESTADO := SQLERRM;
        ROLLBACK;
END;
/


DECLARE 
    V_ESTADO VARCHAR2(300);
BEGIN
	SCOTT.PR_INSERTA_EMPLEADOS ('6777|PEDRO|5789¬7778|JUAN|6578¬6779|MARIA|9999¬6780|KARLA|4587', V_ESTADO);
    DBMS_OUTPUT.PUT_LINE( V_ESTADO );
END;

SELECT * FROM SCOTT.EMP;



