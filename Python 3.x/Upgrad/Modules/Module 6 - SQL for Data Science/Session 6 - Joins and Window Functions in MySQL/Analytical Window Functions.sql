
/* Analytical Window Functions
  -----------------------------
*/

use imdb;
  
-- 1. NTILE

select genre, title, year,duration, languages, ntile(5000) over(order by duration) 'decile' 
from genre g inner join movie m on g.movie_id = m.id
limit 10;

-- 2. LEAD

select production_company,id,title,year,date_published, 
lead(date_published,1) over (partition by production_company order by date_published) 'next published date'
from movie where production_company is NOT NULL
limit 71,10;
;

-- 3. LAG

select production_company,id,title,year,date_published, 
lag(date_published,1) over (partition by production_company 
                            order by date_published) 'previous published date'
from movie where production_company is NOT NULL
limit 37,10;

-- 4. NTH VALUE

select production_company,title,date_published,duration,
nth_value(duration,1) over (partition by production_company 
                            order by duration desc) 'max duration'
from movie where production_company is NOT NULL
order by production_company,duration
limit 40,10;

-- 5. FIRST_VALUE

select production_company,title,date_published,worlwide_gross_income,
first_value(title) over (partition by production_company 
                         order by production_company) 'first movie'
from movie where production_company is NOT NULL
limit 40,10;

-- 6. LAST_VALUE

select production_company,title,date_published,worlwide_gross_income,
last_value(title) over (partition by production_company 
                        order by production_company) 'last movie'
from movie where production_company is NOT NULL
limit 40,10;


