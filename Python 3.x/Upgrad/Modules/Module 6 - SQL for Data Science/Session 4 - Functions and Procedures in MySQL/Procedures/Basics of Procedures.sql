
use imdb;

-- creating procedures 

delimiter $$
create procedure movie_head()
begin
    select  from movie limit 10;
end$$
delimiter ;

call movie_head();

-- listing procedures

show procedure status;
show procedure status where db = 'imdb';

-- delete procedures
drop procedure movie_head;
show procedure status where db = 'imdb';

