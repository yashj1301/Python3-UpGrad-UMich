-- DDL

-- Creating Database

create database demonstration;


-- Using Database

use demonstration ;


-- create table

create table customers (

    ID int not null ,
    NAME varchar(32) not null ,
    time timestamp default current_timestamp  not null ,
    age int ,
    address varchar(32) ,
    salary int
    
);

desc customers ;


-- Alter table :

-- Add Primary key
alter table customers add constraint primary key ( ID );

desc customers ;

   
-- Add a new columns

alter table customers add column employer varchar(32) ;

desc customers ;


-- Drop commands :
-- Dropping column

alter table customers drop column employer ;
desc customers ;

-- Dropping table
drop table customers ;


-- Dropping database
drop database demonstration ;


--------------------------------------------------------------------------


-- DML

-- Creating Database
create database demonstration;


-- create table
use demonstration ;

create table transportation(
    
    ship_mode varchar(25) ,
    vehicle_company varchar(25),
    toll_required boolean 
) ;


-- inseting the following records into the table 
-- ( 'DELIVERY TRUCK', 'Ashok Leyland', false ) ;
--  ( 'REGULAR AIR', 'Air India', false) ;

insert into transportation value ('DELIVERY TRUCK', 'Ashok Leyland', false ) ;
insert into transportation value ('REGULAR AIR', 'Air India', false ) ;

select * from transportation ;



-- updating record based on some condition
update transportation set toll_required = true where ship_mode = 'DELIVERY TRUCK';


-- deleting particular record from the table
delete from transportation  where vehicle_company='Air India' ;
select * from transportation ;


--  updating the value in a column

-- DDL query to add a new column 

alter table transportation add column vehicle_number varchar(32) ;

desc transportation ;

update transportation set vehicle_number = 'MH-05-81234' ;

select * from transportation ;

--     ----------------------------------------
