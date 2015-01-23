-- Run command: @H:\comp155\labsol\Lab6_SolCmd
set echo on
SPOOL H:\comp155\labsol\Lab6_Sol.txt

/*********************************
 Assignment - Lab 6 Solution
 By: [replace with your name]
 Section: 1A  or  1B  or  2A or 2B [show only one]

 Due:
 Lab section 1A: due Thursday, Feb 5 1:00 am
 Lab section 1B: due Thursday, Feb 5 11:30 am
 Lab section 2A: due Thursday, Feb 5 8:30 am
 Lab section 2B: due Wednesday, Feb 4 12:30 pm

 Time spent completing this lab: xx.x hours [ your approximation ]	  
 **********************************/
 
/*** 1 ***/
/* Write a query to display the number of people with the same job. Use JOB_ID 
in your query and list the jobs by JOB_ID along with the number of people having
that job.*/

/* Your SQL SELECT query solution to 1 above goes here. */

/*** 2 ***/
/* Display the highest, lowest, sum, and average salary of all employees. Label 
the columns Maximum, Minimum, Sum, and Average, respectively (note the use of 
upper and lower case). Round your results to the nearest whole number. Do not use
the min_salary or max_salary attributes in the jobs table. */

/* Your SQL SELECT query solution to 2 above goes here. */
 
/*** 3 ***/ 
/* Modify the above (#2) to display the maximum, minimum, sum, and average 
salary for each job type  (assume each job_id represents a job type). Be 
sure to give the job type in your output.*/

/* Your SQL SELECT query solution to 3 above goes here. */

/*** 4 ***/ 
/* Display the manager number and the salary of the lowest paid employee for 
that manager. Exclude anyone whose manager is not known - in other words, 
exclude anyone who has a NULL manager_id. */

/* Your SQL SELECT query solution to 4 above goes here. */

/*** 5 ***/ 
/* Modify your query from above (#4) to exclude any groups where the minimum 
salary is less than or equal to $6,000. Sort the output in descending order of 
salary. */

/* Your SQL SELECT query solution to 5 above goes here. */

SPOOL OFF
