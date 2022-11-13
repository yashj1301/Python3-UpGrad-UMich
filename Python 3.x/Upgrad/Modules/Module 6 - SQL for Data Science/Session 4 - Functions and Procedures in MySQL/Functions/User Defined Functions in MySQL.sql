
use username_test;

delimiter $$
create function hello (name varchar(30)) returns varchar(200) deterministic
begin
return concat_ws(' ','Hello',name);
end$$

delimiter ;

select hello('MySQL') as greeting;

delimiter $$
create function calculator (operator tinytext, num1 int, num2 int) 
returns decimal(9,2) deterministic
begin

declare var decimal(9,2);
if operator = '+' then set var = num1+num2;
elseif operator = '-' then set var = num1-num2;
elseif operator = '*' then set var = num1*num2;
elseif operator = '/' then set var = num1/num2;
end if;
return var;

end$$
delimiter ;

select 3 as var1, 5 as var2, calculator('*',3,5) as product;

-- listing down functions

show function status;

show function status where name rlike '^c|^f';

-- deleting functions

drop function calcprofit;
show function status where name rlike '^c|^f';

    










