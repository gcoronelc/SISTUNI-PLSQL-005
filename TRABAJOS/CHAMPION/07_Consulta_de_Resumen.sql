SELECT RE.N_ID_RESERVA, di.d_des_dia, cl.c_des_nombres, cl.c_des_appaterno, cl.c_des_apmaterno,
cl.d_fec_nacimiento, AU.N_ID_AUTO, CO.C_NOM_COLOR, MA.C_NOM_MARCA, TI.C_DES_TIPO, au.n_mon_preciodia, re.n_mon_total
FROM RESERVAS.MPR_RESERVA RE
INNER JOIN RESERVAS.MSE_CLIENTE CL ON RE.N_ID_CLIENTE = CL.N_ID_CLIENTE
INNER JOIN RESERVAS.MSE_AUTO AU ON RE.N_ID_AUTO = AU.N_ID_AUTO
INNER JOIN RESERVAS.MSE_RESERVADIA RD ON RE.N_ID_RESERVA = RD.N_ID_RESERVA
INNER JOIN RESERVAS.PRM_DIAS DI ON RD.N_ID_DIAS = DI.N_ID_DIAS
INNER JOIN RESERVAS.PRM_COLOR CO ON AU.N_ID_COLOR = CO.N_ID_COLOR
INNER JOIN RESERVAS.PRM_MARCA MA ON AU.N_ID_MARCA = MA.N_ID_MARCA
INNER JOIN RESERVAS.PRM_TIPO TI ON AU.N_ID_TIPO = TI.N_ID_TIPO