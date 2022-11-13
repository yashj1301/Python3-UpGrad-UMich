
-- Recursive CTEs

with recursive trial(x,x_square,x_cube) as 
    (select 0,pow(0,2),pow(0,3) 
     union all select x+1,pow(x+1,2),pow(x+1,3) 
     from trial where x<10)
select * from trial;

-- Fibbonacci Series till 10 Terms

with recursive fibonnaci (n,fib_n,next_fib_n) as
    (select 1,0,1
     union all select n+1,next_fib_n,fib_n+next_fib_n
     from fibonnaci where n < 10)
select n,fib_n from fibonnaci;




