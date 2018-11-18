CREATE OR REPLACE PROCEDURE RESERVAS.PR_INS_RESERVA_COMPLEJO 
(
  CLIENTE IN RESERVAS.MSE_CLIENTE.N_ID_CLIENTE%TYPE,
  AUTO1 IN RESERVAS.MSE_AUTO.N_ID_AUTO%TYPE,
  OBSERVACION IN RESERVAS.MPR_RESERVA.C_DES_OBSERVACION%TYPE,
  FECHA1 IN DATE,
  FECHA2 IN DATE,
  USUARIO IN RESERVAS.MPR_RESERVA.C_COD_USUCREA%TYPE,
  RESULTADO OUT VARCHAR2
) AS 
  NUM_DIAS_HABILES NUMBER;
  MONTO_DIA FLOAT;
  IDENTIFICADOR_RE NUMBER;
BEGIN

  SELECT COUNT(*) INTO NUM_DIAS_HABILES
  FROM RESERVAS.PRM_DIAS
  WHERE D_DES_DIA >= FECHA1 AND D_DES_DIA <= FECHA2 AND N_IND_LABORABLE = 1;
  
  SELECT N_MON_PRECIODIA INTO MONTO_DIA
  FROM RESERVAS.MSE_AUTO WHERE N_ID_AUTO = AUTO1;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RESULTADO := 'NO SE ENCONTRO MONTO PARA EL AUTO';
  
  SELECT RESERVAS.SEQ_ID_RESERVA.nextVal INTO IDENTIFICADOR_RE
  FROM DUAL;
  
  INSERT INTO RESERVAS.MPR_RESERVA (    N_ID_RESERVA,    N_ID_CLIENTE,    N_ID_AUTO,  N_MON_TOTAL,
    C_DES_OBSERVACION,    N_IND_ESTADO,    D_FEC_CREA,    C_COD_USUCREA
  )
  VALUES(IDENTIFICADOR_RE, CLIENTE, AUTO1, MONTO_DIA*NUM_DIAS_HABILES,
    OBSERVACION,  0, SYSDATE,  USUARIO 
  );
  
  INSERT INTO RESERVAS.MSE_RESERVADIA  (    N_ID_RESERVADIA,   N_ID_RESERVA,    N_ID_DIAS,
  N_IND_ESTADO,    D_FEC_CREA,    C_COD_USUCREA  )
  SELECT RESERVAS.SEQ_ID_RESERVADIA.nextVal, IDENTIFICADOR_RE, N_ID_DIAS,
  0, SYSDATE,  USUARIO
  FROM RESERVAS.PRM_DIAS
  WHERE D_DES_DIA >= FECHA1 AND D_DES_DIA <= FECHA2 AND N_IND_LABORABLE = 1;

 RESULTADO := 'CORRECTO';
 
END PR_INS_RESERVA_COMPLEJO;