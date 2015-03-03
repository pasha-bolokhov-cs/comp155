-- Run command: @assign12

set echo on
SPOOL assign12.out
SET PAGESIZE 80
SET LINESIZE 100

/*********************************
 Assignment - Lab 12 Solution
 By Pasha Bolokhov
 Lab Section: 1B
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
      ADD (
	   created_by VARCHAR2(30) CONSTRAINT created_by_nn NOT NULL,
	   created_date DATE DEFAULT SYSDATE
      );


/*** Step 3 Confirm additions ***/     
DESCRIBE NEW_STUDENTS

/*** Step 4 Confirm constraints for NEW_STUDENTS ***/
COLUMN TABLE_NAME FORMAT A20
COLUMN SEARCH_CONDITION FORMAT A32
COLUMN COLUMN_NAME FORMAT A16
COLUMN DATA_TYPE FORMAT A10
COLUMN DATA_DEFAULT FORMAT A12
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
       FROM USER_CONSTRAINTS
       WHERE TABLE_NAME = 'NEW_STUDENTS';
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_DEFAULT
       FROM USER_TAB_COLUMNS
       WHERE TABLE_NAME='NEW_STUDENTS' AND COLUMN_NAME='CREATED_DATE';

/*** Step 5 Create PROGRAMMES ***/
CREATE TABLE PROGRAMMES (
       prog_id CHAR(4),
       prog_desc VARCHAR2(30)
);

/*** Step 6 Run insert script ***/
@inserts.sql

/*** Step 7 SELECT from created tables ***/
COLUMN fname FORMAT A12;
COLUMN lname FORMAT A12;
COLUMN created_by FORMAT A12;
SELECT * FROM NEW_STUDENTS;
SELECT * FROM PROGRAMMES;
 
/*** Step 8 Alter PROGRAMMES ***/
ALTER TABLE PROGRAMMES
      ADD CONSTRAINT prog_id_pk PRIMARY KEY (prog_id);

/*** Step 9 Alter NEW_STUDENTS ***/
ALTER TABLE NEW_STUDENTS
      ADD CONSTRAINT tempid_progid_pk PRIMARY KEY (temp_id, prog_id);

/*** Step 10 Add foreign key constraint ***/
ALTER TABLE NEW_STUDENTS
      ADD CONSTRAINT prog_id_fk FOREIGN KEY (prog_id) REFERENCES PROGRAMMES(prog_id);

/*** Step 11 Confirm constraints for new tables ***/
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
       FROM USER_CONSTRAINTS
       WHERE TABLE_NAME = 'NEW_STUDENTS' OR TABLE_NAME = 'PROGRAMMES';

/*** Step 12 Insert into NEW_STUDENTS ***/
INSERT INTO NEW_STUDENTS (temp_id, prog_id, fname, lname, reg_date, created_by)
       	    VALUES (9517, 'econ', 'Bill', 'Gates', SYSDATE, USER);

/*** Step 13 Explain error ***/
PROMPT Error because Bill Gates did not study economy (or SQL) - only Basic
PROMPT He could not enrol into economy because of a FOREIGN KEY problem (prog_id 'econ' undef)
PROMPT Would have been a lot different if he actually did

/*** Step 14 Add date constraint ***/
ALTER TABLE NEW_STUDENTS
      ADD CONSTRAINT dates_ck CHECK (reg_date >= TO_DATE('01-January-1997', 'DD-Month-YYYY'));

/*** Step 15 Test date constraint ***/
INSERT INTO NEW_STUDENTS (temp_id, prog_id, fname, lname, reg_date, created_by)
       	    VALUES (9519, 'comp', 'Grace', 'Hopper', '02-January-1948', USER);

/*** Step 16 List constraints for new tables ***/
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
       FROM USER_CONSTRAINTS
       WHERE TABLE_NAME = 'NEW_STUDENTS' OR TABLE_NAME = 'PROGRAMMES';

/*** Step 17 Clean up schema ***/
DROP TABLE NEW_STUDENTS PURGE;
DROP TABLE PROGRAMMES PURGE;

/*** Step 18 End ***/

SPOOL OFF

