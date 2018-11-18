
CREATE OR REPLACE PROCEDURE prCRUD 
(sentencia VARCHAR2, obj VARCHAR2, nombre VARCHAR2, apellido VARCHAR2, nombre_cambio VARCHAR2, apellido_cambio VARCHAR2)
IS

resultCRUD VARCHAR2(150);
conta NUMBER;
nombreentrenador VARCHAR2(150);
nombreentrenador_cambio VARCHAR2(150);
nombreposicion VARCHAR2(150);
nombreposicion_cambio VARCHAR2(150);
nomclub VARCHAR2(150);
nomclub_cambio VARCHAR2(150);
nombrepuesto VARCHAR2(150);
nombrepuesto_cambio VARCHAR2(150);
nombresapellidos VARCHAR2(150);
nombresapellidos_cambio VARCHAR2(150);   
nombres  VARCHAR2(150); 
nombres_cambio  VARCHAR2(150); 
apellidos VARCHAR2(150);
apellidos_cambio VARCHAR2(150);

    
BEGIN
        CASE sentencia
            WHEN 'actualizar' THEN
                   IF (obj = 'entrenador') THEN
                        nombreentrenador := nombre || ' ' || apellido;
                        nombreentrenador_cambio := nombre_cambio || ' ' || apellido_cambio;
                        resultCRUD := funCRUDUPDATE(obj, nombreentrenador, nombreentrenador_cambio);
                        DBMS_OUTPUT.PUT_LINE('Registro de entrenador ACTUALIZADO para ' || resultCRUD);
                   ELSIF (obj = 'posicion') THEN
                        nombreposicion := nombre;
                        nombreposicion_cambio := nombre_cambio;
                        resultCRUD := funCRUDUPDATE(obj, nombreposicion, nombreposicion_cambio);
                        DBMS_OUTPUT.PUT_LINE('Registro de posicion ACTUALIZADO para ' || resultCRUD);
                   ELSIF (obj = 'clubes') THEN
                        nomclub := nombre;
                        nomclub_cambio := nombre_cambio;
                        resultCRUD := funCRUDUPDATE(obj, nomclub, nomclub_cambio);
                        DBMS_OUTPUT.PUT_LINE('Registro de clubes ACTUALIZADO para ' || resultCRUD);
                   ELSIF (obj = 'puestos') THEN
                        nombrepuesto := nombre;
                        nombrepuesto_cambio := nombre_cambio;
                        resultCRUD := funCRUDUPDATE(obj, nombrepuesto, nombrepuesto_cambio);
                        DBMS_OUTPUT.PUT_LINE('Registro de puestos ACTUALIZADO para ' || resultCRUD);
                   ELSE
                        nombresapellidos := nombres || ' ' || apellidos;
                        nombresapellidos_cambio := nombres_cambio || ' ' || apellidos_cambio;
                        resultCRUD := funCRUDUPDATE(obj, nombresapellidos, nombresapellidos_cambio);
                        DBMS_OUTPUT.PUT_LINE('Registro de puestos ACTUALIZADO para ' || resultCRUD);
           END IF;
                      
              WHEN 'insertar' THEN
          IF (obj = 'entrenador') THEN
                        nombreentrenador := nombre || ' ' || apellido;
                        resultCRUD := funCRUDINSERT(obj, nombreentrenador);
                        DBMS_OUTPUT.PUT_LINE('Registro de entrenador INSERTADO para ' || resultCRUD);
                   ELSIF (obj = 'posicion') THEN
                        nombreposicion := nombre;
                        resultCRUD := funCRUDINSERT(obj, nombreposicion);
                        DBMS_OUTPUT.PUT_LINE('Registro de posicion INSERTADO para ' || resultCRUD);
                   ELSIF (obj = 'clubes') THEN
                        nomclub := nombre;
                        resultCRUD := funCRUDINSERT(obj, nomclub);
                        DBMS_OUTPUT.PUT_LINE('Registro de club INSERTADO para ' || resultCRUD);
                   ELSIF (obj = 'puestos') THEN
                        nombrepuesto := nombre;
                        resultCRUD := funCRUDINSERT(obj, nombrepuesto);
                        DBMS_OUTPUT.PUT_LINE('Registro de puesto INSERTADO para ' || resultCRUD);
                   ELSE
                        nombresapellidos := nombres || ' ' || apellidos;
                        resultCRUD := funCRUDINSERT(obj, nombresapellidos);
                        DBMS_OUTPUT.PUT_LINE('Registro de jugador INSERTADO para ' || resultCRUD);
                   END IF;
                      
          WHEN 'eliminar' THEN
            IF (obj = 'entrenador') THEN
                        nombreentrenador := nombre || ' ' || apellido;
                        resultCRUD := funCRUDDELETE(obj, nombreentrenador);
                        DBMS_OUTPUT.PUT_LINE('Registro de entrenador ELIMINADO para ' || resultCRUD);
                   ELSIF (obj = 'posicion') THEN
                        nombreposicion := nombre;
                        resultCRUD := funCRUDDELETE(obj, nombreposicion);
                        DBMS_OUTPUT.PUT_LINE('Registro de posicion ELIMINADO para ' || resultCRUD);
                   ELSIF (obj = 'clubes') THEN
                        nomclub := nombre;
                        resultCRUD := funCRUDDELETE(obj, nomclub);
                       DBMS_OUTPUT.PUT_LINE('Registro de club ELIMINADO para ' || resultCRUD);
                   ELSIF (obj = 'puestos') THEN
                       nombrepuesto := nombre;
                       resultCRUD := funCRUDDELETE(obj, nombrepuesto);
                       DBMS_OUTPUT.PUT_LINE('Registro de puesto ELIMINADO para ' || resultCRUD);
                   ELSE
                        nombresapellidos := nombres || ' ' || apellidos;
                        resultCRUD := funCRUDDELETE(obj, nombresapellidos);
                        DBMS_OUTPUT.PUT_LINE('Registro de jugador ELIMINADO para ' || resultCRUD);
                   END IF;
          
          WHEN 'buscar' THEN
            IF (obj = 'entrenador') THEN
                        nombreentrenador := nombre || ' ' || apellido;
                        resultCRUD := funCRUDFIND(obj, nombreentrenador);
                        DBMS_OUTPUT.PUT_LINE('Registro de entrenador CONSULTADO para ' || resultCRUD);
                   ELSIF (obj = 'posicion') THEN
                        nombreposicion := nombre;
                        resultCRUD := funCRUDFIND(obj, nombreposicion);
                        DBMS_OUTPUT.PUT_LINE('Registro de posicion CONSULTADO para ' || resultCRUD);
                   ELSIF (obj = 'clubes') THEN
                        nomclub := nombre;
                        resultCRUD := funCRUDFIND(obj, nomclub);
                        DBMS_OUTPUT.PUT_LINE('Registro de club CONSULTADO para ' || resultCRUD);
                   ELSIF (obj = 'puestos') THEN
                        nombrepuesto := nombre;
                        resultCRUD := funCRUDFIND(obj, nombrepuesto);
                        DBMS_OUTPUT.PUT_LINE('Registro de puesto CONSULTADO para ' || resultCRUD);
                   ELSE
                        nombresapellidos := nombres || ' ' || apellidos;
                        resultCRUD := funCRUDFIND(obj, nombresapellidos);
                        DBMS_OUTPUT.PUT_LINE('Registro de jugador CONSULTADO para ' || resultCRUD);
                   END IF;      
        END CASE;
END;
/



