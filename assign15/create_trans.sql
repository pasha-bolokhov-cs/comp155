DROP TABLE transaction_salary_table PURGE;

CREATE TABLE transaction_salary_table
(employee_id  number(6),
 fname        varchar2(20),
 lname        varchar2(25),
 old_salary   number(8,2),
 new_salary   number(8,2),
 change_date  date);
