-- Run command: @assign8
set echo on
SPOOL assign8.out
SET PAGESIZE 50

/*********************************
 Assignment - Lab 8 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 Time spent working on this lab: 1 hrs
 **********************************/
 
/*** 1 ***/
/* Create a query to display the employee numbers, last names 
and salaries of all employees who earn more than the average 
salary and whose last_name begins with a 'G' or 'P' (be sure 
to handle case). Sort the results in descending order of salary. */
SELECT last_name AS "Last Name", salary AS "Salary"
       FROM employees
       WHERE salary > 
       	     (SELECT AVG(salary) FROM employees)
       AND (UPPER(last_name) LIKE 'G%'
       	    OR UPPER(last_name) LIKE 'P%')
       ORDER BY salary DESC;


/*** 2 ***/
/* Write a query that will display the last name and salary of every 
employee who reports to Gerald Cambrault. (There is more than one 
Cambrault in the database so you must be careful to check the first 
name too.) Be sure to handle case. */
SELECT last_name AS "Last Name", salary AS "Salary"
       FROM employees
       WHERE manager_id = 
       	     (SELECT employee_id
	      FROM employees
	      WHERE UPPER(first_name) = 'GERALD'
	      AND UPPER(last_name) = 'CAMBRAULT');


/*** 3 ***/
/* How many people work in the same department as Gerald Cambrault? 
Write a query to count the number employees in Gerald's department. 
Exclude Gerald from your count. (Remember, there is more than one 
Cambrault in the database so be sure to check the first name too.) */
SELECT COUNT(last_name)
       FROM employees
       WHERE department_id =
       	     (SELECT department_id
	      FROM employees
	      WHERE UPPER(first_name) = 'GERALD'
	      AND UPPER(last_name) = 'CAMBRAULT')
       AND NOT (UPPER(first_name) = 'GERALD'
	      AND UPPER(last_name) = 'CAMBRAULT');



/*** 4 ***/
/* Write a query to display the department IDs, employee IDs, last names, 
and salaries of all employees who earn more than twice ( 2 times) the 
average salary for the company, and who work in a department with any 
employee with a "u" anywhere in their last name. (Remember the "u" could 
be at the beginning of the name too.) Order your output by employee IDs. */
SELECT department_id AS "Dept No", employee_id AS "Emp No",
       last_name AS "Last Name", salary AS "Salary"
       FROM employees
       WHERE salary >
       	     (SELECT 2 * AVG(salary) FROM employees)
       AND department_id IN
       	   (SELECT department_id
	    FROM employees
	    WHERE UPPER(last_name) LIKE '%U%')
       ORDER BY employee_id;

SPOOL OFF
