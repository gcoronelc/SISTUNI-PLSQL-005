CREATE OR REPLACE 
PACKAGE RESERVAS.PKG_RESERVA_CRUD AS 

PROCEDURE INS_MARCA(NOMBRE RESERVAS.PRM_MARCA.C_NOM_MARCA%TYPE, USUARIO RESERVAS.PRM_MARCA.C_COD_USUCREA%TYPE);
PROCEDURE MOD_MARCA(IDENTIFICADOR RESERVAS.PRM_MARCA.N_ID_MARCA%TYPE, NOMBRE RESERVAS.PRM_MARCA.C_NOM_MARCA%TYPE, USUARIO RESERVAS.PRM_MARCA.C_COD_USUCREA%TYPE);
PROCEDURE ANU_MARCA(IDENTIFICADOR RESERVAS.PRM_MARCA.N_ID_MARCA%TYPE, USUARIO RESERVAS.PRM_MARCA.C_COD_USUCREA%TYPE);

PROCEDURE INS_TIPO(NOMBRE RESERVAS.PRM_TIPO.C_NOM_TIPO%TYPE, USUARIO RESERVAS.PRM_TIPO.C_COD_USUCREA%TYPE);
PROCEDURE MOD_TIPO(IDENTIFICADOR RESERVAS.PRM_TIPO.N_ID_TIPO%TYPE, NOMBRE RESERVAS.PRM_TIPO.C_NOM_TIPO%TYPE, USUARIO RESERVAS.PRM_TIPO.C_COD_USUCREA%TYPE);
PROCEDURE ANU_TIPO(IDENTIFICADOR RESERVAS.PRM_TIPO.N_ID_TIPO%TYPE, USUARIO RESERVAS.PRM_TIPO.C_COD_USUCREA%TYPE);

PROCEDURE INS_COLOR(NOMBRE RESERVAS.PRM_COLOR.C_NOM_COLOR%TYPE, USUARIO RESERVAS.PRM_COLOR.C_COD_USUCREA%TYPE);
PROCEDURE MOD_COLOR(IDENTIFICADOR RESERVAS.PRM_COLOR.N_ID_COLOR%TYPE, NOMBRE RESERVAS.PRM_COLOR.C_NOM_COLOR%TYPE, USUARIO RESERVAS.PRM_COLOR.C_COD_USUCREA%TYPE);
PROCEDURE ANU_COLOR(IDENTIFICADOR RESERVAS.PRM_COLOR.N_ID_COLOR%TYPE, USUARIO RESERVAS.PRM_COLOR.C_COD_USUCREA%TYPE);

PROCEDURE INS_TIPODOCUMENTO(NOMBRE RESERVAS.PRM_TIPODOCUMENTO.C_NOM_TIPODOCUMENTO%TYPE, USUARIO RESERVAS.PRM_TIPODOCUMENTO.C_COD_USUCREA%TYPE);
PROCEDURE MOD_TIPODOCUMENTO(IDENTIFICADOR RESERVAS.PRM_TIPODOCUMENTO.N_ID_TIPODOCUMENTO%TYPE, NOMBRE RESERVAS.PRM_TIPODOCUMENTO.C_NOM_TIPODOCUMENTO%TYPE, USUARIO RESERVAS.PRM_TIPODOCUMENTO.C_COD_USUCREA%TYPE);
PROCEDURE ANU_TIPODOCUMENTO(IDENTIFICADOR RESERVAS.PRM_TIPODOCUMENTO.N_ID_TIPODOCUMENTO%TYPE, USUARIO RESERVAS.PRM_TIPODOCUMENTO.C_COD_USUCREA%TYPE);


END PKG_RESERVA_CRUD;