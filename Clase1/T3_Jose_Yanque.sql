-- EJERCICIO 5.1




SELECT SCOTT.FN102 (4, 5, 3) FROM DUAL;

create or replace function scott.fn102 
(n1 number, n2 number, n3 number) return
number
is
	mayor number := 0;
begin
	if (n1>mayor) then
		mayor := n1;
	end if;
	if (n2>mayor) then
		mayor := n2;
	end if;
	if (n3>mayor) then
		mayor := n3;
	end if;
	return mayor;
end;

SELECT SCOTT.FN102 (-7, -4, -5) FROM DUAL;



EJERCICIO 5.2

create or replace function scott.fn103 
(n1 number, n2 number, n3 NUMBER, n4 number) 
RETURN number
is
	mayor number;
begin
	if (n1>n2) then
		mayor := n1;
	else
		mayor := n2;
	end if;
	if (n3>mayor) then
		mayor := n3;
	end if;
	if (n4>mayor) then
		mayor := n4;
	end if;
	return mayor;
end;


SELECT SCOTT.FN103 (-7, -5, -8, -4) FROM DUAL;


EJERCICIO 5.3

create or replace function 
fn104 (p_empno emp.empno%type) 
return varchar2
is
	v_sal emp.sal%type; 
	v_msg varchar2(30);
begin
	select sal into v_sal from emp where empno = p_empno;
	if (v_sal<2500) then
		v_msg := 'Salario Bajo';
	elsif (v_sal<4000) then
		v_msg := 'Salario Regular';
	else
		v_msg := 'Salario Bueno';
	end if;
	v_msg := to_char(v_sal) || ' - ' || v_msg;
	return v_msg;
end;

SELECT SCOTT.FN104 (7369) FROM DUAL;