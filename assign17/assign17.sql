/************************************
        Assignment 17 Solution
        "Pasha Bolokhov" <pasha.bolokhov@gmail.com>
        Section: 1B
 ************************************/



/************************************
 *                                  *
 *      Part I - Set Up Tables      *
 *                                  *
 ************************************/

/* 
 * The script re-creates the tables, so can call it every time 
 */
SOURCE scott.sql



/***********************************
 *                                 *
 *      Part II - Run Queries      *
 *                                 *
 ***********************************/

/* 
 * List all employees who work in Chicago
 */
SELECT e.ename, e.empno 
       FROM emp e INNER JOIN dept d
       USING(deptno)
       WHERE UPPER(d.loc) = 'CHICAGO';

/*
 * List employees and managers
 */
SELECT e.ename AS 'Employee', e.empno AS 'EMPNO', m.ename AS 'Manager', m.empno AS 'MgrNo'
       FROM emp e INNER JOIN emp m
       ON e.mgr = m.empno;

/*
 * Count the number of people in the departments
 */
SELECT deptno, COUNT(ename) AS 'Total'
       FROM emp
       GROUP BY deptno;

