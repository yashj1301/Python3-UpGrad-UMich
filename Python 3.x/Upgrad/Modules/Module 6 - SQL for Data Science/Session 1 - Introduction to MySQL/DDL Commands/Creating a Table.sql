
#Entering the database
use test;

#creating a new table
create table persons (
  ID tinyint(1) unsigned,first_name varchar(30),
  last_name varchar(30),dob date,
  gender enum('Male', 'Female', 'LGBTQ+'),
  age int(3) unsigned,blood_group enum('A', 'A+', 'O', 'A-', 'O-', 'AB+', 'AB', 'AB-'),
  city varchar(30),
  mobile bigint(10) unsigned,
  interest bool);
  
#returning all the tables in the database
show tables;

#checking the metadata of a table
desc persons;










