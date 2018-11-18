

--------------------------------------------------------
--  DDL for Table CATALOGO
--------------------------------------------------------
CREATE TABLE CATALOGO
(
TIPO_ITEM VARCHAR2(10),
CODIGO_ITEM VARCHAR2(12),
NOMBRE_ITEM VARCHAR2(150),
UNIDAD_MEDIDA NUMBER(3,0),
PRECIO_UNIT NUMBER(16,6)
);


CREATE TABLE CUSTOMER (  
NAME VARCHAR2(20),   
GENDER VARCHAR2(7),   
ADDRESS VARCHAR2(100)); 

--------------------------------------------------------
--  SP INSERT CATALOGO
--------------------------------------------------------


CREATE OR REPLACE PROCEDURE CN.PR_INSERT_CATALOGO
(
p_tipo CATALOGO.TIPO_ITEM%TYPE,
p_codigo CATALOGO.CODIGO_ITEM%TYPE,
p_precio CATALOGO.PRECIO_UNIT%TYPE,
p_nombre CATALOGO.NOMBRE_ITEM%TYPE,
p_medida CATALOGO.UNIDAD_MEDIDA%TYPE
)
IS
	BEGIN  
	INSERT INTO CATALOGO (TIPO_ITEM, CODIGO_ITEM, NOMBRE_ITEM, UNIDAD_MEDIDA, PRECIO_UNIT)  
				VALUES (p_tipo, p_codigo, p_nombre, p_medida, p_precio);  
	COMMIT;  
END;  
/  



BEGIN
	CN.PR_INSERT_CATALOGO ('2', '1223', 33, 'mss', 13);
END;

SELECT * FROM CN.CATALOGO


--------------------------------------------------------
--  SP UPDATE CATALOGO
--------------------------------------------------------


CREATE OR REPLACE PROCEDURE CN.PR_UPDATE_CATALOGO
(
p_tipo IN CATALOGO.TIPO_ITEM%TYPE,
p_codigo IN CATALOGO.CODIGO_ITEM%TYPE,
p_precio IN CATALOGO.PRECIO_UNIT%TYPE,
p_nombre IN CATALOGO.NOMBRE_ITEM%TYPE,
p_medida IN CATALOGO.UNIDAD_MEDIDA%TYPE
)
IS
BEGIN  
	UPDATE 	CATALOGO  SET
		TIPO_ITEM=p_tipo, 
		CODIGO_ITEM=p_codigo, 
		NOMBRE_ITEM=p_nombre, 
		UNIDAD_MEDIDA=p_medida, 
		PRECIO_UNIT=p_precio
	WHERE CATALOGO.TIPO_ITEM=p_tipo;
COMMIT;  
END;  
/  


BEGIN
	CN.PR_UPDATE_CATALOGO2 ('1', '234', 15, 'LOPEZ', 54);
END;


SELECT * FROM CN.CATALOGO


--------------------------------------------------------
--  SP SELECT CATALOGO
--------------------------------------------------------


CREATE OR REPLACE PROCEDURE CN.PR_SELECT_CATALOGO
(
p_tipo IN CATALOGO.TIPO_ITEM%TYPE,
P_catalogo OUT SYS_REFCURSOR )
	IS
	BEGIN  
	OPEN 
		P_catalogo FOR SELECT CATALOGO.TIPO_ITEM, CATALOGO.CODIGO_ITEM, CATALOGO.NOMBRE_ITEM, CATALOGO.UNIDAD_MEDIDA, CATALOGO.PRECIO_UNIT 
			FROM CATALOGO WHERE CATALOGO.TIPO_ITEM=p_tipo;
END;  
/  



BEGIN
	CN.PR_SELECT_CATALOGO ('1', :p_catalogo$REFCURSOR);
END;


SELECT * FROM CN.CATALOGO


--------------------------------------------------------
--  SP DELETE CATALOGO
--------------------------------------------------------


CREATE OR REPLACE PROCEDURE CN.PR_DELETE_CATALOGO
(P_TIPO CATALOGO.TIPO_ITEM%TYPE) AS
      INVALID_TIPO EXCEPTION;
BEGIN
      DELETE FROM CATALOGO
      WHERE TIPO_ITEM=P_TIPO;
      IF SQL%NOTFOUND OR SQL%ROWCOUNT=0 THEN
            ROLLBACK;
            RAISE INVALID_TIPO;
      END IF;
      COMMIT;
EXCEPTION
      WHEN INVALID_TIPO THEN
            RAISE_APPLICATION_ERROR(-20001, 'EL CATALOGO NO EXISTE');
      WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20011, SQLERRM);
END;


BEGIN
	CN.PR_DELETE_CATALOGO ('1');
END;
SELECT * FROM CN.CATALOGO




CREATE OR REPLACE PROCEDURE CN.PR_CATALOGO_DETALLES
(
p_tipo CATALOGO.TIPO_ITEM%TYPE,
p_codigo OUT CATALOGO.CODIGO_ITEM%TYPE,
p_precio OUT CATALOGO.PRECIO_UNIT%TYPE,
p_nombre OUT CATALOGO.NOMBRE_ITEM%TYPE,
p_medida OUT CATALOGO.UNIDAD_MEDIDA%TYPE)

AS
BEGIN
      SELECT CATALOGO.CODIGO_ITEM,CATALOGO.PRECIO_UNIT,CATALOGO.NOMBRE_ITEM,CATALOGO.UNIDAD_MEDIDA
      INTO p_codigo,p_precio,p_nombre,p_medida
      FROM CATALOGO
      WHERE TIPO_ITEM = p_tipo;
EXCEPTION
      WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'CATALOGO NO ENCONTRADO');
      WHEN TOO_MANY_ROWS THEN
             RAISE_APPLICATION_ERROR(-20002, 'EXISTEN EL CATALOGO CON EL MISMO NOMBRE');
      WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20003, SQLERRM); 
END;
/

BEGIN
	CN.PR_CATALOGO_DETALLES ('2', :p_codigo$VARCHAR2, :p_precio$NUMBER, :p_nombre$VARCHAR2, :p_medida$NUMBER);
END;

SELECT * FROM CN.CATALOGO


-- Resumen de Datos: Resumen de presupuesto programado en el cuadro de necesidades
-- vs su Techo Presupyestal, por Centro de Costo y su saldo.
-----------------------------------------------------------------------------------
create or replace PROCEDURE sp_ResumenCN 
(p_ano_prog cn.detalle_cn.ano_prog%TYPE, C_1 OUT sys_refcursor )
IS

BEGIN 

    OPEN C_1 FOR
        SELECT dcn.ano_prog, dcn.centro_costo,cc.nombre, SUM ( precio_unit*cant_total)MtoProg ,
        tpp.mnto_ppto, (tpp.mnto_ppto - SUM(precio_unit*cant_total)) Saldo
        FROM cn.detalle_cn dcn INNER JOIN cn.centro_costo cc ON
        dcn.centro_costo=cc.centro_costo 
        LEFT JOIN cn.techo_pptal tpp ON
        dcn.ano_prog= tpp.ano_prog AND dcn.centro_costo = tpp.centro_costo
        WHERE dcn.ano_prog=p_ano_prog
        GROUP BY dcn.ano_prog, dcn.centro_costo, cc.nombre,tpp.mnto_ppto;
   
    --DBMS_OUTPUT.PUT_LINE ('Año Programación:' || r.ano);

END;

--Ejecutar el procedimiento almacenado

Var c refcursor
EXECUTE sp_ResumenCN (2019, :c)
print c 



CREATE OR REPLACE PROCEDURE cn.SP_ActualizaProg_en_Techo
(p_ano_prog cn.detalle_cn.ano_prog%TYPE)
IS
    cc varchar2(15);
    MtoProg numeric (14,2);
    ano number(4,0);
    CURSOR c_2 IS
        SELECT ano_prog, CENTRO_COSTO, SUM ( precio_unit*cant_total) Monto
        FROM CN.DETALLE_CN dcn
        WHERE dcn.ano_prog=p_ano_prog --AND dcn.centro_costo= i.centro_costo 
        GROUP BY ano_prog, centro_costo;
     
BEGIN

      FOR r in c_2 LOOP
        UPDATE CN.TECHO_PPTAL 
        SET MNTO_PROG = r.Monto
        WHERE CN.TECHO_PPTAL.ano_prog=r.ano_prog AND 
        CN.TECHO_PPTAL.centro_costo= r.centro_costo; 
      END LOOP;

END;

/* Ejecutar el procedimiento almacenado */
EXECUTE cn.SP_ActualizaProg_en_Techo (2019)

SELECT * FROM CN.TECHO_PPTAL



CREATE OR REPLACE PACKAGE cn.Leer_Cadena
IS
TYPE T_ARRAY_STRING IS TABLE OF VARCHAR2(1000)INDEX BY BINARY_INTEGER;
FUNCTION SPLIT(P_DATA VARCHAR2, P_DELIMITADOR VARCHAR2 ) RETURN T_ARRAY_STRING;
END;


CREATE OR REPLACE PACKAGE BODY cn.Leer_Cadena
IS

FUNCTION SPLIT(P_DATA VARCHAR2, P_DELIMITADOR VARCHAR2 ) RETURN T_ARRAY_STRING
IS
    I        NUMBER   := 0;
    POS      NUMBER   := 0;
    V_DATA   CLOB     := P_DATA;
    STRINGS  T_ARRAY_STRING;
BEGIN
  V_DATA := TRIM( V_DATA );
  POS := INSTR( V_DATA, P_DELIMITADOR, 1, 1 );
  WHILE ( POS != 0) LOOP
      I := I + 1;
      STRINGS(i) := SUBSTR( V_DATA, 1, POS - 1 );
      V_DATA :=  SUBSTR( V_DATA, POS + 1, LENGTH(V_DATA) );
      pos := instr(V_DATA, P_DELIMITADOR, 1, 1);
      IF POS = 0 THEN
          STRINGS( I + 1 ) := V_DATA;
      END IF;    
  END LOOP;
  IF I = 0 AND LENGTH( V_DATA ) > 0 THEN
    STRINGS( I + 1 ) := V_DATA;
  END IF;
  RETURN strings;
END SPLIT;

END;




CREATE OR REPLACE PROCEDURE CN.pr_Inserta_Nuevos_Registros
(p_datos IN VARCHAR2, P_ESTADO OUT VARCHAR)
IS
V_REGISTROS     cn.Leer_Cadena.T_ARRAY_STRING;
V_CAMPOS        cn.Leer_Cadena.T_ARRAY_STRING;

BEGIN
     V_REGISTROS := CN.Leer_Cadena.SPLIT(P_DATOS,'¬');
     
     FOR I in 1 .. V_REGISTROS.COUNT LOOP 
		
        V_CAMPOS := CN.Leer_cadena.SPLIT(V_REGISTROS(I),'|');
        
        INSERT INTO CN.DETALLE_CN(ANO_PROG,CENTRO_COSTO, TIPO_ITEM, CODIGO_ITEM,UNIDAD_MEDIDA,PRECIO_UNIT, CANT_TOTAL) 
        VALUES(TO_NUMBER(V_CAMPOS(1)), V_CAMPOS(2), V_CAMPOS (3), V_CAMPOS (4), TO_NUMBER(V_CAMPOS(5)), TO_NUMBER(V_CAMPOS(6)), TO_NUMBER (V_CAMPOS (7)) );
                    
    END LOOP;    
    COMMIT;
    P_ESTADO := 'OK';
EXCEPTION
    WHEN OTHERS THEN
        P_ESTADO := SQLERRM;
        ROLLBACK;
END;

/* EJECUTAR PROCEDIMIENTO ALMACENADO*/

DECLARE 
V_ESTADO VARCHAR2(300);
BEGIN
    CN.PR_INSERTA_NUEVOS_REGISTROS ('2019|01.12.05|B|497000029999|112|750|1¬2019|1.7.3.2|B|497000029999|112|250|1¬2019|1.1.2|B|497000029999|112|50|1', V_ESTADO);
    DBMS_OUTPUT.PUT_LINE( V_ESTADO );
END;


SELECT * FROM CN.DETALLE_CN
WHERE CODIGO_ITEM= '497000029999';


