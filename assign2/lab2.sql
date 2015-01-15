-- Run command: @lab2.sql
set echo off
SPOOL lab2.out
SET PAGESIZE 100

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
select last_name as "Poor Employee", salary as "Monthly Salary"
       from employees 
       where salary between 2500 and 2600;


/*** 2 ***/
/* Write a query to display the last name and department 
   number of all employees in departments 60, 70 and 90 
   in alphabetical order by last name descending. */
select last_name as "Last Name", department_id as "Department No"
       from employees 
       where department_id in (60, 70, 90) 
       order by last_name desc;


/*** 3 ***/
/* Write a query to display the last names of all employees 
   where the third letter of their name is an a. */
select last_name as "Last Name"
       from employees
       where last_name like '__a%';


/*** 4 ***/
/* Write a query to display the first name, last name, salary, and 
   commission for all employees who earn commissions and have a 
   last name beginning with the letter S. Sort data in 
   descending order of salary and commissions. */
select first_name as "First Name", last_name as "Last Name", 
       salary as "Salary", commission_pct as "Commission"
       from employees 
       where not commission_pct is NULL
       order by salary, commission_pct;


SPOOL OFF
