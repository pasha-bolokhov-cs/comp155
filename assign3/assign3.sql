-- Run command: @assign3.sql
set echo off
SPOOL assign3.out

/*********************************
Assignment - Lab 3 Solution
By Pasha Bolokhov
Lab Section: 1B
Due: Tuesday Jan 27 @ 11:30 
Time spent on this lab: xx.x hours
**********************************/

/*** 1 ***/
/* Write a query to display the last name, job, department number, and 
department name for all employees who work in Southlake. Be sure to 
handle case (i.e. upper and lower case) when checking that the city 
is Southlake - use a function to force a proper case comparison. Give 
the query in SQL:1999 and Oracle SQL. */

SELECT e.last_name, 
       job_title,
       department_id, d.department_name
       FROM employees e INNER JOIN departments d
       USING (department_id)
       INNER JOIN jobs j
       USING (job_id)
       INNER JOIN locations l
       ON (d.location_id = l.location_id)
       WHERE UPPER(l.city) LIKE 'SOUTHLAKE';

-- Oracle SQL

/* SQL commands here */


/*** 2 ***/
/* Write a query that will list all of the employees (last names), 
whose last name starts with 'G' (be sure to handle case - use a 
function), and the departments (give the name) to which they belong. 
Include all employees who have not yet been assigned to any department. 
Give the query in SQL:1999 and Oracle SQL. (Note: do not use IS NULL 
or IS NOT NULL in your query.) */

-- SQL:1999

/* SQL commands here */

-- Oracle SQL

/* SQL commands here */


/*** 3 ***/
/* Display the employee last name and employee number along with their 
manager's last name and manager number (in other words the manager's 
employee id) for all employees whose last name begins with 'T' (be 
sure to handle case - use a function). Label the columns Employee, 
Emp#, Manager, and Mgr#, respectively (note the use of upper and lower 
case). Give the query in SQL:1999 and Oracle SQL. */

-- SQL:1999

/* SQL commands here */

-- Oracle SQL

/* SQL commands here */

SPOOL OFF
