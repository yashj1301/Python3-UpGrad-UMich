
use test;

#sorting the table using single sort
select * from student order by course_id;

#sorting the table using the 'desc' keyword
select * from student order by course_id desc;

#multi-level sorting the table
select * from student order by course_id,name;

#multi-level sorting the table using 'desc' keyword
select * from student order by course_id,name desc;


