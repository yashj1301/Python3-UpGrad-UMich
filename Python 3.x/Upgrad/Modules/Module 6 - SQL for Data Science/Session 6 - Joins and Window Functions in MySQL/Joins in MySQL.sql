
use imdb;

-- INNER JOIN

select id from movie
intersect
select movie_id from director_mapping
limit 10;


select m.id, title, date_published, production_company, name 'director'
from movie m
inner join director_mapping dm on m.id = dm.movie_id
inner join names nm on dm.name_id = nm.id
limit 10;


-- LEFT JOIN
select id from movie
except
select movie_id from director_mapping 
order by id limit 10;

select m.id, title, date_published, production_company, name 'director'
from movie m
left join director_mapping dm on m.id = dm.movie_id
left join names nm on dm.name_id = nm.id
where name is NULL
limit 10;

-- RIGHT JOIN
SELECT id from names
except
SELECT name_id FROM role_mapping 
order by id limit 10;

select id,name,category,movie_id from role_mapping rm
right join names nm on nm.id = rm.name_id
where movie_id is NULL;

select id,category from names;

-- CROSS JOIN
select id,title,date_published,genre from movie
cross join genre limit 10;

