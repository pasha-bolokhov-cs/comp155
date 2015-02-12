-- Run command: @assign7
set echo on
SPOOL assign7.out
SET PAGESIZE 50
SET LINESIZE 120

/*********************************
 Assignment - Lab 7 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 Due: Thursday, Feb 12 11:30 am
 **********************************/
 
-- Get the date of the run for information
SELECT TO_CHAR(sysdate, 'Day Month DD HH24:MM') As "Script Run" 
FROM DUAL;

/*** 1 ***/
/* For each employee whose last name begins with a P, display the employee's 
last name and calculate the number of months between today and the date the 
employee was hired. Label the column "Months Worked" (note case). Order your 
results in descending order by the number of months employed. Round the 
number of months so that there is only a single digit after the decimal. */
SELECT last_name AS "Last Name", 
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 1) AS "Months Worked"
       FROM employees
       WHERE UPPER(last_name) LIKE 'P%'
       ORDER BY "Months Worked" DESC;


/*** 2 ***/
/* Your company is considering providing a special lunch every month for all
employees who have worked for the company at least 15 years. They will be 
invited to the lunch in the month in which they were hired. To get an idea 
of how many employees might come to a special lunch each month over the 
calendar year, your boss has asked you to write a query to return the number 
of employees who will have worked for the company at least 15 years divided 
into groupings by month. (See lab write-up for further details.) */
COLUMN COUNT(last_name) HEADING 'Number|of Hires'
SELECT TO_CHAR(hire_date, 'Month') AS "Month", COUNT(last_name)
       FROM employees
       WHERE TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(hire_date, 'YYYY') >= 15
       GROUP BY TO_CHAR(hire_date, 'Month')
       ORDER BY TO_DATE("Month", 'Month');


/*** 3 ***/
/* Your boss wants to know how many people might come who are of legal 
drinking age in British Columbia (in other words, are at least 19 as of 
December 3rd). You need to write a query to count the number of people 
in the people database who are at least 19 by that date. You will use the 
COMP155.PEOPLE table for this query. (See lab write-up for further details.)*/

SET HEADING OFF
SELECT 'The number of people who will be 19 or older as of December 3rd, ' || 
       TO_CHAR(SYSDATE, 'YYYY') || ' is: ' || 
       COUNT(birth_date)
       FROM comp155.people
       WHERE birth_date <= TO_DATE(TO_CHAR(SYSDATE, 'YYYY') - 19 || '-12-03',
       	     		           'YYYY-MM-DD');
SET HEADING ON

SPOOL OFF
