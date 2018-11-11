----------------------------------------------------
-- Autor:   Eric Gustavo Coronel Castillo
-- Blog:    gcoronelc.blogspot.com
-- Email:   gcoronelc@gmail.com
-- Youtube: https://goo.gl/9GFBaC
----------------------------------------------------

create or replace procedure eureka.usp_egcc_clientes2
( 
	p_nombre  IN VARCHAR2,
	p_paterno IN VARCHAR2,
	p_materno IN VARCHAR2,
	p_cursor  OUT NOCOPY SYS_REFCURSOR 
)
as 
 	v_nombre  VARCHAR2(100);
	v_paterno VARCHAR2(100);
	v_materno VARCHAR2(100);
	V_CONTROL NUMBER(5);
BEGIN

	v_nombre  := '%' || upper(p_nombre)  || '%';
	v_paterno := '%' || upper(p_paterno) || '%';
	v_materno := '%' || upper(p_materno) || '%';

	IF p_nombre IS NULL AND P_PATERNO IS NULL AND P_MATERNO IS NULL THEN
		V_CONTROL := 1;
	END IF;

  open p_cursor for 
    select 
    	chr_cliecodigo, vch_cliepaterno, vch_cliematerno, 
      vch_clienombre, chr_cliedni, vch_clieciudad, 
      vch_cliedireccion, vch_clietelefono, vch_clieemail
    from eureka.cliente
    where NVL(vch_clienombre,'XYZ-123') like v_nombre
    AND   NVL(vch_cliepaterno,'XYZ-123') like v_paterno
    AND   NVL(vch_cliematerno,'XYZ-123') like v_materno
    AND   ROWNUM <= CASE WHEN V_CONTROL = 1 THEN 5 ELSE ROWNUM END;
    
end;
/



BEGIN
	EUREKA.USP_EGCC_CLIENTES2 (NULL, NULL, NULL, :p_cursor$REFCURSOR);
END;

BEGIN
	EUREKA.USP_EGCC_CLIENTES2 (NULL, NULL, NULL, :p_cursor$REFCURSOR);
END;




declare
  v_cursor SYS_REFCURSOR;
  v_rec cliente%RowType;
begin
  eureka.usp_egcc_clientes( '%', v_cursor );
  loop
    fetch v_cursor into v_rec;
    exit when v_cursor%NOTFOUND;
    dbms_output.put_line(v_rec.chr_cliecodigo || ' | ' || v_rec.vch_cliepaterno
      || ' | ' || v_rec.vch_cliematerno || ' | ' || v_rec.vch_clienombre );
  end loop;
  close v_cursor;
end;
/

