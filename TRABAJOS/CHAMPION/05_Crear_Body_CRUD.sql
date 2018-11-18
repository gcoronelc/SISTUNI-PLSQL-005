create or replace
PACKAGE BODY                   PKG_RESERVA_CRUD AS

  PROCEDURE INS_MARCA(NOMBRE RESERVAS.PRM_MARCA.C_NOM_MARCA%TYPE, USUARIO RESERVAS.PRM_MARCA.C_COD_USUCREA%TYPE) AS
  BEGIN
    INSERT INTO RESERVAS.PRM_MARCA ( N_ID_MARCA, C_NOM_MARCA, N_IND_ESTADO, D_FEC_CREA, C_COD_USUCREA)
    VALUES (RESERVAS.SEQ_ID_MARCA.nextVal, NOMBRE, 0, SYSDATE, USUARIO );
  END INS_MARCA;

  PROCEDURE MOD_MARCA(IDENTIFICADOR RESERVAS.PRM_MARCA.N_ID_MARCA%TYPE, NOMBRE RESERVAS.PRM_MARCA.C_NOM_MARCA%TYPE, USUARIO RESERVAS.PRM_MARCA.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_MARCA
    SET C_NOM_MARCA = NOMBRE, C_COD_USUCREA = USUARIO
    WHERE N_ID_MARCA = IDENTIFICADOR;
  END MOD_MARCA;

  PROCEDURE ANU_MARCA(IDENTIFICADOR RESERVAS.PRM_MARCA.N_ID_MARCA%TYPE, USUARIO RESERVAS.PRM_MARCA.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_MARCA
    SET n_ind_estado = 1 , C_COD_USUCREA = USUARIO
    WHERE N_ID_MARCA = IDENTIFICADOR;
  END ANU_MARCA;

  PROCEDURE INS_TIPO(NOMBRE RESERVAS.PRM_TIPO.C_NOM_TIPO%TYPE, USUARIO RESERVAS.PRM_TIPO.C_COD_USUCREA%TYPE) AS
  BEGIN
    INSERT INTO RESERVAS.PRM_TIPO ( N_ID_TIPO, C_NOM_TIPO, N_IND_ESTADO, D_FEC_CREA, C_COD_USUCREA)
    VALUES (RESERVAS.SEQ_ID_TIPO.nextVal, NOMBRE, 0, SYSDATE, USUARIO );
  END INS_TIPO;

  PROCEDURE MOD_TIPO(IDENTIFICADOR RESERVAS.PRM_TIPO.N_ID_TIPO%TYPE, NOMBRE RESERVAS.PRM_TIPO.C_NOM_TIPO%TYPE, USUARIO RESERVAS.PRM_TIPO.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_TIPO
    SET C_NOM_TIPO = NOMBRE, C_COD_USUCREA = USUARIO
    WHERE N_ID_TIPO = IDENTIFICADOR;
  END MOD_TIPO;

  PROCEDURE ANU_TIPO(IDENTIFICADOR RESERVAS.PRM_TIPO.N_ID_TIPO%TYPE, USUARIO RESERVAS.PRM_TIPO.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_TIPO
    SET n_ind_estado = 1 , C_COD_USUCREA = USUARIO
    WHERE N_ID_TIPO = IDENTIFICADOR;
  END ANU_TIPO;

  PROCEDURE INS_COLOR(NOMBRE RESERVAS.PRM_COLOR.C_NOM_COLOR%TYPE, USUARIO RESERVAS.PRM_COLOR.C_COD_USUCREA%TYPE) AS
  BEGIN
    INSERT INTO RESERVAS.PRM_COLOR ( N_ID_COLOR, c_nom_color, N_IND_ESTADO, D_FEC_CREA, C_COD_USUCREA)
    VALUES (RESERVAS.SEQ_ID_COLOR.nextVal, NOMBRE, 0, SYSDATE, USUARIO );
  END INS_COLOR;

  PROCEDURE MOD_COLOR(IDENTIFICADOR RESERVAS.PRM_COLOR.N_ID_COLOR%TYPE, NOMBRE RESERVAS.PRM_COLOR.C_NOM_COLOR%TYPE, USUARIO RESERVAS.PRM_COLOR.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_COLOR
    SET C_NOM_COLOR = NOMBRE, C_COD_USUCREA = USUARIO
    WHERE N_ID_COLOR = IDENTIFICADOR;
  END MOD_COLOR;

  PROCEDURE ANU_COLOR(IDENTIFICADOR RESERVAS.PRM_COLOR.N_ID_COLOR%TYPE, USUARIO RESERVAS.PRM_COLOR.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_COLOR
    SET n_ind_estado = 1 , C_COD_USUCREA = USUARIO
    WHERE N_ID_COLOR = IDENTIFICADOR;
  END ANU_COLOR;

  PROCEDURE INS_TIPODOCUMENTO(NOMBRE RESERVAS.PRM_TIPODOCUMENTO.C_NOM_TIPODOCUMENTO%TYPE, USUARIO RESERVAS.PRM_TIPODOCUMENTO.C_COD_USUCREA%TYPE) AS
  BEGIN
    INSERT INTO RESERVAS.PRM_TIPODOCUMENTO ( N_ID_TIPODOCUMENTO, C_NOM_TIPODOCUMENTO, N_IND_ESTADO, D_FEC_CREA, C_COD_USUCREA)
    VALUES (RESERVAS.SEQ_ID_TIPODOCUMENTO.nextVal, NOMBRE, 0, SYSDATE, USUARIO );
  END INS_TIPODOCUMENTO;

  PROCEDURE MOD_TIPODOCUMENTO(IDENTIFICADOR RESERVAS.PRM_TIPODOCUMENTO.N_ID_TIPODOCUMENTO%TYPE, NOMBRE RESERVAS.PRM_TIPODOCUMENTO.C_NOM_TIPODOCUMENTO%TYPE, USUARIO RESERVAS.PRM_TIPODOCUMENTO.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_TIPODOCUMENTO
    SET C_NOM_TIPODOCUMENTO = NOMBRE, C_COD_USUCREA = USUARIO
    WHERE N_ID_TIPODOCUMENTO = IDENTIFICADOR;
  END MOD_TIPODOCUMENTO;

  PROCEDURE ANU_TIPODOCUMENTO(IDENTIFICADOR RESERVAS.PRM_TIPODOCUMENTO.N_ID_TIPODOCUMENTO%TYPE, USUARIO RESERVAS.PRM_TIPODOCUMENTO.C_COD_USUCREA%TYPE) AS
  BEGIN
    UPDATE RESERVAS.PRM_TIPODOCUMENTO
    SET n_ind_estado = 1 , C_COD_USUCREA = USUARIO
    WHERE N_ID_TIPODOCUMENTO = IDENTIFICADOR;
  END ANU_TIPODOCUMENTO;

END PKG_RESERVA_CRUD;