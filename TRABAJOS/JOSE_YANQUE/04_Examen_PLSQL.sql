
CREATE OR REPLACE PACKAGE PKG_CRUD 
IS
PROCEDURE SP_CREAR(id_emp number, nombre varchar2, apellido varchar2,
correo varchar2, telefono varchar2, fec_ingreso date, cargo varchar2,
salario employees.salary%type, comision employees.commission_pct%type,
id_jefe number, id_dept number);
PROCEDURE SP_MODIFICAR(correo varchar2, telefono varchar2,
fec_ingreso date, comision employees.commission_pct%type, id_emp number);
PROCEDURE SP_ELIMINAR(id_emp number);
PROCEDURE SP_CONSULTA(cargo varchar2);
END PKG_CRUD;
/


CREATE OR REPLACE PACKAGE BODY PKG_CRUD 
IS
  PROCEDURE SP_CREAR(id_emp number, nombre varchar2, apellido varchar2,
  correo varchar2, telefono varchar2, fec_ingreso date, cargo varchar2,
  salario employees.salary%type, comision employees.commission_pct%type,
  id_jefe number, id_dept number)
  is
  begin
	insert into employees
	values(id_emp, nombre, apellido, correo, telefono, fec_ingreso,
	cargo, salario, comision, id_jefe, id_dept);
	DBMS_OUTPUT.PUT_LINE('Se agrego empleado');
  END SP_CREAR;

  PROCEDURE SP_MODIFICAR(correo varchar2, telefono varchar2,
  fec_ingreso date, comision employees.commission_pct%type, id_emp number)
  is
  begin
	update employees 
	set email = correo, phone_number = telefono, hire_date =fec_ingreso,
	commission_pct = comision
	where employee_id = id_emp;
	commit;
	DBMS_OUTPUT.PUT_LINE('Se actualizó empleado');
	exception
	when others then
	rollback;
	DBMS_OUTPUT.PUT_LINE('No se actualizó');
  END SP_MODIFICAR;

  PROCEDURE SP_ELIMINAR(id_emp number)
  is
	cont number;
  begin
	select count(*) into cont from employees where employee_id=id_emp;
	if cont = 0 then
	DBMS_OUTPUT.PUT_LINE('empleado No existe');
	return;
	end if;
	select count(*) into cont from employees where employee_id=id_emp;
	if cont > 0 then
	DBMS_OUTPUT.PUT_LINE('No puede ser eliminado');
	return;
	end if;
	delete from employees
	where employee_id = id_emp;
	commit;
	DBMS_OUTPUT.PUT_LINE('Empleado Eliminado');
  END SP_ELIMINAR;

  PROCEDURE SP_CONSULTA(cargo varchar2)
  is
	id_emp number;
	nombre varchar2(20);
	apellido varchar2(25);
	correo varchar2(30);
	telefono varchar2(10);
  begin
	select employee_id, first_name, last_name, email, phone_number
	into id_emp, nombre, apellido, correo, telefono 
	from employees where job_id=cargo;
	DBMS_OUTPUT.PUT_LINE('Codigo: ' || id_emp);
	DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre);
	DBMS_OUTPUT.PUT_LINE('Apellido: ' || apellido);
	DBMS_OUTPUT.PUT_LINE('Correo: ' || correo);
	DBMS_OUTPUT.PUT_LINE('Telefono: ' || telefono);
  END SP_CONSULTA;
END PKG_CRUD;


--===========================================
INSERTAR
exec PKG_CRUD.SP_CREAR(210,'Carlos', 'Medina','cmedina@gmail.com','987156432',to_date('15/10/05','dd/mm/yy'),'IT_PROG',4500.00,null ,103,60);
exec PKG_CRUD.SP_CREAR(211,'Fernando', 'Rodriguez','frodrigueza@gmail.com','01-3457823',to_date('05/06/01','dd/mm/yy'),'SA_REP',4000.00,.2,149,80);

BEGIN
PKG_CRUD.SP_CREAR(211,'Fernando', 'Rodriguez','frodrigueza@gmail.com','01-3457823',to_date('05/06/01','dd/mm/yy'),'SA_REP',4000.00,.2,149,80);
END;

select * from employees where employee_id=210
select * from employees where employee_id=211

ACTUALIZAR
exec PKG_CRUD.SP_MODIFICAR('frodriguez@hotmail.com','923745612',to_date('10/07/01','dd/mm/yy'),.25,211)

select * from employees where employee_id=211

ELIMINAR
exec PKG_CRUD.SP_ELIMINAR(400);
exec PKG_CRUD.SP_ELIMINAR(201);
exec PKG_CRUD.SP_ELIMINAR(150);

BEGIN
PKG_CRUD.SP_ELIMINAR(300);
END;

select * from employees where employee_id=201

CONSULTA
exec PKG_CRUD.SP_CONSULTA('IT_PROG')


--PROCESO SIMPLE
--=============
Modificar el porcentaje de comisión de los representantes de ventas, cuya comision
sean menores o iguales al 10% y su sueldo sean menores a 6500.

Verificar:
SQL> select * from employees where commission_pct <=.1;


CREATE OR REPLACE PROCEDURE SP_VENTAS(comision number)
IS
BEGIN
	UPDATE employees		
	SET commission_pct = comision
	where commission_pct <=.1
	and salary <= 6500;
	DBMS_OUTPUT.PUT_LINE('Se actualizó porcentaje de comisión');
END;
/

exec sp_ventas(.15);

SQL> select * from employees where commission_pct <=.1;
SQL> select * from employees where commission_pct =.15;


--CONSULTA DE RESUMEN DE DATOS
--============================
Mostrar el còdigo, nombre, apellido, cargo, departamento, ubicaciòn ,pais y region del empleado
creado

Select e.employee_id, e.first_name, e.last_name, e.job_id, d.department_name, l.location_id,
c.country_name, r.region_name
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id =l.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id
where employee_id=210;


Mostrar el còdigo, nombre, apellido, cargo, numero de departamento y el identificador de ubicaciòn
de todos los empleados cuya ubicaciòn de departamento sea 1400

select employee_id, first_name, last_name, job_id, department_id
from employees
where department_id in ( select department_id from departments where location_id = 1400);


--PROCESO COMPLEJO
--================
Cambiar al empleado Carlos Medina al nuevo departamento de IT Helpdesk
Crear el cargo IT_HD si no está creado y actualizar la ubicación, país y la regíon
según la ubicación del departamento IT


SQL> select * from employees where department_id=230;
SQL> select * from jobs where job_it='IT_HD';
SQL> select * from departments where department_id=60;


CREATE OR REPLACE PROCEDURE SP_EMP(id_emp number, id_dept number)
IS
	cont number;
BEGIN
	Select 	count(*) into cont from jobs where job_id= 'IT_HD';
	if(cont=0) then
		insert into jobs
		values('IT_HD','IT HELP DESK',4000, 6000);
	return;
	end if;
	
	UPDATE employees 
	SET  job_id='IT_HD', department_id=id_dept
	where employee_id=id_emp;
	commit;
	UPDATE departments 
	SET location_id = ( Select location_id
			    from departments
			    where department_id=60)
	where department_id=id_dept;
	commit;

END;
/


SQL> exec sp_emp(210,230);


Select e.department_id, l.location_id, c.country_id, r.region_id
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id =l.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id
where employee_id=210;


SQL> select * from employees where employee_id=210;
SQL> select * from departments where department_id=230;
SQL> select * from jobs where job_it='IT_HD';
