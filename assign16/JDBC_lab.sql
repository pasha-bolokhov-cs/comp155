SET ECHO ON

DROP TABLE ScottHR_emp;

CREATE TABLE ScottHR_emp
(empno NUMBER(5), 
 deptno NUMBER(2), 
 ename VARCHAR2(30), 
 sal NUMBER(7,2));

CREATE OR REPLACE PROCEDURE raisesalary 
(deptnum IN NUMBER, raise IN NUMBER)
AS
BEGIN
	UPDATE ScottHR_emp
	SET sal = sal + (sal * (raise/100))
	WHERE deptno = deptnum;
END;
/

SET ECHO OFF