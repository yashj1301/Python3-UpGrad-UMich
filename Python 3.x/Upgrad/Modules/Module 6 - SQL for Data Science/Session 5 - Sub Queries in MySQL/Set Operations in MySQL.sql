
select * from t1;
select * from t2;

-- UNION Operation

select * from t1
union
select * from t2;

-- UNION ALL Operation

select * from t1
union all 
select * from t2;

-- INTERSECTION Operation

select * from t1
intersect 
select * from t2;

-- EXCEPT Operation (Set Difference)

-- T1 - T2
select * from t1 
except 
select * from t2;

-- T2 - T1
select * from t2 
except 
select * from t1;

