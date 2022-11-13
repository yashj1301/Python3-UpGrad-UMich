
-- Using the IN Keyword for parameters
delimiter $$
create procedure head(IN db varchar(30),IN rel varchar(30))
begin
    set @sel = concat('select * from ',db,'.',rel,' limit 10');
    prepare head from @sel;
    execute head;
    deallocate prepare head;
end$$
delimiter ;

call head('market_star_schema','market_fact_full');

delimiter $$
create procedure movie_name_contain(IN pattern varchar(20),IN lim int)
begin
    select * from movie where title rlike pattern limit lim;
end$$
delimiter ;

call movie_name_contain('ts',5);

-- Using the Keywords IN and OUT for parameters

delimiter $$
create procedure count_movie_name_contain(IN pattern varchar(20),OUT num int)
begin
    select count(distinct title) into num from movie where title rlike pattern;
end$$
delimiter ;

call count_movie_name_contain('ts',@num);

-- Using the Keyword INOUT for parameters

delimiter $$
create procedure total_votes_by_country(INOUT con varchar(30))
begin
select sum(total_votes) into con from movie m 
inner join ratings r on m.id=r.movie_id
where country rlike con;
end$$
delimiter ;

set @country='USA';
call total_votes_by_country(@country);
select @country;


