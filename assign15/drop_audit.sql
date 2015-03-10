DROP TABLE audit_table PURGE;

CREATE TABLE audit_table
(user_name   varchar2(25),
 tablename   varchar2(25),
 column_name varchar2(25),
 ins         char,
 upd         char,
 del         char,
 change_date date);
