CREATE OR REPLACE PROCEDURE SCOTT.PR114
IS    
	CURSOR C_DEMO IS SELECT * FROM DEPT;
	R DEPT%ROWTYPE;
BEGIN
	OPEN C_DEMO;
  	FETCH C_DEMO INTO R;	  
  	CLOSE C_DEMO;
  	DBMS_OUTPUT.PUT_LINE('DEPTNO: ' || R.DEPTNO);
  	DBMS_OUTPUT.PUT_LINE('DNAME: ' || R.DNAME);
  	DBMS_OUTPUT.PUT_LINE('LOC: ' || R.LOC);
END;


BEGIN
	SCOTT.PR114;
END;