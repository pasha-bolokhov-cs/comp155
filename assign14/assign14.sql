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
INSERT INTO MYTEXTBOOKTABLE
       (TEXT_ID, TEXT_NAME, TEXT_AUTHOR, TEXT_PUBLISHER, FACULTY_REF)
       VALUES
       (textbook_seq.NEXTVAL, 'Relational Databases', 'Ted Codd', 'IT', 2);
INSERT INTO MYTEXTBOOKTABLE
       (TEXT_ID, TEXT_NAME, TEXT_AUTHOR, TEXT_PUBLISHER, FACULTY_REF)
       VALUES
       (textbook_seq.NEXTVAL, 'The Hunger Games', 'Suzanne Collins', 'Publish', 1);


/*** Step 7 List from MYTEXTBOOKTABLE ***/
SELECT TEXT_ID, TEXT_AUTHOR FROM MYTEXTBOOKTABLE;


/*** Step 8 Create non-unique index ***/
CREATE INDEX textname_idx ON MYTEXTBOOKTABLE (TEXT_NAME);

      
/*** Step 9 Display details about indexes on textbook table ***/
SELECT INDEX_NAME, INDEX_TYPE, UNIQUENESS
       FROM USER_INDEXES
       WHERE TABLE_NAME = 'MYTEXTBOOKTABLE';

      
/*** Step 10 Create synonym ***/
CREATE SYNONYM TEXT FOR MYTEXTBOOKTABLE;

            
/*** Step 11 Use synonym to list ***/
SELECT TEXT_ID, TEXT_AUTHOR FROM TEXT;

      
/*** Step 12 Display synonym names ***/
SELECT SYNONYM_NAME FROM USER_SYNONYMS;

      
/*** Step 13 Drop schema objects ***/
DROP SYNONYM TEXT;
DROP SEQUENCE textbook_seq;
DROP TABLE MYTEXTBOOKTABLE PURGE;

/*** Step 14 End ***/

SPOOL OFF
