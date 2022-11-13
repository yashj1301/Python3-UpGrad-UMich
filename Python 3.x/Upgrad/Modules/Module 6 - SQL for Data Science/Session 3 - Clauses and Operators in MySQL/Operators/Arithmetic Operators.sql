
#evaluating mathematical expressions without attribute names
select 5+3,5-3,5/3,5*3,5%3;

#evaluating mathematical expressions with attribute names
select 5 as 'num1',3 as 'num2',5+3 as 'sum',5-3 as 'difference',
       5/3 as 'quotient',5*3 as 'product',5%3 as 'remainder';
       
#creating a table for demonstration
create table demo (
    x int not null,
    y int not null
);

insert into demo
values (1,3),(2,4),(7,1),
       (-3,2),(6,0),(-5,-2);
       
select * from demo;
       
#performing arithmetic operations on the table
select x,y,x+y as 'sum',x-y as 'difference',
       x*y as 'product', x/y as 'quotient', x%y as 'remainder'
    from demo;
    
    

