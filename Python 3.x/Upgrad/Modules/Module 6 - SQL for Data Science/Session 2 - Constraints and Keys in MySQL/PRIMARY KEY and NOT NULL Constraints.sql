
use test;

#creating a table with constraints
create table student (
    roll_no int(6) unsigned primary key,
    name varchar(30) not null,
    course_id varchar(30),
    course_name varchar(30) not null,
    year_enroll year not null
);

desc student;

#testing the primary key constraint
insert into student 
values (100001,'Yash Jain','AE352','Aerospace Engg',2018),
       (100001,'Albert Einstein','PHY102','Quantum Physics',1963);

# adding records
insert into student 
values (100001,'Yash Jain','AE352','Aerospace Engg',2018),
       (100002,'Albert Einstein','PHY102','Quantum Physics',1963);

select * from student;

#testing the not null constraint
insert into student (roll_no,name,year_enroll)
value (103,'Peter Drucker',1992);

insert into student (roll_no,name,course_name,year_enroll)
value (100003,'Peter Drucker','Management Processes',1992);

select * from student;

#dropping the table student 
drop table student;



