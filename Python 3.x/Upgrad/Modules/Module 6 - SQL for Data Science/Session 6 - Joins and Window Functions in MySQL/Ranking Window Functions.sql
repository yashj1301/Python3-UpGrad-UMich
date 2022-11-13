
-- Ranking Window Functions

use imdb;

-- 1. Rank() function

-- without partition
select * from 
(select id,title,date_published,year,duration,
rank() over (order by duration) 'rank_'
from movie) as p where rank_<=5;

-- with partition
select * from 
(select id,title,date_published,year,duration,
rank() over (partition by year order by duration) 'rank_'
from movie) as p where rank_<=3;


-- 2. Dense_Rank() function

-- without partition
select * from 
(select id,title,date_published,year,duration,
dense_rank() over (order by duration) 'rank_'
from movie) as p where rank_<=5;

-- with partition
select * from 
(select id,title,date_published,year,duration,
dense_rank() over (partition by year order by duration) 'rank_'
from movie) as p where rank_<=3;

-- 3. Row_Number() function

-- without partition
select row_number() over(order by production_company) 's.no.', m.id, title, date_published, 
production_company, name 'director'
from movie m
inner join director_mapping dm on m.id = dm.movie_id
inner join names nm on dm.name_id = nm.id
where production_company is NOT NULL
limit 10;

-- with partition
select row_number() over(partition by production_company order by date_published) 's.no.', 
m.id, title, date_published, 
production_company, name 'director'
from movie m
inner join director_mapping dm on m.id = dm.movie_id
inner join names nm on dm.name_id = nm.id
where production_company is NOT NULL
limit 37,8;




