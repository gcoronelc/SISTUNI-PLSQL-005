-- ============================================
-- Funcion que retorna una resultado
-- ============================================

Create Type scott.mytype As Object(
  field1 Number,
  field2 Varchar2(50)
);

Create Type mytypelist As Table Of mytype;

Create Or Replace Function scott.FN_GET_EMPS
Return mytypelist Pipelined
Is
  v_mytype mytype;
Begin
  For r In (Select * From SCOTT.emp) Loop
    v_mytype := mytype( r.empno, r.ename );
    Pipe Row (v_mytype);
  End Loop;
  Return;
End FN_GET_EMPS;


Select * From Table(FN_GET_EMPS);


Create Or Replace Function FN_GET_EMPS2
( coddept Number )
Return mytypelist Pipelined
Is
  v_mytype mytype;
Begin
     For r In (Select * From emp Where deptno = coddept) Loop
         v_mytype := mytype( r.empno, r.ename );
         Pipe Row (v_mytype);
     End Loop;
     Return;
End FN_GET_EMPS2;


Select * From Table(FN_GET_EMPS2(30));

