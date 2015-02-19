-- Run command: @assign9.sql

/*** Create the tables ***/

/* run script to create tables */

set echo on
SPOOL assign9.out
set pagesize 50
set linesize 100

/*********************************
 Assignment - Lab 9 Solution
 By Pasha Bolokhov
 Lab Section: 1B
 **********************************/
 
/*** 1 Insert ***/
INSERT INTO customers (customer_id, first_name, last_name, dob, phone)
       VALUES (50, 'Grace', 'Hopper', TO_DATE('December 9, 1906', 'Month DD, YYYY'), '800-555-1250');
INSERT INTO customers (customer_id, first_name, last_name, dob, phone)
       VALUES (51, 'Steve', 'Jobs', TO_DATE('February 24, 1955', 'Month DD, YYYY'), '800-555-1251');
INSERT INTO customers (customer_id, first_name, last_name, dob, phone)
       VALUES (52, 'Larry', 'Ellison', TO_DATE('August 17, 1944', 'Month DD, YYYY'), '800-555-1252');
INSERT INTO customers (customer_id, first_name, last_name, dob, phone)
       VALUES (53, 'Tom', 'Thomson', TO_DATE('August 4, 1877', 'Month DD, YYYY'), NULL);


/*** 2 Confirm ***/
SELECT * FROM customers
       ORDER BY customer_id;


/*** 3 Correct last name ***/
UPDATE customers 
       SET last_name = 'Thomas'
       WHERE customer_id = 53;


/*** 4 Remove Jobs ***/
DELETE FROM customers
       WHERE customer_id = 51;


/*** 5 Update customer_ids ***/
UPDATE customers
       SET customer_id = customer_id + 100;


/*** 6 Confirm changes ***/
SELECT * FROM customers
       ORDER BY customer_id;


/*** 7 Create Savepoint ***/
SAVEPOINT CUST_SAVEP;


/*** 8 Add yourself ***/
INSERT INTO customers
       VALUES (200, 'Pasha', 'Bolokhov', TO_DATE('January 31, 1940', 'Month DD, YYYY'), '778-356-5612');


/*** 9 Confirm changes ***/
SELECT * FROM customers
       ORDER BY customer_id;


/*** 10 Rollback to savepoint ***/
ROLLBACK TO CUST_SAVEP;


/*** 11 List contents ***/
SELECT * FROM customers
       ORDER BY customer_id;


/*** 12 Rollback ***/
ROLLBACK;


/*** 13 List contents ***/
SELECT * FROM customers
       ORDER BY customer_id;


/*** 14 Re-insert yourself ***/
INSERT INTO customers
       VALUES (200, 'Pasha', 'Bolokhov', TO_DATE('January 31, 1940', 'Month DD, YYYY'), '778-356-5612');


/*** 15 Commit ***/
COMMIT;

/*** 16 List contents ***/
SELECT * FROM customers
       ORDER BY customer_id;

/*** 17 Rollback to savepoint & explanation ***/
ROLLBACK TO CUST_SAVEP;
-- CUST_SAVEP was erased already at step 12, 
-- not to mention the COMMIT if step 12 wasn't there


/*** 18 List contents ***/
SELECT * FROM customers
       ORDER BY customer_id;


/*** 19 Select all records ***/
SELECT customer_id, first_name, last_name, TO_CHAR(dob, 'fmMonth DD, YYYY'), phone
       FROM customers;


/*** 20 Spool off ***/
SPOOL OFF


/*** Drop the tables ***/

/* run script to DROP tables */
