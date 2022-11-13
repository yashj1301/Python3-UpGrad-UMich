
-- The GROUP BY clause

select state,count(DISTINCT city) from cust_dimen
group by state;

select ord_id,sum(profit) 'profit'
from market_fact_full 
group by ord_id order by profit;

-- The HAVING clause

select ord_id,sum(order_quantity) 'orders'
from market_fact_full 
group by ord_id having orders>=20
order by orders;

select ord_id,sum(order_quantity) 'orders'
from market_fact_full 
group by ord_id having ord_id like '%2_'
order by orders;

