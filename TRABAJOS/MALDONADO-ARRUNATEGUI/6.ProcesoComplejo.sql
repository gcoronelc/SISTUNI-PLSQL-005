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




