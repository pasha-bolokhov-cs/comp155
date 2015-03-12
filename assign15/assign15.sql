
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
      INSERT INTO transaction_salary_table (employee_id, fname, lname, old_salary, new_salary, change_date)
      	     VALUES (:NEW.employee_id, :NEW.first_name, :NEW.last_name, :OLD.salary, :NEW.salary, SYSDATE);
    WHEN UPDATING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, upd)
	     VALUES (USER, 'Employees', SYSDATE, 'X');
  END CASE;
END;
/

/* Drop the transaction table just in case */
--@drop_trans.sql
/* Drop the audit table just in case */
--@drop_audit.sql

