set echo on
SPOOL assign5.out

/*********************************
 Assignment - Lab 5 Solution
 By: Pasha Bolokhov
 Section: 1B

 Due: Tuesday, Feb 3 1:00 pm

 Time spent completing this lab: xx.x hours
 **********************************/
 
/*** 1 ***/
/* Run the script to add a couple of records to your HR employees table.*/
@insert.sql

/*** 2 ***/
/* For all employees whose last name starts with the letter R, display the 
   employee's last names with the first letter capitalized and all other 
   letters lowercase (be sure to use a function), and give the length of their 
   last name. Give each column an appropriate label using SQL (i.e. do not use 
   the column name default). Sort the results in descending order by the 
   employee's last name. */
SELECT INITCAP(last_name) AS "Last Name", LENGTH(last_name) AS "Name Length"
       FROM employees
       WHERE UPPER(last_name) LIKE 'R%'
       ORDER BY UPPER(last_name) DESC;



/*** 3 ***/
/* Your boss was at a company party and met a fellow employee name Olson, or 
was it Olsen, or may something else like that. He wasn't quite sure (his 
hearing is bad when he drinks). He wants you to run a query that will get 
all employees whose name sounds like Olson and the name of the department 
for which they work. He is sure once he sees the name and department he 
will remember the person. Make sure you use a function to check for the sound 
of the name. */

-- Traditional SQL
SELECT e.first_name AS "First Name", e.last_name AS "Last Name",
       d.department_name AS "Department"
       FROM employees e, departments d
       WHERE e.department_id = d.department_id
       AND SOUNDEX(last_name) = SOUNDEX('Olson');

-- SQL/92 
SELECT e.first_name AS "First Name", e.last_name AS "Last Name",
       d.department_name AS "Department"
       FROM employees e INNER JOIN departments d
       USING (department_id)
       WHERE SOUNDEX(last_name) = SOUNDEX('Olson');

/*** 4 ***/
/* Write a query that produces the following for each employee whose last 
name begins with an R: <employee last name> earns <salary> monthly but 
wants <3 times salary>. Label the column Dream Salaries. */

/* SQL command here */

/*** 5 ***/
ROLLBACK;

SPOOL OFF
