
desc player;

insert into player_roles
values (1,'Batsman'),
       (2,'Seam Bowler'),
       (3,'All-Rounder'),
       (4,'Off-Spin Bowler'),
       (5,'Leg-Spin Bowler'),
       (6,'WK-Batsman');
       
select * from player_roles order by s_no;

insert into player
values (18,'Virat Kohli','Batsman',33,'Delhi'),
       (7,'MS Dhoni','WK-Batsman',40,'Jharkhand'),
       (45,'Rohit Sharma','Batsman',35,'Maharashtra'),
       (10,'Shardul Thakur','All-Rounder',29,'Maharashtra'),
       (90,'Mohammed Shami','Seam Bowler',34,'Uttar Pradesh'),
       (99,'Ravichandran Ashwin','Off-Spin Bowler',34,'Tamil Nadu'),
       (17,'Rishabh Pant','WK-Batsman',25,'Delhi'),
       (33,'Hardik Pandya','All-Rounder',28,'Gujarat');
      
select * from player;

#displaying record where jersey no is 18
select * from player where jersey_no=18;

#using arithmetic operators
select jersey_no,name,age,jersey_no*age as 'product' 
    from player where age>=30;

#using the AND operator
select jersey_no,name,age from player where jersey_no>=30 and age>=30;

#using the NOT IN operator
select * from player where age not in (33,40);

#using the BETWEEN operator
select * from player where jersey_no between 10 and 20;

#using the LIKE operator
select * from player where name like '_o%';

#using foreign key to fetch values
insert into student
values (100004,'Srinivas Ramanujan','PHY221',2020),
       (100005,'Oliver Wright','AE452',2022),
       (100006,'Marie Curie','PHY221',2018),
       (100007,'Leonhard Euler','PHY221',2022),
       (100008,'Abraham Maslow','MGMT51',2020),
       (100009,'Vikram Sarabhai','AE452',2017);
       
select * from courses;

#fetching records of course PHY221 from the student table
select roll_no,name,year_enroll from student where course_id='PHY221';

# modifying specific records
update courses set course_id='PHY254' where course_id='PHY221';

#setting NULL values to the foreign table before updating
update student set course_id=NULL where course_id='PHY221';
select name,course_id from student where course_id is NULL;

#now updating the records
update courses set course_id='PHY254' where course_id='PHY221';
select * from courses;

#updating records in foreign table
update student set course_id='PHY254' where course_id is NULL;
select name,course_id from student where course_id='PHY254';


