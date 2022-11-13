
use test;

select * from student;

#setting limit to number of rows to be displayed
select * from student limit 5;

#setting limit to max rows 6 and starting point to be 3rd record
select * from student limit 6 offset 2;

#using the shorthand notation
select * from student limit 2,6;




