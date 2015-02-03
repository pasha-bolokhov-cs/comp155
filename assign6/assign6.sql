-- Run command: @assign6.sql
set echo on
set PAGESIZE 40
SPOOL assign6.out

/*********************************
 Assignment - Lab 6 Solution
 By: Pasha Bolokhov
 Section: 1B

 Due:
 Lab section 1B: due Thursday, Feb 5 11:30 am

 Time spent completing this lab: 2:00 hours
 **********************************/
 
/*** 1 ***/
/* Write a query to display the number of people with the same job. Use JOB_ID 
in your query and list the jobs by JOB_ID along with the number of people having
that job.*/
SELECT COUNT(*) AS "No. Employees", job_id AS "Job No."
       FROM employees
       GROUP BY job_id;


/*** 2 ***/
/* Display the highest, lowest, sum, and average salary of all employees. Label 
the columns Maximum, Minimum, Sum, and Average, respectively (note the use of 
upper and lower case). Round your results to the nearest whole number. Do not use
the min_salary or max_salary attributes in the jobs table. */
SELECT ROUND(MAX(salary)) AS "Maximum", ROUND(MIN(salary)) AS "Minimum",
       ROUND(SUM(salary)) AS "Sum", ROUND(AVG(salary)) AS "Average"
       FROM employees;

 
/*** 3 ***/ 
/* Modify the above (#2) to display the maximum, minimum, sum, and average 
salary for each job type  (assume each job_id represents a job type). Be 
sure to give the job type in your output.*/
SELECT job_id AS "Job Type",
       ROUND(MAX(salary)) AS "Maximum", ROUND(MIN(salary)) AS "Minimum",
       ROUND(SUM(salary)) AS "Sum", ROUND(AVG(salary)) AS "Average"
       FROM employees
       GROUP BY job_id;


/*** 4 ***/ 
/* Display the manager number and the salary of the lowest paid employee for 
that manager. Exclude anyone whose manager is not known - in other words, 
exclude anyone who has a NULL manager_id. */
SELECT manager_id AS "Manager No.", ROUND(MIN(salary)) AS "Lowest Salary"
       FROM employees
       GROUP BY manager_id
       HAVING (manager_id IS NOT NULL);


/*** 5 ***/ 
/* Modify your query from above (#4) to exclude any groups where the minimum 
salary is less than or equal to $6,000. Sort the output in descending order of 
salary. */
SELECT manager_id AS "Manager No.", ROUND(MIN(salary)) AS "Lowest Salary"
       FROM employees
       GROUP BY manager_id
       HAVING (manager_id IS NOT NULL)
       AND (ROUND(MIN(salary)) >= 6000)
       ORDER BY "Lowest Salary" DESC;


SPOOL OFF
