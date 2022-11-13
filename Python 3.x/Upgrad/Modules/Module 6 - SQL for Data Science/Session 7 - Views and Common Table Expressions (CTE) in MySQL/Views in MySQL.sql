
-- creating a view from SELECT statements
create view ntile_demo as select genre, title, year,
duration, languages, ntile(5000) over(order by duration) 'decile' 
from genre g inner join movie m on g.movie_id = m.id
limit 10;

select * from ntile_demo;
desc ntile_demo;

-- displaying all views
show full tables in imdb where table_type = 'VIEW';

-- altering a view
alter view ntile_demo as select genre,title,year,duration,languages
from genre g inner join movie m on g.movie_id = m.id limit 10;

select * from ntile_demo;
desc ntile_demo;

-- deleting a view
drop view ntile_demo;
show full tables in imdb where table_type = 'VIEW';



