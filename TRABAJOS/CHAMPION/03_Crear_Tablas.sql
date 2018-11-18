
CREATE TABLE reservas.mpr_reserva (
    n_id_reserva        NUMBER NOT NULL,
    n_id_cliente        NUMBER NOT NULL,
    n_id_auto           NUMBER NOT NULL,
    n_mon_total         FLOAT,
    c_des_observacion   VARCHAR2(1000),
    n_ind_estado        NUMBER,
    d_fec_crea          DATE,
    c_cod_usucrea       VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.mpr_reserva IS
    'Tabla que almacena el listado de reservas';

COMMENT ON COLUMN reservas.mpr_reserva.n_id_reserva IS
    'Identificador de la reserva';

COMMENT ON COLUMN reservas.mpr_reserva.n_id_cliente IS
    'Identificador del cliente';

COMMENT ON COLUMN reservas.mpr_reserva.n_id_auto IS
    'Identificador del auto';

COMMENT ON COLUMN reservas.mpr_reserva.n_mon_total IS
    'Monto total de reserva';

COMMENT ON COLUMN reservas.mpr_reserva.c_des_observacion IS
    'Descripción de la observación';

COMMENT ON COLUMN reservas.mpr_reserva.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.mpr_reserva ADD CONSTRAINT mpr_reserva_pk PRIMARY KEY ( n_id_reserva );

CREATE TABLE reservas.mse_auto (
    n_id_auto         NUMBER NOT NULL,
    n_id_marca        NUMBER(*, 0) NOT NULL,
    n_id_tipo         NUMBER(*, 0) NOT NULL,
    n_id_color        NUMBER(*, 0) NOT NULL,
    n_num_asientos    NUMBER,
    n_mon_preciodia   FLOAT,
    c_des_placa       VARCHAR2(10),
    n_ind_estado      VARCHAR2(10),
    d_fec_crea        DATE,
    c_cod_usucrea     VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.mse_auto IS
    'Tabla que almacena el listado de autos';

COMMENT ON COLUMN reservas.mse_auto.n_id_auto IS
    'Identificador del auto';

COMMENT ON COLUMN reservas.mse_auto.n_id_marca IS
    'Identificador de la marca';

COMMENT ON COLUMN reservas.mse_auto.n_id_tipo IS
    'Identificador del tipo';

COMMENT ON COLUMN reservas.mse_auto.n_id_color IS
    'Identificador del color';

COMMENT ON COLUMN reservas.mse_auto.n_num_asientos IS
    'Número de asientos';

COMMENT ON COLUMN reservas.mse_auto.n_mon_preciodia IS
    'Monto del precio del auto por dia';

COMMENT ON COLUMN reservas.mse_auto.c_des_placa IS
    'Descripción de la placa';

COMMENT ON COLUMN reservas.mse_auto.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.mse_auto ADD CONSTRAINT pk_mse_auto PRIMARY KEY ( n_id_auto );

CREATE TABLE reservas.mse_cliente (
    n_id_cliente         NUMBER NOT NULL,
    c_des_nombres        VARCHAR2(50),
    c_des_appaterno      VARCHAR2(50),
    c_des_apmaterno      VARCHAR2(50),
    n_id_tipodocumento   NUMBER NOT NULL,
    c_des_documento      VARCHAR2(20),
    d_fec_nacimiento     DATE,
    n_ind_estado         NUMBER,
    d_fec_crea           DATE,
    c_cod_usucrea        VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.mse_cliente IS
    'Tabla que almacena los clientes';

COMMENT ON COLUMN reservas.mse_cliente.n_id_cliente IS
    'Identificador de la tabla';

COMMENT ON COLUMN reservas.mse_cliente.c_des_nombres IS
    'Nombre del cliente';

COMMENT ON COLUMN reservas.mse_cliente.c_des_appaterno IS
    'Apellido paterno del cliente';

COMMENT ON COLUMN reservas.mse_cliente.c_des_apmaterno IS
    'Apellido materno del cliente';

COMMENT ON COLUMN reservas.mse_cliente.n_id_tipodocumento IS
    'Identificador del tipo de documento';

COMMENT ON COLUMN reservas.mse_cliente.c_des_documento IS
    'Número de documento de identidad';

COMMENT ON COLUMN reservas.mse_cliente.d_fec_nacimiento IS
    'Fecha de nacimiento';

COMMENT ON COLUMN reservas.mse_cliente.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.mse_cliente ADD CONSTRAINT mse_cliente_pk PRIMARY KEY ( n_id_cliente );

CREATE TABLE reservas.mse_reservadia (
    n_id_reservadia   NUMBER NOT NULL,
    n_id_reserva      NUMBER NOT NULL,
    n_id_dias         NUMBER(*, 0) NOT NULL,
    n_ind_estado      NUMBER,
    d_fec_crea        DATE,
    c_cod_usucrea     VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.mse_reservadia IS
    'Tabla que almacena los dias por cada reserva';

COMMENT ON COLUMN reservas.mse_reservadia.n_id_reservadia IS
    'Identificador de la tabla';

COMMENT ON COLUMN reservas.mse_reservadia.n_id_reserva IS
    'Identificador de la tabla de reservas';

COMMENT ON COLUMN reservas.mse_reservadia.n_id_dias IS
    'Identificador de la tabla de días';

COMMENT ON COLUMN reservas.mse_reservadia.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.mse_reservadia ADD CONSTRAINT mse_reservadia_pk PRIMARY KEY ( n_id_reservadia );

CREATE TABLE reservas.prm_color (
    n_id_color      NUMBER(*, 0) NOT NULL,
    c_nom_color     VARCHAR2(100),
    n_ind_estado    NUMBER,
    d_fec_crea      DATE,
    c_cod_usucrea   VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.prm_color IS
    'Tabla que almacena el listado de colores';

COMMENT ON COLUMN reservas.prm_color.n_id_color IS
    'Identificador del color';

COMMENT ON COLUMN reservas.prm_color.c_nom_color IS
    'Nombre del color';

COMMENT ON COLUMN reservas.prm_color.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.prm_color ADD CONSTRAINT pk_prm_color PRIMARY KEY ( n_id_color );

CREATE TABLE reservas.prm_dias (
    n_id_dias           NUMBER(*, 0) NOT NULL,
    d_des_dia           DATE,
    n_ind_laborable     NUMBER,
    c_des_nolaborable   VARCHAR2(100),
    d_fec_crea          DATE,
    c_cod_usucrea       VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.prm_dias IS
    'Tabla que almacena los días';

COMMENT ON COLUMN reservas.prm_dias.n_id_dias IS
    'Identificador del día';

COMMENT ON COLUMN reservas.prm_dias.d_des_dia IS
    'Descripción del día';

COMMENT ON COLUMN reservas.prm_dias.n_ind_laborable IS
    'Indicador de dia laborable : 0=laborable, 1=no laborable';

COMMENT ON COLUMN reservas.prm_dias.c_des_nolaborable IS
    'Descripción del dia no laborable';

ALTER TABLE reservas.prm_dias ADD CONSTRAINT prm_dias_pk PRIMARY KEY ( n_id_dias );

CREATE TABLE reservas.prm_marca (
    n_id_marca      NUMBER(*, 0) NOT NULL,
    c_nom_marca     VARCHAR2(100),
    n_ind_estado    NUMBER,
    d_fec_crea      DATE,
    c_cod_usucrea   VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.prm_marca IS
    'Tabla que almacena las marcas de los autos';

COMMENT ON COLUMN reservas.prm_marca.n_id_marca IS
    'Identificador de la marca';

COMMENT ON COLUMN reservas.prm_marca.c_nom_marca IS
    'Nombre de la marca';

COMMENT ON COLUMN reservas.prm_marca.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.prm_marca ADD CONSTRAINT pk_prm_marca PRIMARY KEY ( n_id_marca );

CREATE TABLE reservas.prm_tipo (
    n_id_tipo       NUMBER(*, 0) NOT NULL,
    c_nom_tipo      VARCHAR2(100),
    c_des_tipo      VARCHAR2(1000),
    n_ind_estado    NUMBER,
    d_fec_crea      DATE,
    c_cod_usucrea   VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.prm_tipo IS
    'Tabla que almacena el tipo economico del auto';

COMMENT ON COLUMN reservas.prm_tipo.n_id_tipo IS
    'Identificador del tipo';

COMMENT ON COLUMN reservas.prm_tipo.c_nom_tipo IS
    'Nombre del tipo';

COMMENT ON COLUMN reservas.prm_tipo.c_des_tipo IS
    'Nombre del tipo';

COMMENT ON COLUMN reservas.prm_tipo.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.prm_tipo ADD CONSTRAINT pk_prm_tipo PRIMARY KEY ( n_id_tipo );

CREATE TABLE reservas.prm_tipodocumento (
    n_id_tipodocumento    NUMBER NOT NULL,
    c_nom_tipodocumento   VARCHAR2(100),
    n_ind_estado          NUMBER,
    d_fec_crea            DATE,
    c_cod_usucrea         VARCHAR2(50 BYTE)
)
;

COMMENT ON TABLE reservas.prm_tipodocumento IS
    'Tabla que almacena los tipos de documento';

COMMENT ON COLUMN reservas.prm_tipodocumento.n_id_tipodocumento IS
    'Identificador del tipo de documento';

COMMENT ON COLUMN reservas.prm_tipodocumento.c_nom_tipodocumento IS
    'Nombre del tipo de documento';

COMMENT ON COLUMN reservas.prm_tipodocumento.n_ind_estado IS
    'Estado : 0=vigente, 1=no_vigente';

ALTER TABLE reservas.prm_tipodocumento ADD CONSTRAINT prm_tipodocumento_pk PRIMARY KEY ( n_id_tipodocumento );

ALTER TABLE reservas.mpr_reserva
    ADD CONSTRAINT mpr_reserva_mse_auto_fk FOREIGN KEY ( n_id_auto )
        REFERENCES reservas.mse_auto ( n_id_auto )
    NOT DEFERRABLE;

ALTER TABLE reservas.mpr_reserva
    ADD CONSTRAINT mpr_reserva_mse_cliente_fk FOREIGN KEY ( n_id_cliente )
        REFERENCES reservas.mse_cliente ( n_id_cliente )
    NOT DEFERRABLE;

ALTER TABLE reservas.mpr_reserva
    ADD CONSTRAINT mpr_reserva_mse_reservadia_fk FOREIGN KEY ( n_id_reservadia )
        REFERENCES reservas.mse_reservadia ( n_id_reservadia )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_auto
    ADD CONSTRAINT mse_auto_prm_color_fk FOREIGN KEY ( n_id_color )
        REFERENCES reservas.prm_color ( n_id_color )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_auto
    ADD CONSTRAINT mse_auto_prm_marca_fk FOREIGN KEY ( n_id_marca )
        REFERENCES reservas.prm_marca ( n_id_marca )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_auto
    ADD CONSTRAINT mse_auto_prm_tipo_fk FOREIGN KEY ( n_id_tipo )
        REFERENCES reservas.prm_tipo ( n_id_tipo )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE reservas.mse_cliente
    ADD CONSTRAINT mse_cliente_prm_tipodocumento_fk FOREIGN KEY ( n_id_tipodocumento )
        REFERENCES reservas.prm_tipodocumento ( n_id_tipodocumento )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_reservadia
    ADD CONSTRAINT mse_reservadia_mpr_reserva_fk FOREIGN KEY ( n_id_reserva )
        REFERENCES reservas.mpr_reserva ( n_id_reserva )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_reservadia
    ADD CONSTRAINT mse_reservadia_prm_dias_fk FOREIGN KEY ( n_id_dias )
        REFERENCES reservas.prm_dias ( n_id_dias )
    NOT DEFERRABLE;

ALTER TABLE reservas.mpr_reserva
    ADD CONSTRAINT mpr_reserva_mse_auto_fk FOREIGN KEY ( n_id_auto )
        REFERENCES reservas.mse_auto ( n_id_auto )
    NOT DEFERRABLE;

ALTER TABLE reservas.mpr_reserva
    ADD CONSTRAINT mpr_reserva_mse_cliente_fk FOREIGN KEY ( n_id_cliente )
        REFERENCES reservas.mse_cliente ( n_id_cliente )
    NOT DEFERRABLE;

ALTER TABLE reservas.mpr_reserva
    ADD CONSTRAINT mpr_reserva_mse_reservadia_fk FOREIGN KEY ( n_id_reservadia )
        REFERENCES reservas.mse_reservadia ( n_id_reservadia )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_auto
    ADD CONSTRAINT mse_auto_prm_color_fk FOREIGN KEY ( n_id_color )
        REFERENCES reservas.prm_color ( n_id_color )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_auto
    ADD CONSTRAINT mse_auto_prm_marca_fk FOREIGN KEY ( n_id_marca )
        REFERENCES reservas.prm_marca ( n_id_marca )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_auto
    ADD CONSTRAINT mse_auto_prm_tipo_fk FOREIGN KEY ( n_id_tipo )
        REFERENCES reservas.prm_tipo ( n_id_tipo )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE reservas.mse_cliente
    ADD CONSTRAINT mse_cliente_prm_tipodocumento_fk FOREIGN KEY ( n_id_tipodocumento )
        REFERENCES reservas.prm_tipodocumento ( n_id_tipodocumento )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_reservadia
    ADD CONSTRAINT mse_reservadia_mpr_reserva_fk FOREIGN KEY ( n_id_reserva )
        REFERENCES reservas.mpr_reserva ( n_id_reserva )
    NOT DEFERRABLE;

ALTER TABLE reservas.mse_reservadia
    ADD CONSTRAINT mse_reservadia_prm_dias_fk FOREIGN KEY ( n_id_dias )
        REFERENCES reservas.prm_dias ( n_id_dias )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
