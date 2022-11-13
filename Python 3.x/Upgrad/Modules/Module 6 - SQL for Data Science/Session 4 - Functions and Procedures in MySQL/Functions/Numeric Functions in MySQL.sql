
-- Aggregate Functions

select sum(order_quantity) 'total orders',
max(order_quantity) 'max orders',min(order_quantity) 'min orders',
avg(order_quantity) 'mean orders'
from market_fact_full;

select 3+4 'Sum',(3+4)/2 'Avg',greatest(3,4) 'Max',least(3,4) 'Min';

select count(*),count(manu_id) from prod_dimen;

-- mathematical functions

select pi(),ln(10),log(5,2);

select abs(-3.5),pow(4,3),sqrt(64);

select round(3.5658741,3),ceil(3.5658741),floor(3.5658741);

select greatest(3,5,4,0,8,7),least(3,5,4,2,8,7);

select rand(),rand(100);

select floor(rand()*(10-5+1)+5) 'test 1', 
       floor(rand()*(10-5+1)+5) 'test 2', 
       floor(rand()*(10-5+1)+5) 'test 3',
       floor(rand()*(10-5+1)+5) 'test 4';

-- trigonometric functions

select radians(45),degrees(pi()/4);

select sin(pi()/4),cos(pi()/4),tan(pi()/4);

select degrees(acos(0)),degrees(asin(1/2)),degrees(atan(1));

