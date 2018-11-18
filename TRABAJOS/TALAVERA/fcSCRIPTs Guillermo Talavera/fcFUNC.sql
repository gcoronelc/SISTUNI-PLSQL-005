CREATE OR REPLACE FUNCTION funCRUDUPDATE(v_obj varchar2, v_nombre varchar2, v_nombre_cambio varchar2)
RETURN varchar2
IS
    result_update varchar2(150) := '';
    cmd varchar2(150) := '';
BEGIN
      IF (v_obj = 'entrenador') THEN
        cmd := 'UPDATE FUTBOLCLUB.' || UPPER(v_obj) || 'ES' || ' SET nombre_entrenador = ' || v_nombre_cambio ||
                    ' WHERE nombre_entrenador = ' || v_nombre || ';COMMIT;';
      ELSIF (v_obj = 'posicion') THEN
        cmd := 'UPDATE FUTBOLCLUB.' || UPPER(v_obj) || ' SET nombre_posicion = ' || v_nombre_cambio ||
                    ' WHERE nombre_entrenador = ' || v_nombre || ';COMMIT;';
      ELSIF (v_obj = 'clubes') THEN
        cmd := 'UPDATE FUTBOLCLUB.' || UPPER(v_obj) || ' SET nomclub = ' || v_nombre_cambio ||
                    ' WHERE nombre_entrenador = ' || v_nombre || ';COMMIT;';
      ELSIF (v_obj = 'puestos') THEN
        cmd := 'UPDATE FUTBOLCLUB.' || UPPER(v_obj) || ' SET nombre_puesto = ' || v_nombre_cambio ||
                    'WHERE nombre_entrenador = ' || v_nombre || ';COMMIT;';
      ELSE
        cmd := 'UPDATE FUTBOLCLUB.JUGADORES' || ' SET nombres_apellidos = ' || v_nombre_cambio ||
                    ' WHERE nombre_entrenador = ' || v_nombre || ';COMMIT;';
      END IF;
    
      result_update := cmd;
    
    RETURN result_update;
END;
/
----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION funCRUDINSERT(v_obj varchar2, v_nombre varchar2)
RETURN varchar2
IS
    containsert number := 0;
    result_insert varchar2(150) := '';
    cmd varchar2(150) := '';
BEGIN
      IF (v_obj = 'entrenador') THEN
        cmd := 'SELECT COUNT(*) INTO ' || containsert || ' FROM FUTBOLCLUB.' || UPPER(v_obj) || 'ES;' ||
                    'INSERT INTO ' || 'FUTBOLCLUB.' || UPPER(v_obj) || 'ES' || ' VALUES (' || TO_CHAR(containsert + 1) || ',' || v_nombre || ');
                    COMMIT;';
      ELSIF (v_obj = 'posicion') THEN
        cmd := 'SELECT COUNT(*) INTO ' || containsert || ' FROM FUTBOLCLUB.' || UPPER(v_obj) || ';' ||
                    'INSERT INTO ' || 'FUTBOLCLUB.' || UPPER(v_obj) || ' VALUES (' || TO_CHAR(containsert + 1) || ',' || v_nombre || ');
                    COMMIT;';
      ELSIF (v_obj = 'clubes') THEN
        cmd := 'SELECT COUNT(*) INTO ' || containsert || ' FROM FUTBOLCLUB.' || UPPER(v_obj) || ';' ||
                    'INSERT INTO ' || 'FUTBOLCLUB.' || UPPER(v_obj) || ' VALUES (' || TO_CHAR(containsert + 1) || ',' || v_nombre || ');
                    COMMIT;';
      ELSIF (v_obj = 'puestos') THEN
        cmd := 'SELECT COUNT(*) INTO ' || containsert || ' FROM FUTBOLCLUB.' || UPPER(v_obj) || ';' ||
                    'INSERT INTO ' || 'FUTBOLCLUB.' || UPPER(v_obj) || ' VALUES (' || TO_CHAR(containsert + 1) || ',' || v_nombre || ');
                    COMMIT;';      
      ELSE
        cmd := 'SELECT COUNT(*) INTO ' || containsert || ' FROM FUTBOLCLUB.' || UPPER(v_obj) || ';' ||
                    'INSERT INTO ' || 'FUTBOLCLUB.' || UPPER(v_obj) || ' VALUES (' || TO_CHAR(containsert + 1) || ',' || v_nombre || ');
                    COMMIT;';      
      END IF;
    
    result_insert := cmd;
    
    RETURN result_insert;
    
END;
/
-----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION funCRUDDELETE(v_obj varchar2, v_nombre varchar2)
RETURN varchar2
IS
    result_delete varchar2(150) := '';
    cmd varchar2(150) := '';
BEGIN
      IF (v_obj = 'entrenador') THEN
        cmd := 'DELETE FROM FUTBOLCLUB.' || UPPER(v_obj) || 'ES ' || 'WHERE nombre_entrenador = ' || v_nombre ||
                    ';COMMIT;';
      ELSIF (v_obj = 'posicion') THEN
        cmd := 'DELETE FROM FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nombre_posicion = ' || v_nombre ||
                    ';COMMIT;';
      ELSIF (v_obj = 'clubes') THEN
        cmd := 'DELETE FROM FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nomclub = ' || v_nombre ||
                    ';COMMIT;';
      ELSIF (v_obj = 'puestos') THEN
        cmd := 'DELETE FROM FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nombre_puestos = ' || v_nombre ||
                    ';COMMIT;';     
      ELSE
        cmd := 'DELETE FROM FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nombres_apellidos = ' || v_nombre ||
                    ';COMMIT;';      
      END IF;
    
    result_delete := cmd;
    
    RETURN result_delete;
    
END;
/
----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION funCRUDFIND(v_obj varchar2, v_nombre varchar2)
RETURN varchar2
IS
    result_find varchar2(150) := '';
    cmd varchar2(150) := '';
BEGIN
      IF (v_obj = 'entrenador') THEN
        cmd := 'SELECT * FUTBOLCLUB.' || UPPER(v_obj) || 'ES ' || 'WHERE nombre_entrenador = ' || v_nombre ||
                    ';';
      ELSIF (v_obj = 'posicion') THEN
        cmd := 'SELECT * FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nombre_posicion = ' || v_nombre ||
                    ';';
      ELSIF (v_obj = 'clubes') THEN
        cmd := 'SELECT * FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nomclub = ' || v_nombre ||
                    ';';
      ELSIF (v_obj = 'puestos') THEN
        cmd := 'SELECT * FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nombre_puestos = ' || v_nombre ||
                    ';';     
      ELSE
        cmd := 'SELECT * FUTBOLCLUB.' || UPPER(v_obj) || ' WHERE nombres_apellidos = ' || v_nombre ||
                    ';';      
      END IF;
    
    result_find := cmd;
    
    RETURN result_find;
    
END;
/




