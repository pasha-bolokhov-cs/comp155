/*************************************
   Script to create the Scott tables 
 *************************************/

DROP TABLE IF EXISTS emp;

DROP TABLE IF EXISTS dept;

CREATE TABLE dept
       (deptno INT(2),
	dname VARCHAR(14) ,
	loc VARCHAR(13),
	CONSTRAINT pk_dept PRIMARY KEY (deptno))
	ENGINE = InnoDB;

CREATE TABLE emp
       (empno INT(4),
	ename VARCHAR(10),
	job VARCHAR(9),
	mgr INT(4),
	hiredate DATE,
	sal FLOAT(7, 2),
	comm FLOAT(7, 2),
	deptno INT(2),
	CONSTRAINT pk_emp PRIMARY KEY (empno),
	CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno))
	ENGINE = InnoDB;

INSERT INTO dept VALUES
	(10, 'ACCOUNTING', 'NEW YORK'),
	(20, 'RESEARCH', 'DALLAS'),
	(30, 'SALES', 'CHICAGO'),
	(40, 'OPERATIONS', 'BOSTON');

INSERT INTO emp VALUES
	(7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-12-1980', '%d-%m-%Y'), 800, NULL, 20),
	(7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-2-1981', '%d-%m-%Y'), 1600, 300, 30),
	(7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-2-1981', '%d-%m-%Y'), 1250, 500, 30),
	(7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('2-4-1981', '%d-%m-%Y'), 2975, NULL, 20),
	(7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-9-1981', '%d-%m-%Y'), 1250, 1400, 30),
	(7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('1-5-1981', '%d-%m-%Y'), 2850, NULL, 30),
	(7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('9-6-1981', '%d-%m-%Y'), 2450, NULL, 10),
	(7788, 'SCOTT', 'ANALYST', 7566, STR_TO_DATE('13-07-1987', '%d-%m-%Y'), 3000, NULL, 20),
	(7839, 'KING', 'PRESIDENT', NULL, STR_TO_DATE('17-11-1981', '%d-%m-%Y'), 5000, NULL, 10),
	(7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('8-9-1981', '%d-%m-%Y'), 1500, 0, 30),
	(7876, 'ADAMS', 'CLERK', 7788, STR_TO_DATE('13-07-1987', '%d-%m-%Y'), 1100, NULL, 20),
	(7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('3-12-1981', '%d-%m-%Y'), 950, NULL, 30),
	(7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('3-12-1981', '%d-%m-%Y'), 3000, NULL, 20),
	(7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-1-1982', '%d-%m-%Y'), 1300, NULL, 10);

DROP TABLE IF EXISTS bonus;
CREATE TABLE bonus
	(ename VARCHAR(10),
	 job VARCHAR(9),
	 sal INT,
	 comm INT)
	 ENGINE = InnoDB;
DROP TABLE IF EXISTS salgrade;
CREATE TABLE salgrade
      ( grade INT,
	losal INT,
	hisal INT )
	ENGINE = InnoDB;
INSERT INTO salgrade VALUES 
	(1, 700,  1200),
	(2, 1201, 1400),
	(3, 1401, 2000),
	(4, 2001, 3000),
	(5, 3001, 9999);
COMMIT;
