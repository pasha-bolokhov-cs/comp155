-- Run command: @assign11

set echo on
SPOOL assign11.out
set pagesize 20
set linesize 80

/*********************************
 Assignment - Lab 11 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 Time Used Completing Lab: 2:00 hours
 **********************************/
 
/*** 1 Create MY_STUDENT ***/
CREATE TABLE MY_STUDENT (
       mystudent_id	NUMBER(5) PRIMARY KEY,
       mylname		VARCHAR2(25),
       mystartdate	DATE DEFAULT SYSDATE
);

 
/*** 2 Describe ***/
DESCRIBE MY_STUDENT


/*** 3 Modify MY_STUDENT ***/
ALTER TABLE MY_STUDENT 
      MODIFY mylname VARCHAR2(50);


/*** 4 Describe ***/
DESC MY_STUDENT


/*** 5 Insert your name ***/
INSERT INTO MY_STUDENT (mystudent_id, mylname)
       VALUES (5515, 'Bjoerndalen');


/*** 6 List contents ***/
SELECT * FROM MY_STUDENT;

/*** 7 Add comment ***/
COMMENT ON TABLE MY_STUDENT
	IS 'Assignment 11 Table';
 

/*** 8 Confirm comment for MY_STUDENT ***/
SELECT TABLE_NAME, COMMENTS FROM USER_TAB_COMMENTS
       WHERE TABLE_NAME = 'MY_STUDENT';


/*** 9 Create table My_Student ***/
CREATE TABLE "My_Student" AS
       SELECT mystudent_id AS "StudentNo",
	      mylname AS "Last Name",
	      mystartdate AS "BeginDate"
	      FROM MY_STUDENT;


/*** 10 Describe ***/
DESCRIBE "My_Student"


/*** 11 Select from data dictionary ***/
SELECT table_name FROM user_tables
       ORDER BY table_name;


/*** 12 Drop MY_STUDENT ***/
DROP TABLE MY_STUDENT PURGE;


/*** 13 Rename ***/
RENAME "My_Student" TO MY_STUDENT;


/*** 14 Select from data dictionary ***/
SELECT table_name FROM user_tables
       ORDER BY table_name;


/*** 15 Drop MY_STUDENT ***/
DROP TABLE MY_STUDENT PURGE;


/*** 16 Select from data dictionary ***/
SELECT table_name FROM user_tables
       ORDER BY table_name;


/*** 17 ***/

SPOOL OFF