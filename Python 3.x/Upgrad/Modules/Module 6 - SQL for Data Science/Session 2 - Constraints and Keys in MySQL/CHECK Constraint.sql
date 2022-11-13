
use test;

#creating primary table
create table department (
    dept varchar(30) primary key,
    location varchar(30)
);

#creating foreign table
create table employee (
    emp_id int(6) unsigned primary key,
    name varchar(30) not null,
    age int(3) not null check (age>=20),
    dept varchar(30),
    foreign key (dept) references department(dept)
);

#entering values into primary table
insert into department 
values ('Operations','Block O'),
       ('Marketing','Block M'),
       ('Sales','Block S'),
       ('IT','Block I');

select * from department;

#entering values into foreign table
insert into employee 
values (101,'Yash Jain',20,'IT'),
       (102,'Elon Musk',18,'Operations');
       
insert into employee 
values (101,'Yash Jain',20,'IT'),
       (102,'Elon Musk',50,'Operations');

select * from employee;