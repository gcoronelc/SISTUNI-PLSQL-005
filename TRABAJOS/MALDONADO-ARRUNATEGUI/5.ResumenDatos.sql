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
