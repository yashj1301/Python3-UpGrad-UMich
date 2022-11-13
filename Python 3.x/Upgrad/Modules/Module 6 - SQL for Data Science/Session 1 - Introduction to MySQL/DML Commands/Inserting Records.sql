show tables;

show columns from persons;

#inserting values in the table persons
insert into persons
values (1,'Yash','Jain','2000-07-13','Male','A+','Noida',9582617525,1),
       (2,'Albert','Einstein','1879-03-14','Male','AB','Württemberg',6784265821,1),
       (3,'Marie','Curie','1867-11-07','Female','A-','Warsaw',7332641193,0),
       (4,'Srinivas','Ramanujan','1887-12-22','Male','O','Erode',8543255522,1),
       (5,'Kalpana','Chawla','1962-03-17','Female','AB-','Delhi',9921643772,0);
       
#viewing all records
select * from persons;

#inserting values into specific columns
insert into persons(first_name,last_name,gender,city)
values ('Virat','Kohli','Male','Delhi');

select * from persons;
