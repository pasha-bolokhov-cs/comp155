-- Run command: @H:\comp155\labsol\Lab5_SolCmd
set echo on
SPOOL H:\comp155\labsol\Lab5_Sol.txt

/*********************************
 Assignment - Lab 5 Solution
 By: [replace with your name]
 Section: 1A  or  1B  or  2A  [show only one]

 Due:
 Lab section 1A: due Tuesday, Feb 3 10:30 am
 Lab section 1B: due Tuesday, Feb 3 1:00 pm
 Lab section 2A: due Monday, Feb 2 1:30 pm
 Lab section 2B: due Monday, Feb 2 3:00 pm

 Time spent completing this lab: xx.x hours [ your approximation ]	  
 **********************************/
 
/*** 1 ***/
/* Run the script to add a couple of records to your HR employees table.*/

/*** 2 ***/
/* For all employees whose last name starts with the letter R, display the 
   employee's last names with the first letter capitalized and all other 
   letters lowercase (be sure to use a function), and give the length of their 
   last name. Give each column an appropriate label using SQL (i.e. do not use 
   the column name default). Sort the results in descending order by the 
   employee's last name. */

/* SQL command here */

/*** 3 ***/
/* Your boss was at a company party and met a fellow employee name Olson, or 
was it Olsen, or may something else like that. He wasn't quite sure (his 
hearing is bad when he drinks). He wants you to run a query that will get 
all employees whose name sounds like Olson and the name of the department 
for which they work. He is sure once he sees the name and department he 
will remember the person. Make sure you use a function to check for the sound 
of the name. */

-- Traditional

/* SQL command here */

-- SQL/92 

/* SQL command here */

/*** 4 ***/
/* Write a query that produces the following for each employee whose last 
name begins with an R: <employee last name> earns <salary> monthly but 
wants <3 times salary>. Label the column Dream Salaries. */

/* SQL command here */

/*** 5 ***/
ROLLBACK;

SPOOL OFF
