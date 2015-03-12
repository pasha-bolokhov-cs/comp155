
/*
 * Settings
 */
set echo on
set linesize = 120


/**********************
 *                    *
 *       Part I       *
 *                    *
 **********************/

/* Re-create the audit table */
@create_audit.sql

CREATE OR REPLACE TRIGGER audit_salary 
       AFTER
         INSERT OR
	 DELETE OR
	 UPDATE
       ON employees
       FOR EACH ROW
BEGIN
  CASE
    WHEN DELETING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, del) 
      	     VALUES (USER, 'Employees', SYSDATE, 'X');
    WHEN INSERTING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, ins)
	     VALUES (USER, 'Employees', SYSDATE, 'X');
    WHEN UPDATING('salary') THEN
      INSERT INTO audit_table (user_name, tablename, column_name, change_date, upd)
	     VALUES (USER, 'Employees', 'Salary', SYSDATE, 'X');
    WHEN UPDATING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, upd)
	     VALUES (USER, 'Employees', SYSDATE, 'X');
  END CASE;
END;
/


/*
 * Test Part I
 */
DELETE FROM employees WHERE employee_id = 174;
INSERT INTO employees (employee_id, first_name, last_name, email, salary, hire_date, job_id)
       VALUES (300, 'Taylor', 'Swift', 'taylor.swift@email.com', 40000, TO_DATE('20-January-2015'), 'SA_REP');
UPDATE employees
       SET first_name = 'Meagan' WHERE employee_id = 186;
UPDATE employees
       SET first_name = 'Teagan', salary = 5555 WHERE employee_id = 185;
UPDATE employees
       SET salary = 8888 WHERE employee_id = 188;
SELECT * FROM audit_table;


/**********************
 *                    *
 *      Part II       *
 *                    *
 **********************/
/* Re-create the transaction table */
@create_trans.sql

CREATE OR REPLACE TRIGGER audit_salary 
       AFTER
         INSERT OR
	 DELETE OR
	 UPDATE
       ON employees
       FOR EACH ROW
BEGIN
  CASE
    WHEN DELETING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, del) 
      	     VALUES (USER, 'Employees', SYSDATE, 'X');
    WHEN INSERTING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, ins)
	     VALUES (USER, 'Employees', SYSDATE, 'X');
    WHEN UPDATING('salary') THEN
      INSERT INTO audit_table (user_name, tablename, column_name, change_date, upd)
	     VALUES (USER, 'Employees', 'Salary', SYSDATE, 'X');
      INSERT INTO transaction_salary_table 
      	     VALUES (:NEW.employee_id, :NEW.first_name, :NEW.last_name, :OLD.salary, :NEW.salary, SYSDATE);
    WHEN UPDATING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, upd)
	     VALUES (USER, 'Employees', SYSDATE, 'X');
  END CASE;
END;
/

/*
 * Test Part II
 */
DELETE FROM audit_table;

DELETE FROM employees WHERE employee_id = 156;
INSERT INTO employees (employee_id, first_name, last_name, email, salary, hire_date, job_id)
       VALUES (400, 'Christina', 'Aguilera', 'cat_christy97@email.com', 60000, TO_DATE('10-January-2015'), 'SA_REP');
UPDATE employees
       SET first_name = 'Melanie' WHERE employee_id = 160;
UPDATE employees
       SET first_name = 'Teagan', salary = 4444 WHERE employee_id = 162;
UPDATE employees
       SET salary = 7777 WHERE employee_id = 168;
SELECT * FROM audit_table;
SELECT * FROM transaction_salary_table;


/* Drop the transaction table just in case */
@drop_trans.sql
/* Drop the audit table just in case */
@drop_audit.sql

