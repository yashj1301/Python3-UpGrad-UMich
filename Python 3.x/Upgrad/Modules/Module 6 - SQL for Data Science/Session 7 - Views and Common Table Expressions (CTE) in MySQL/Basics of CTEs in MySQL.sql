
-- A simple demonstration of CTEs using the WITH Clause

with 
    movies_in_india as (select * from movie where country rlike 'India'), 
    movies_gt_100 as (select * from movie where duration >=100),
    movies_in_2018 as (select * from movie where year = 2018)

select id,mi.title,mi.date_published,mi.duration,
       mi.country,mi.production_company 
from movies_in_india mi
inner join movies_gt_100 mg using(id)
inner join movies_in_2018 mt using(id)
limit 5;

/* another example, which attaches the columns genre, 
and director for those movies that have only 1 genre and 1 director*/

with 
    num_gen as (select id,title,duration,production_company,
    count(distinct genre) 'num_genre' from movie m
    inner join genre g on m.id = g.movie_id group by id),
    
    dir as (select id,name,movie_id from names nm inner join director_mapping dm
    on nm.id=dm.name_id),
    
    num_dir as (select ng.id,title,duration,production_company,name 'director'
    from num_gen ng inner join dir d on ng.id = d.movie_id where num_genre=1)
    
select id,title,duration,production_company,director
from num_dir group by id having count(director)=1 limit 5;
