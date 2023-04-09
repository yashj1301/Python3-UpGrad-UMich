/* ------------------------------IMDB MySQL Assignment--------------------------------------------- 

Name: Yash Jain
Course: UpGrad Campus DS/A + ML/AI July 2022 Cohort
Batch ID - 4273                                                                                     */

-- Note - I have used mysql v 8.0.30 for the assignment, as I was facing problems in my laptop 
--        regarding the latest version. Hence, the ANY/ALL/SOME clauses weren't used here.
/*--------------------------------------------------------------------------------------------------*/

USE imdb;

/* Now that you have imported the data sets, let us explore some of the tables. 
 To begin with, it is beneficial to know the shape of the tables and whether any column has null 
 values. Further in this segment, you will take a look at 'movies' and 'genre' tables.*/

-- Segment 1:

-- Q1. Find the total number of rows in each table of the schema?
-- Type your code below:

select 
    (select count(*) from movie) as 'Rows in MOVIE',
    (select count(*) from genre) as 'Rows in GENRE',
    (select count(*) from director_mapping) as 'Rows in DIRECTOR_MAPPING',
    (select count(*) from names) as 'Rows in NAMES',
    (select count(*) from ratings) as'Rows in RATINGS',
    (select count(*) from role_mapping) as 'Rows in ROLE_MAPPING'; 

-- Q2. Which columns in the movie table have null values?
-- Type your code below:

select count(*)-count(id) 'ID',count(*)-count(title) 'Title',
       count(*)-count(year) 'Year',count(*)-count(date_published) 'Date Published',
       count(*)-count(duration) 'Duration',count(*)-count(country) 'Country',
       count(*)-count(worlwide_gross_income) 'Global Gross Income',
       count(*)-count(languages) 'Language(s)',
       count(*)-count(production_company) 'Production House' 
from movie;

-- Now as you can see four columns of the movie table has null values. Let's look at the at the 
-- movies released each year. 

-- Q3. Find the total number of movies released each year? How does the trend look month wise? 
-- (Output expected)

/* Output format for the first part:

+---------------+-------------------+
| Year			|	number_of_movies|
+-------------------+----------------
|	2017		|	2134			|
|	2018		|		.			|
|	2019		|		.			|
+---------------+-------------------+

Output format for the second part of the question:
+---------------+-------------------+
|	month_num	|	number_of_movies|
+---------------+----------------
|	1			|	 134			|
|	2			|	 231			|
|	.			|		.			|
+---------------+-------------------+ */

-- Type your code below:

select year,count(year) 'num_movies' 
from movie group by year;

select month(date_published) 'Month',count(month(date_published)) 'num_movies' 
from movie group by Month order by num_movies desc;

/*The highest number of movies is produced in the month of March.
So, now that you have understood the month-wise trend of movies, let us take a look at the 
other details in the movies table. 
We know USA and India produces huge number of movies each year. Lets find the number of movies 
produced by USA or India for the last year.*/
  
-- Q4. How many movies were produced in the USA or India in the year 2019??

-- Type your code below:

-- number of movies in each country
select country,sum(num_movies) 'num_movies' from 
    (select country,count(country) 'num_movies' 
    from movie  
    where (country rlike 'USA' and year=2019) or
          (country rlike 'India' and year=2019)
    group by country) as ct group by country rlike 'USA' ,country rlike 'India';
    
-- total movies
select sum(num_movies) 'num_movies' from 
    (select country,count(country) 'num_movies' 
    from movie  
    where country rlike 'USA|India' and year=2019
    group by country) as movies_in_India_and_USA;

/* USA and India produced more than a thousand movies(you know the exact number!) in the year 2019.
Exploring table Genre would be fun!! 
Let us find out the different genres in the dataset.*/

-- Q5. Find the unique list of the genres present in the data set?

-- Type your code below:

select distinct genre from genre;

/* So, RSVP Movies plans to make a movie of one of these genres.
Now, wouldn't you want to know which genre had the highest number of movies produced 
in the last year?
Combining both the movie and genres table can give more interesting insights. */

-- Q6.Which genre had the highest number of movies produced overall?
-- Type your code below:

select g.genre,count(g.genre) 'num_movies' from genre g,movie m 
where g.movie_id=m.id group by g.genre  order by num_movies desc limit 3;

/* So, based on the insight that you just drew, RSVP Movies should focus on the 'Drama' genre. 
But wait, it is too early to decide. A movie can belong to two or more genres. 
So, let us find out the count of movies that belong to only one genre.*/

-- Q7. How many movies belong to only one genre?
-- Type your code below:

select count(movie_id) 'num_movies' from 
    (select movie_id,count(movie_id) 'num_genres' from genre 
     group by movie_id having num_genres=1) 
as num_movies;

/* There are more than three thousand movies which has only one genre associated with them.
So, this figure appears significant. 

Now, let's find out the possible duration of RSVP Movies' next project.*/

-- Q8.What is the average duration of movies in each genre? 
-- (Note: The same movie can belong to multiple genres.)

/* Output format:

+---------------+-------------------+
| genre			|	avg_duration	|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

select g.genre,round(avg(m.duration),2) 'avg_duration' from genre g,movie m 
where g.movie_id=m.id group by g.genre order by avg_duration desc;

/* Now you know, movies of genre 'Drama' (produced highest in number in 2019) has the average 
duration of 106.77 mins.
Lets find where the movies of genre 'thriller' on the basis of number of movies.*/

-- Q9.What is the rank of the 'thriller' genre of movies among all the genres in terms 
-- of number of movies produced? 

-- (Hint: Use the Rank function)

/* Output format:
+---------------+-------------------+---------------------+
| genre			|		movie_count	|		genre_rank    |	
+---------------+-------------------+---------------------+
|drama			|	2312			|			2		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:

select * from (select g.genre,count(g.genre) 'movie_count',
rank() over (order by count(g.genre) desc) genre_rank
from genre g,movie m 
where g.movie_id=m.id group by g.genre) as grt where genre='Thriller';

/*Thriller movies is in top 3 among all genres in terms of number of movies
 
 In the previous segment, you analysed the movies and genres tables. 
 
 In this segment, you will analyse the ratings table as well.
To start with lets get the min and max values of different columns in the table*/

-- Segment 2:

-- Q10.  Find the minimum and maximum values in  each column of the ratings table 
--       except the movie_id column?

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
| min_avg_rating|	max_avg_rating	|	min_total_votes   |	max_total_votes 	 |min_median_rating|max_median_rating|
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
|		0		|			5		|	       177		  |	   2000	    		 |		0	       |	8			 |
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+*/
-- Type your code below:

select 
cast(min(avg_rating)as signed) 'min_avg_rating',cast(max(avg_rating) as signed) 'max_avg_rating', 
cast(min(total_votes)as signed) 'min_total_votes',cast(max(total_votes) as signed) 'max_total_votes',
cast(min(median_rating)as signed) 'min_median_rating',cast(max(median_rating) as signed) 'max_median_rating'
from ratings;

/* So, the minimum and maximum values in each column of the ratings table are in 
the expected range. This implies there are no outliers in the table. 

Now, let us find out the top 10 movies based on average rating.*/

-- Q11. Which are the top 10 movies based on average rating?
/* Output format:
+---------------+-------------------+---------------------+
| title			|		avg_rating	|		movie_rank    |
+---------------+-------------------+---------------------+
| Fan			|		9.6			|			5	  	  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
+---------------+-------------------+---------------------+*/

-- Type your code below:

select * from 
    (select title,avg_rating, rank() over (order by avg_rating desc) movie_rank
    from movie,ratings 
    where movie.id=ratings.movie_id) 
as title_table
where movie_rank between 1 and 10;

-- It's ok if RANK() or DENSE_RANK() is used too

/* Do you find you favourite movie FAN in the top 10 movies with an average rating of 9.6? 
If not, please check your code again!!

So, now that you know the top 10 movies, do you think character actors and filler actors 
can be from these movies? Summarising the ratings table based on the movie counts by 
median rating can give an excellent insight.*/

-- Q12. Summarise the ratings table based on the movie counts by median ratings.

/* Output format:
+---------------+-------------------+
| median_rating	|	movie_count		|
+-------------------+----------------
|	1			|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */

-- Type your code below:
-- Order by is good to have

select median_rating, count(median_rating) 'movie_count' 
from ratings,movie where ratings.movie_id=movie.id
group by median_rating order by movie_count desc;

/* Movies with a median rating of 7 is highest in number. 
Now, let's find out the production house with which RSVP Movies can partner for its next project.*/

-- Q13. Which production house has produced the most number of hit movies (average rating > 8)??

/* Output format:
+------------------+-------------------+---------------------+
|production_company|movie_count	       |	prod_company_rank|
+------------------+-------------------+---------------------+
| The Archers	   |		1		   |			1	  	 |
+------------------+-------------------+---------------------+*/

-- Type your code below:

select * from 
    (select production_company,count(production_company) 'movie_count', 
    rank() over (order by count(production_company) desc) 
    as 'prod_company_rank'
from movie,ratings where movie.id=ratings.movie_id and ratings.avg_rating>8
group by production_company) as prod_rank where prod_company_rank=1;

-- It's ok if RANK() or DENSE_RANK() is used too
-- Answer can be Dream Warrior Pictures or National Theatre Live or both

-- Q14. How many movies released in each genre during March 2017 in the USA had 
--      more than 1,000 votes?

/* Output format:

+---------------+-------------------+
| genre			|	movie_count		|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

select g.genre,count(g.genre) 'movie_count'
from genre g 
inner join movie m on g.movie_id=m.id
inner join ratings r on r.movie_id=g.movie_id
where 
    (m.date_published between '2017-03-01' and '2017-03-31') 
                        and  
    m.country='USA' and r.total_votes>1000
group by g.genre order by movie_count desc;


-- Lets try to analyse with a unique problem statement.

-- Q15. Find movies of each genre that start with the word 'The' 
--      and which have an average rating > 8?
/* Output format:
+---------------+-------------------+---------------------+
| title			|		avg_rating	|		genre	      |
+---------------+-------------------+---------------------+
| Theeran		|		8.3			|		Thriller	  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:

select title,avg_rating,genre from movie m
inner join ratings r on m.id=r.movie_id
inner join genre g on r.movie_id=g.movie_id
where title rlike '^The' and avg_rating>8;

-- You should also try your hand at median rating and check whether the 
-- 'median_rating' column gives any significant insights.

-- Q16. Of the movies released between 1 April 2018 and 1 April 2019, how many 
--      were given a median rating of 8?

-- Type your code below:

select count(*) 'num_movies' from 
    (select title,median_rating,genre from movie m
    inner join ratings r on m.id=r.movie_id
    inner join genre g on r.movie_id=g.movie_id
    where 
        (date_published between '2018-04-01' and '2019-04-01') 
        and median_rating=8 group by title)
as med_table;

-- Once again, try to solve the problem given below.

-- Q17. Do German movies get more votes than Italian movies? 

-- Hint: Here you have to find the total number of votes for both German and Italian movies.
-- Type your code below:

select Germany_Votes,Italy_Votes,
case 
    when TrueorFalse=1 then 'Yes' 
    else 'No' end 'Germany_votes > Italy_votes' 
from 
    (select Germany_Votes,Italy_Votes,Germany_Votes>Italy_Votes 'TrueorFalse' 
    from 
        (select sum(total_votes) 'Germany_Votes' from movie,ratings
        where movie.id=ratings.movie_id and country rlike 'Germany') as tb1,
        (select sum(total_votes) 'Italy_Votes' from movie,ratings
        where movie.id=ratings.movie_id and country rlike 'Italy') as tb2
    ) 
as GERvsITA;

-- Answer is Yes

/* Now that you have analysed the movies, genres and ratings tables, let us now 
analyse another table, the names table. 
Let's begin by searching for null values in the tables.*/

-- Segment 3:

-- Q18. Which columns in the names table have null values??
/*Hint: You can find null values for individual columns or follow below output format
+---------------+-------------------+---------------------+----------------------+
| name_nulls	|	height_nulls	|date_of_birth_nulls  |known_for_movies_nulls|
+---------------+-------------------+---------------------+----------------------+
|		0		|			123		|	       1234		  |	   12345	    	 |
+---------------+-------------------+---------------------+----------------------+*/

-- Type your code below:

select * from 
(select count(*) 'name_nulls' from names where name is NULL) as name_null,
(select count(*) 'height_nulls' from names where height is NULL) as height_null,
(select count(*) 'date_of_birth_nulls' from names where date_of_birth is NULL) as dob_null,
(select count(*) 'known_for_movies_nulls' from names where known_for_movies is NULL) 
as kfm_null;

/* There are no Null value in the column 'name'.

The director is the most important person in a movie crew.

Let's find out the top three directors in the top three genres who can be 
hired by RSVP Movies.*/

-- Q19. Who are the top three directors in the top three genres whose movies 
--      have an average rating > 8?

-- (Hint: The top three genres would have the most number of movies with an 
--        average rating > 8.)

/* Output format:

+---------------+-------------------+
| director_name	|	movie_count		|
+---------------+-------------------|
|James Mangold	|		4			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */

-- Type your code below:

select * from director_mapping limit 5;
select * from names limit 5;

-- combined code
select name,movie_count from 
    (select name,count(avg_rating) 'movie_count',
    rank() over(order by count(avg_rating) desc,avg(avg_rating) desc) 'rank_' 
    from names nm
    inner join director_mapping dm on nm.id=dm.name_id
    inner join movie m on dm.movie_id=m.id
    inner join ratings r on m.id=r.movie_id
    inner join genre g on g.movie_id=m.id
    where avg_rating>8 and genre in 
        (select genre from 
            (select genre,count(avg_rating) from genre g
            inner join movie m on g.movie_id=m.id
            inner join ratings r on r.movie_id=m.id
            where avg_rating>8
            group by genre order by count(avg_rating) desc limit 3) 
        as top3) 
    group by name order by movie_count desc) as top
where rank_ between 1 and 3;

/* James Mangold can be hired as the director for RSVP's next project. Do you 
remember his movies, 'Logan' and 'The Wolverine'. 

Now, let's find out the top two actors.*/

-- Q20. Who are the top two actors whose movies have a median rating >= 8?
/* Output format:

+---------------+-------------------+
| actor_name	|	movie_count		|
+-------------------+----------------
|Christain Bale	|		10			|
|	.			|		.			|
+---------------+-------------------+ */

-- Type your code below:

select name 'actor_name',count(median_rating) 'movie_count' 
from names nm 
inner join role_mapping rm on nm.id=rm.name_id
inner join movie m on rm.movie_id=m.id
inner join ratings r on r.movie_id=m.id
where r.median_rating>=8
group by name order by movie_count desc limit 2; -- since the top 2 count values 
--                                                  are not repeating 

/* Have you find your favourite actor 'Mohanlal' in the list. If no, please check 
your code again. RSVP Movies plans to partner with other global production houses. 

Let's find out the top three production houses in the world.*/

-- Q21. Which are the top three production houses based on the number of votes 
--      received by their movies?

/* Output format:
+------------------+--------------------+---------------------+
|production_company|vote_count			|		prod_comp_rank|
+------------------+--------------------+---------------------+
| The Archers		|		830			|		1	  		  |
|	.				|		.			|			.		  |
|	.				|		.			|			.		  |
+-------------------+-------------------+---------------------+*/

-- Type your code below:

select * from 
    (select production_company,sum(total_votes) 'vote_count', 
    rank() over (order by sum(total_votes) desc) 'prod_comp_rank'
    from movie m inner join ratings r on m.id=r.movie_id
    group by production_company) as prod_table 
where prod_comp_rank between 1 and 3;

/*Yes Marvel Studios rules the movie world.

So, these are the top three production houses based on the number of votes received 
by the movies they have produced.

Since RSVP Movies is based out of Mumbai, India also wants to woo its local audience. 
RSVP Movies also wants to hire a few Indian actors for its upcoming project to give 
a regional feel. 

Lets find who these actors could be.*/

-- Q22. Rank actors with movies released in India based on their average ratings. 
-- Which actor is at the top of the list?
-- Note: The actor should have acted in at least five Indian movies. 
-- (Hint: You should use the weighted average based on votes. If the ratings clash, 
-- then the total number of votes should act as the tie breaker.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actor_name	|	total_votes		|	movie_count		  |	actor_avg_rating 	 |actor_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Yogi Babu	|			3455	|	       11		  |	   8.42	    		 |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/

-- Type your code below:

select name 'actor_name',sum(total_votes) 'total_votes',count(m.id) 'movie_count',
round(sum(avg_rating*total_votes)/sum(total_votes),2) 'actor_avg_rating',
rank() over 
(order by sum(avg_rating*total_votes)/sum(total_votes) desc,
          sum(total_votes) desc) 
'actor_rank'
from names nm 
inner join role_mapping rm on nm.id=rm.name_id
inner join movie m on m.id=rm.movie_id
inner join ratings r on r.movie_id=m.id
where country rlike 'India' and rm.category='actor'
group by name having movie_count>=5 limit 1;

-- Top actor is Vijay Sethupathi

-- Q23.Find out the top five actresses in Hindi movies released in India based on their 
--     average ratings? 
-- Note: The actresses should have acted in at least three Indian movies. 
-- (Hint: You should use the weighted average based on votes. If the ratings clash, 
--        then the total number of votes should act as the tie breaker.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actress_name	|	total_votes		|	movie_count		  |	actress_avg_rating 	 |actress_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Tabu		|			3455	|	       11		  |	   8.42	    		 |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/

-- Type your code below:

select name 'actress_name',sum(total_votes) 'total_votes',count(*) 'movie_count',
round(sum(avg_rating*total_votes)/sum(total_votes),2) 'actress_avg_rating',
rank() over 
(order by sum(avg_rating*total_votes)/sum(total_votes) desc,
          sum(total_votes) desc) 
'actress_rank'
from names nm 
inner join role_mapping rm on nm.id=rm.name_id
inner join movie m on m.id=rm.movie_id
inner join ratings r on r.movie_id=m.id
where country rlike 'India' and rm.category='actress' and m.languages rlike 'Hindi'
group by name having movie_count>=3 limit 5;

/* Taapsee Pannu tops with average rating 7.74. 

Now let us divide all the thriller movies in the following categories and 
find out their numbers.*/

/* Q24. Select thriller movies as per avg rating and classify them 
        in the following category: 

			Rating > 8: Superhit movies
			Rating between 7 and 8: Hit movies
			Rating between 5 and 7: One-time-watch movies
			Rating < 5: Flop movies
--------------------------------------------------------------------------------------------*/

-- Type your code below:

select title,avg_rating,
case 
    when avg_rating>8 then 'Superhit Movies'
    when avg_rating>7 and avg_rating<=8 then 'Hit Movies'
    when avg_rating>5 and avg_rating<=7 then 'One-time watch movies'
    else 'Flop movies'
    end as 'review'
from movie m 
inner join ratings r on m.id=r.movie_id
inner join genre g on m.id=g.movie_id
where g.genre='Thriller';

/* Until now, you have analysed various tables of the data set. 
Now, you will perform some tasks that will give you a broader understanding 
of the data in this segment.*/

-- Segment 4:

-- Q25. What is the genre-wise running total and moving average 
--      of the average movie duration? 
-- (Note: You need to show the output table in the question.) 

/* Output format:
+---------------+-------------------+---------------------+----------------------+
| genre			|	avg_duration	|running_total_duration|moving_avg_duration  |
+---------------+-------------------+---------------------+----------------------+
|	comdy		|			145		|	       106.2	  |	   128.42	    	 |
|		.		|			.		|	       .		  |	   .	    		 |
|		.		|			.		|	       .		  |	   .	    		 |
|		.		|			.		|	       .		  |	   .	    		 |
+---------------+-------------------+---------------------+----------------------+*/
-- Type your code below:

select genre,round(avg_duration,2) 'avg_duration',
round(sum(avg_duration) over (order by avg_duration),2) 'running_total_duration' ,
round(avg(avg_duration) over (order by avg_duration),2) 'moving_avg_duration' 
from
    (select genre,avg(duration) 'avg_duration' 
    from genre g
    inner join movie m on g.movie_id=m.id
    group by genre order by avg(duration)) 
as runn_total;

-- Round is good to have and not a must have; Same thing applies to sorting

-- Let us find top 5 movies of each year with top 3 genres.

-- Q26. Which are the five highest-grossing movies of each year that belong 
--      to the top three genres? 
-- (Note: The top 3 genres would have the most number of movies.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| genre			|	year			|	movie_name		  |worldwide_gross_income|movie_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	comedy		|			2017	|	       indian	  |	   $103244842	     |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/

-- Type your code below:

-- Top 3 Genres based on most number of movies

select genre,count(id) 'num_movies' from genre 
        inner join movie on genre.movie_id=movie.id
        group by genre order by num_movies desc limit 3;

-- Top 5 movies in top 3 genres
select genre, year,title 'movie_name',
    sum(cast(trim( '$ ' from worlwide_gross_income) as signed)) 'worldwide_gross_income'
    from genre g inner join movie m on g.movie_id=m.id
    where genre in 
        (select genre from (select genre,count(id) 'num_movies' from genre 
        inner join movie on genre.movie_id=movie.id
        group by genre order by num_movies desc limit 3) as top3)
    group by genre,year,title order by worldwide_gross_income desc limit 5;
    
-- Combined code solution for the problem

select genre,year,movie_name,concat('$',worldwide_gross_income) 'worldwide_gross_income',
rank() over (order by worldwide_gross_income desc) 'movie_rank' from 
    (select genre, year,title 'movie_name',
    sum(cast(trim( '$ ' from worlwide_gross_income) as signed)) 'worldwide_gross_income'
    from genre g inner join movie m on g.movie_id=m.id
    where genre in 
        (select genre from (select genre,count(id) 'num_movies' from genre 
        inner join movie on genre.movie_id=movie.id
        group by genre order by num_movies desc limit 3) as top3) 
    group by genre,year,title order by worldwide_gross_income desc) 
as top5 group by year,genre,movie_name limit 5;
    
-- Finally, let's find out the names of the top two production houses that 
-- have produced the highest number of hits among multilingual movies.

-- Q27.  Which are the top two production houses that have produced the highest 
--       number of hits (median rating >= 8) among multilingual movies?

/* Output format:
+-------------------+-------------------+---------------------+
|production_company |movie_count		|		prod_comp_rank|
+-------------------+-------------------+---------------------+
| The Archers		|		830			|		1	  		  |
|	.				|		.			|			.		  |
|	.				|		.			|			.		  |
+-------------------+-------------------+---------------------+*/

-- Type your code below:

select production_company,count(m.id) 'movie_count', 
rank() over (order by count(*) desc) 'prod_comp_rank'
from movie m inner join ratings r on m.id=r.movie_id
where r.median_rating>=8 and m.languages rlike ',' 
and m.production_company is NOT NULL
group by production_company limit 2;

-- Multilingual is the important piece in the above question. It was created 
-- using POSITION(',' IN languages)>0 logic
-- If there is a comma, that means the movie is of more than one language

-- Q28. Who are the top 3 actresses based on number of Super Hit movies 
--      (average rating >8) in drama genre?
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actress_name	|	total_votes		|	movie_count		  |actress_avg_rating	 |actress_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Laura Dern	|			1016	|	       1		  |	   9.60			     |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/

-- Type your code below:

select * from 
(select name 'actress_name',sum(total_votes) 'total_votes',
count(rm.movie_id) 'movie_count',
round(sum(avg_rating*total_votes)/sum(total_votes),2) 'actress_avg_rating',
dense_rank() over 
(order by count(rm.movie_id) desc,
          (sum(total_votes)/(sum(avg_rating*total_votes)/sum(total_votes))) desc) 
'actress_rank'
from names nm 
inner join role_mapping rm on nm.id=rm.name_id
inner join movie m on m.id=rm.movie_id
inner join ratings r on r.movie_id=m.id
inner join genre g on m.id=g.movie_id
where rm.category='actress' and r.avg_rating>8 and g.genre='Drama'
group by name) as f_rank where actress_rank between 1 and 3;

/* Q29. Get the following details for top 9 directors (based on number of movies)

1. Director id
2. Name
3. Number of movies
4. Average inter movie duration in days
5. Average movie ratings
6. Total votes
7. Min rating
8. Max rating
9. total movie durations

Format:
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+
| director_id	|	director_name	|	number_of_movies  |	avg_inter_movie_days |	avg_rating	| total_votes  | min_rating	| max_rating | total_duration |
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+
|nm1777967		|	A.L. Vijay		|			5		  |	       177			 |	   5.65	    |	1754	   |	3.7		|	6.9		 |		613		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+

--------------------------------------------------------------------------------------------*/

-- Type your code below:

select name_id 'director_id',name 'director_name',count(movie_id) 'number_of_movies',
round(avg(diff_date),0) 'avg_inter_movie_days',
round(sum(avg_rating*total_votes)/sum(total_votes),2) 'avg_rating',
sum(total_votes) 'total_votes',
min(avg_rating) 'min_rating',max(avg_rating) 'max_rating',
sum(duration) 'total_duration'
from
    (select *,datediff(date_published,prev_date_published) 'diff_date' 
    from
        (select dm.name_id,name,dm.movie_id,avg_rating,total_votes,
        duration,date_published,
        lead(date_published,1) over(partition by name_id 
             order by date_published desc) 'prev_date_published'
        from director_mapping dm 
        inner join names nm on dm.name_id=nm.id
        inner join movie m on dm.movie_id=m.id
        inner join ratings r on m.id=r.movie_id) as table_summ
    ) 
as dir_summary
group by director_id order by number_of_movies desc,director_name limit 9;

/*----------------------------------------- THE END-----------------------------------------*/