
-- Derived tables (cartesian product)

select * from
    (select name from names limit 3) as tb1,
    (select duration from movie limit 2) as tb2;

select * from 
    (select x 'x1' from t1) as tb1,
    (select x 'x2' from t2) as tb2;
    
-- Duplicating a Table 

create table t3 (x int);
insert into t3 select * from t1;
select * from t3;

create table t4 as select * from t2 limit 3; -- duplicating with records
select * from t4;

create table t5 like t2; -- duplicating without records
select * from t5;

drop table t3;
drop table t4;
drop table t5;
