-- Run command: @assign4.sql
set echo on
SPOOL assign4.out

/*********************************
 Assignment - Lab 4 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 Due: Tuesday Jan 29 @ 11:30 
 Time spent on this lab: 1:30 hours
**********************************/

SET LINESIZE 140
SET PAGESIZE 80
COLUMN "Employee Name" FORMAT A20
COLUMN "Manager Name" FORMAT A20
SELECT e.first_name || ' ' || e.last_name AS "Employee Name", 
       e.hire_date AS "Hire Date",  
       m.first_name || ' ' || m.last_name AS "Manager Name",
       m.hire_date AS "Hire Date"
FROM employees e 
INNER JOIN employees m 
ON (e.manager_id = m.employee_id)
WHERE (e.hire_date < m.hire_date)
AND (UPPER(SUBSTR(e.last_name, 1, 1)) >= 'S')
ORDER BY e.last_name DESC;

SPOOL OFF
