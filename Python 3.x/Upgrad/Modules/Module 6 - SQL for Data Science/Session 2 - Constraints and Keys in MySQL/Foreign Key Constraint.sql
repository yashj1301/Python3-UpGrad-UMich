
use test;
show tables;

#creating primary table
create table courses (
    course_id varchar(30) primary key,
    course_name varchar(50) not null
);

insert into courses
values ('AE452','Aerospace Engg'),
       ('PHY221','Engg Physics'),
       ('MGMT51','Management Process');
       
select * from courses;

#creating foreign table
create table student (
    roll_no int(6) unsigned primary key,
    name varchar(30) not null,
    course_id varchar(30),
    year_enroll year default 2022,
    foreign key (course_id) references courses (course_id)
);

desc student;

#inserting values into foreign table
insert into student (roll_no,name,course_id)
value (100001,'Yash Jain','AE442');

insert into student (roll_no,name,course_id)
values (100001,'Yash Jain','AE452'),
       (100002,'Albert Einstein','PHY221'),
       (100003,'Peter Drucker','MGMT51');
       
select * from student;


