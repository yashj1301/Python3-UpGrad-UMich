
use test;

#creating a table to delete
create table temp (
    temp_id tinyint(1),
    name varchar(5),
    email varchar(10));

show tables;

#deleting the table temp and returning tables
drop table temp;
show tables;

#creating a temporary database to delete
create database TempDB;
show databases;

#deleting the temporary database
drop database TempDB;
show databases;
