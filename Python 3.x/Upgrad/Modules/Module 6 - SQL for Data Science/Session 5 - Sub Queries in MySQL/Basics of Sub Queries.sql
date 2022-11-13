
-- a subquery to return the movie id and names for top 5 movies in 
-- the genre comedy by their name
select id, title from movie where id in 
    (select movie_id from genre where genre rlike 'Comedy')
    order by title limit 5;
    
-- returning movies where genre is Comedy and average rating between 7 and 8
select id, title from movie 
where 
    id in (select movie_id from genre where genre rlike 'Comedy')
    and 
    id in (select movie_id from ratings where avg_rating between 7 and 8);
    
-- returning names of actors and directors of avengers movies
select id, name from names 
where 
    id in (select name_id from role_mapping 
           where 
                movie_id in (select id from movie where title rlike 'Avengers:')
          ) 
        or 
    id in (select name_id from director_mapping 
           where 
                movie_id in (select id from movie where title rlike 'Avengers:')
          );
          
        
