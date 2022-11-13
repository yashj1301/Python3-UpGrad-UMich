
use company;

/* -------------------
     Window Functions
   -------------------

-- The OVER Clause */

select c.customerNumber 'cust', customerName 'name', 
od.productCode 'p_code',ProductName 'product',
priceEach 'ppu',quantityordered 'qty', 
sum(quantityordered*priceEach) over (partition by c.customerNumber) 'total'
from customers c
left join orders o on c.customerNumber = o.customerNumber
left join orderdetails od on o.orderNumber = od.orderNumber
left join products p on p.productCode = od.productCode
limit 10;

/* Aggregate Window Functions 

1. Calculating the Running Total*/

select c.customerNumber 'cust', customerName 'name', 
od.productCode 'p_code',ProductName 'product',
priceEach 'ppu',quantityordered 'qty', 
sum(quantityordered) over 
    (partition by c.customerNumber order by quantityordered,p.productCode) 'running total qty'
from customers c
inner join orders o on c.customerNumber = o.customerNumber
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on p.productCode = od.productCode
limit 8;

-- 2. Counting number of employees across each sales rep

select employeeNumber,concat_ws(' ',firstName,lastName) 'sales_rep',
customerNumber,customerName,
count(customerNumber) over (partition by employeeNumber) 'number of customers'
from employees e
inner join customers c on e.employeeNumber = c.salesRepEmployeeNumber
order by customerName 
limit 10;



