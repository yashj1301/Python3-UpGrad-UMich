
use test;
show tables;

#creating a table with constraints
create table student (
    roll_no int(6) unsigned not null,
    name varchar(30),
    course_id varchar(30),
    course_name varchar(30),
    year_enroll year default 2022,
    unique (roll_no,year_enroll)
);

desc student;

#checking the unique constraint
insert into student (roll_no,name,course_name,year_enroll)
values (100001,'Yash Jain','Classical Physics',2018),
       (100001,'Albert Einstein','Quantum Physics',2018);
       
insert into student (roll_no,name,course_name,year_enroll)
value (100001,'Yash Jain','Classical Physics',2018);

#checking the unique and the default constraint
insert into student (roll_no,name,course_name)
value (100001,'Albert Einstein','Quantum Physics');

select * from student;

#dropping the table
drop table student;
