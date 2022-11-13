
#The OR operator and The AND operators
select 3>2,3<2,3>2 and 3<2 as 'AND',3>2 or 3<2 as 'OR';

#The NOT operator
select 5, not 5;

#The IN and NOT IN operators
select 3 in (4,5,6,7),5 in (4,5,6,7),3 not in (4,5,6,7);

#The BETWEEN and NOT BETWEEN operators
select 3 between 5 and 8, 7 not between 2 and 7;

#The LIKE and NOT LIKE Operator
select 'python' like 'py%', 'python' not like '%t_o%';

