CREATE OR REPLACE PROCEDURE scott.pr_114
IS
	CURSOR c_demo IS SELECT * FROM DEPT;
	r DEPT%ROWTYPE;
BEGIN
	OPEN c_demo;
	FETCH c_demo INTO r;
	CLOSE c_demo;
	dbms_output.PUT_LINE('deptno: ' || r.deptno);
	dbms_output.PUT_LINE('dname: ' || r.dname);
	dbms_output.PUT_LINE('loc: ' || r.loc);	
END;


BEGIN
	SCOTT.PR_114 ();
END;
