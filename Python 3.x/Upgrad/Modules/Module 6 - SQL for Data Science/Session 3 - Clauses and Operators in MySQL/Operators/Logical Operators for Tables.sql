
select * from demo;
select * from persons;

# The AND and OR operators 
select x,y,x>=y and x<=y as 'AND',
       x>=y or x<=y as 'OR' from demo;
       
#The NOT operator
select x,not x,y, not y from demo;

#The IN and NOT IN operator
select x,y,x in (3,5,7,2), y not in (9,4,2,1) from demo;

#The BETWEEN and NOT BETWEEN Operator
select dob between '1867-01-01' and '1890-01-01' from persons;

#The LIKE and NOT LIKE operator
select last_name like '%i_',first_name not like '%as' from persons;





