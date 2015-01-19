-- Run command: @lab2.sql
set echo on
SPOOL assign2.out
set PAGESIZE 100

/*********************************
 Assignment - Lab 2 Solution
 
 By: Pasha Bolokhov
 Lab section: 1B
 Due:
 Lab section 1B: due Thursday Jan 22 @ 11:30 
 
 Time spent working on this lab: 1:30 hours
 **********************************/
 
/*** 1 ***/
/* Write a query to display the last name and salary for 
   all employees whose salary falls in the range of $2,500 
   to $2,600 inclusive. Label the columns Poor Employee and 
   Monthly Salary respectively.*/
SELECT last_name AS "Poor Employee", salary AS "Monthly Salary"
       FROM employees 
       WHERE salary BETWEEN 2500 AND 2600;


/*** 2 ***/
/* Write a query to display the last name and department 
   number of all employees in departments 60, 70 and 90 
   in alphabetical order by last name descending. */
SELECT last_name AS "Last Name", department_id AS "Department No"
       FROM employees 
       WHERE department_id IN (60, 70, 90) 
       ORDER BY last_name DESC;


/*** 3 ***/
/* Write a query to display the last names of all employees 
   where the third letter of their name is an a. */
SELECT last_name AS "Last Name"
       FROM employees
       WHERE last_name LIKE '__a%';


/*** 4 ***/
/* Write a query to display the first name, last name, salary, and 
   commission for all employees who earn commissions and have a 
   last name beginning with the letter S. Sort data in 
   descending order of salary and commissions. */
SELECT first_name AS "First Name", last_name AS "Last Name", 
       salary AS "Salary", commission_pct AS "Commission"
       FROM employees 
       WHERE NOT commission_pct IS NULL
       ORDER BY salary, commission_pct;


SPOOL OFF
