/* Example SQL from lecture on constraints */

/* 1. Table with constraints */

create table test
(test_id varchar2(5),
test_name varchar2(10) constraint CK_name
check (test_name in ('apple','banana','carrot')),
constraint PK_test
primary key (test_id));

desc test

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST';

insert into test
(test_id, test_name)
values
('123','apple');

insert into test
(test_id, test_name)
values
('456','banana');


select * from test;

/* 2. Rollback */

rollback;

select * from test;

/* 3. Insert with constraints */

insert into test
(test_id, test_name)
values
('123','apple');

insert into test
(test_id, test_name)
values
('789','fruit');

insert into test
(test_id, test_name)
values
('789','carrot');

select * from test;

insert into test
(test_id, test_name)
values
('456','carrot');

/* 4. Commit */

commit;

rollback;

select * from test;

/* 5. Create with foreign key */

create table test1
(test1_id varchar2(5),
test1_name varchar2(10),
test_id varchar2(5),
constraint PK_test1 primary key (test1_id),
constraint FK_test_id
foreign key (test_id) references test (test_id));


insert into test1
values
('abc','ant','123');

insert into test1
values
('def','beetle','789');

select * from test1;

/* 6. Key constraint error */

insert into test1
values
('ghi','spider','345');

select * from test;

drop table test;

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST';

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST1';

drop table test cascade constraints;

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST1';


desc test1;

alter table test1
add (new_column number);


desc test1;


alter table test1 modify (test1_name varchar2(20) not null);

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST1';


alter table test1 drop primary key;

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST1';


alter table test1 add constraint PK_test1
primary key (test1_id);

select constraint_name, constraint_type,
search_condition from user_constraints
where table_name = 'TEST1';
