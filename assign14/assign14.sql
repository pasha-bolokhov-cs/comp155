-- Run command: @assign14

set echo on
SPOOL assign14.out
SET PAGESIZE 50
SET LINESIZE 100

/*********************************
 Assignment - Lab 14 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 **********************************/
 
/*** Step 1 Run script to create table & insert data ***/
@create-textbook.sql


/*** Step 2 Create sequence ***/
CREATE SEQUENCE	   textbook_seq
       START WITH  22
       NOCACHE;


/*** Step 3 Update with sequence ***/
UPDATE MYTEXTBOOKTABLE
       SET TEXT_ID = textbook_seq.NEXTVAL
       WHERE TEXT_NAME = 'All computers';
UPDATE MYTEXTBOOKTABLE
       SET TEXT_ID = textbook_seq.NEXTVAL
       WHERE TEXT_NAME = 'No Homework!';


/*** Step 4 Display details about textbook_seq ***/
SELECT SEQUENCE_NAME, MAX_VALUE, INCREMENT_BY, LAST_NUMBER
       FROM USER_SEQUENCES
       WHERE SEQUENCE_NAME = 'TEXTBOOK_SEQ';


/*** Step 5 Make text_id the primary key ***/
ALTER TABLE MYTEXTBOOKTABLE ADD CONSTRAINT text_id_pk PRIMARY KEY (TEXT_ID);


/*** Step 6 Insert values ***/

REM SQL command here

/*** Step 7 List from MYTEXTBOOKTABLE ***/

REM SQL command here

/*** Step 8 Create non-unique index ***/

REM SQL command here
      
/*** Step 9 Display details about indexes on textbook table ***/

REM SQL command here
      
/*** Step 10 Create synonym ***/

REM SQL command here
            
/*** Step 11 Use synonym to list ***/

REM SQL command here
      
/*** Step 12 Display synonym names ***/

REM SQL command here
      
/*** Step 13 Drop schema objects ***/
DROP SEQUENCE textbook_seq;
DROP TABLE MYTEXTBOOKTABLE PURGE;

/*** Step 14 End ***/

SPOOL OFF
