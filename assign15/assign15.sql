
/**********************
 *                    *
 *       Part I       *
 *                    *
 **********************/

/* Re-create the audit table */
@create_audit.sql

/* Question 1 */
CREATE OR REPLACE TRIGGER audit_salary 
       AFTER
         INSERT OR
	 DELETE OR
	 UPDATE
       ON employees
BEGIN
  CASE
    WHEN DELETING THEN
      INSERT INTO audit_table (user_name, tablename, change_date, del) 
      	     VALUES (USER, 'Employees', SYSDATE, 'X');
  END CASE;
END;

/* Drop the audit table just in case */
--@drop_audit.sql
