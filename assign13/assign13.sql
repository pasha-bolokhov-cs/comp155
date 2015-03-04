-- Run command: @assign13

set echo on
SPOOL assign13.out
SET PAGESIZE 50

/*********************************
 Assignment - Lab 13 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 Approx. Time Spent: 1 hr
 **********************************/

/*** Step 1 Create EMPLOYEES_VW ***/
CREATE OR REPLACE VIEW EMPLOYEES_VW
       AS SELECT employee_id, first_name || ' ' || last_name AS "EMPNAME", department_id
       FROM employees;

/*** Step 2 Display for Dept 90 ***/
SELECT * FROM EMPLOYEES_VW
       WHERE department_id = 90;

/*** Step 3 List Views from Dictionary ***/
SELECT VIEW_NAME, TEXT
       FROM USER_VIEWS
       WHERE VIEW_NAME = 'EMPLOYEES_VW';

/*** Step 4 Create DEPT50 view ***/
CREATE OR REPLACE VIEW DEPT50
       (EMPNO, EMPLOYEE, DEPTNO)
       AS SELECT employee_id, last_name, department_id
       	  FROM employees
	  WHERE department_id = 50
	  WITH CHECK OPTION CONSTRAINT DEPT_NO_C;

/*** Step 5 Structure & Contents of DEPT50 ***/
DESCRIBE DEPT50
SELECT * FROM DEPT50
       WHERE ROWNUM <= 10;

/*** Step 6 Reassign Matos ***/
UPDATE DEPT50
       SET DEPTNO = 80
       WHERE UPPER(EMPLOYEE) = 'MATOS';

/*** Step 7 Why did you get an error? ***/
PROMPT The error occurred because of the constraint DEPT_NO_C

/*** Step 8 List views from USER_VIEWS ***/
SELECT VIEW_NAME, TEXT
       FROM USER_VIEWS
       WHERE VIEW_NAME = 'EMPLOYEES_VW'
       OR    VIEW_NAME = 'DEPT50';

/*** Step 9 Drop the new views ***/
DROP VIEW EMPLOYEES_VW;
DROP VIEW DEPT50;

/*** Step 10 ***/
SPOOL OFF

