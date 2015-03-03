-- Run command: @assign12

set echo on
SPOOL assign12.out
SET PAGESIZE 50

/*********************************
 Assignment - Lab 12 Solution
 By <give name>
 Lab Section: ??
**********************************/

/*** Step 1 Create NEW_STUDENTS ***/
CREATE TABLE NEW_STUDENTS (
       temp_id NUMBER(5),
       prog_id CHAR(4),
       fname VARCHAR2(25),
       lname VARCHAR2(25),
       reg_date DATE
);
 
/*** Step 2 Add columns ***/ 
ALTER TABLE NEW_STUDENTS
      ADD


/*** Step 3 Confirm additions ***/     

REM SQL command here

/*** Step 4 Confirm constraints for NEW_STUDENTS ***/

REM SQL command here

/*** Step 5 Create PROGRAMMES ***/

REM SQL command here

/*** Step 6 Run insert script ***/

REM SQL command here

/*** Step 7 SELECT from created tables ***/

REM SQL command here
 
/*** Step 8 Alter PROGRAMMES ***/

REM SQL command here

/*** Step 9 Alter NEW_STUDENTS ***/

REM SQL command here

/*** Step 10 Add foreign key constraint ***/

REM SQL command here

/*** Step 11 Confirm constraints for new tables ***/

REM SQL command here

/*** Step 12 Insert into NEW_STUDENTS ***/

REM SQL command here

/*** Step 13 Explain error ***/

REM You should get an error when you insert the record in Step 12. Why? 

/*** Step 14 Add date constraint ***/

REM SQL command here

/*** Step 15 Test date constraint ***/

REM SQL command here

/*** Step 16 List constraints for new tables ***/

REM SQL command here

/*** Step 17 Clean up schema ***/
DROP TABLE NEW_STUDENTS PURGE
DROP TABLE PROGRAMMES PURGE

/*** Step 18 End ***/

SPOOL OFF
