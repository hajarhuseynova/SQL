

select orderNumber,  sum(quantityOrdered) AS itemsCount,sum(priceEach*quantityOrdered) AS total
 from orderdetails
group by ordernumber
order by -total
limit 4,2;

select customerNumber,orderNumber,productCode,orderLineNumber,status
 from orders t1
inner join orderdetails t2 
using (orderNumber)
where shippedDate is null
order by customerNumber
limit 10;
select firstName,lastName,contactFirstName,contactLastName from employees e
inner join customers c on
e.employeeNumber = c.salesRepEmployeeNumber
order by firstName;

select firstName,lastName,count(customerName)
from employees e inner join customers c on

e.employeeNumber = c.salesRepEmployeeNumber

group by lastName,firstName;

select e1.lastName,e1.firstName,e1.officeCode,count(e.employeeNumber)
from employees e
inner join employees e1
using(employeeNumber)
where e.reportsTo is not null
group by employeeNumber;

select customerNumber,orderNumber,sum(quantityOrdered * priceEach) as total
from customers c 
inner join orders o using (customerNumber)
inner join orderdetails using (orderNumber)
group by customerNumber,orderNumber
order by customerNumber;

select status,productCode,orderNumber,sum(buyPrice)as total  from orders o 
inner join orderdetails using (orderNumber)
inner join products using(productCode)
where status="cancelled"
group by productCode









