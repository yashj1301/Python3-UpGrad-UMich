
# returning movies that have the highest average rating
select id,title from movie 
where 
    id = any(select movie_id from ratings 
          where avg_rating = (select max(avg_rating) from ratings));
          
# executing the same query - using the ALL clause
select id,title from movie 
where 
    id = any(select movie_id from ratings 
          where avg_rating >= all (select avg_rating from ratings));
          
        
# a simple demonstration of the ANY and the ALL Clauses

create table t1 (x int);
create table t2 (x int);

insert into t1 values (1),(2),(3),(4),(5);
insert into t2 values (7),(2),(9),(3),(0);

select * from t1;
select * from t2;

select x from t2 where x > any (select x from t1); 
-- returns records from t2 which are greater than any value inside the table t1  

select x from t2 where x > all (select x from t1); 
-- returns records from t2 which are greater than all the values inside table 1


-- using the EXISTS Clause
select distinct genre from genre g
where exists 
    (select country from movie m
     where m.id = g.movie_id and
     lower(country) rlike 'soviet union'
    );
-- This query returned the genres for all the movies released in the soviet union
 
