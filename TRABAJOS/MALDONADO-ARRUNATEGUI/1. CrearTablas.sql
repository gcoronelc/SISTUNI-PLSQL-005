--------------------------------------------------------
--  DDL for Table CATALOGO
--------------------------------------------------------
  CREATE TABLE "CN"."CATALOGO" 
   ("TIPO_ITEM" VARCHAR2(1 BYTE), 
	"CODIGO_ITEM" VARCHAR2(12 BYTE), 
	"NOMBRE_ITEM" VARCHAR2(150 BYTE), 
	"UNIDAD_MEDIDA" NUMBER(3,0),
    "PRECIO_UNIT" NUMBER(16,6) 
   ) ;
  
--------------------------------------------------------
--  DDL for Table CENTRO_COSTO
--------------------------------------------------------
  
   CREATE TABLE "CN"."CENTRO_COSTO" 
   ("CENTRO_COSTO" VARCHAR2(15 BYTE), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"NRO_PERSONAL" NUMBER(4,0)
   ) ;
  
  --------------------------------------------------------
--  DDL for Table CUADRO_NECESIDADES
--------------------------------------------------------

  CREATE TABLE "CN"."CUADRO_NECESIDADES" 
   ("ANO_PROG" NUMBER(4,0), 
	"CENTRO_COSTO" VARCHAR2(15 BYTE), 
	"MONTO_PROG" NUMBER(14,2)
   ) ;
   
    
  --------------------------------------------------------
--  DDL for Table DETALLE_CN
--------------------------------------------------------

CREATE TABLE "CN"."DETALLE_CN" 
   ("ANO_PROG" NUMBER(4,0), 
	"CENTRO_COSTO" VARCHAR2(15 BYTE), 
	"TIPO_ITEM" VARCHAR2(1 BYTE), 
	"CODIGO_ITEM" VARCHAR2(12 BYTE), 
	"UNIDAD_MEDIDA" NUMBER(3,0), 
    "PRECIO_UNIT" NUMBER(16,6) ,
	"CANT_TOTAL" NUMBER(14,2)
   ) ;
  
  
    --------------------------------------------------------
--  DDL for Table TECHO_PPTAL
--------------------------------------------------------
  
  
CREATE TABLE "CN"."TECHO_PPTAL" 
   ("ANO_PROG" NUMBER(4,0), 
	"CENTRO_COSTO" VARCHAR2(15 BYTE), 
    "MNTO_PPTO" NUMBER(14,2),
    "MNTO_PROG" NUMBER(14,2)
   ) ;