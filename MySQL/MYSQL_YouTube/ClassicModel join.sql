show databases;

use classicmodels;
show tables;

select * from products;
select * from productlines;
select * from orders;
select * from orderDetails;

select productcode, productname, textdescription
from products
inner join productlines
using (productline);

select o.ordernumber, o.status, p.productname,
sum(quantityOrdered * priceEach) as revenue
from orders as o
inner join orderdetails as od
on o.ordernumber = od.ordernumber
inner join products as p
on p.productcode = od.productcode
group by orderNumber, status, productname;

select *from customers;

select c.customerNumber, c.customerName, ordernumber, status
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber;

# to find out customers who didnt palce any orders add null operator
select c.customerNumber, c.customerName, ordernumber, status
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
where ordernumber is null;

select * from employees;

select c.customername, c.phone, e.employeeNumber ,e.email
from customers as c
right join employees as e
on c.salesrepemployeenumber = e.employeenumber
order by employeenumber;

#self join within the table ----------------------ASK ID
select concat(m.lastname, ", ",m.firstname) as manager,
concat(e.lastname, ", ",e.firstname) as employee
from employees as e
inner join employees as m on
m.employeenumber = e.reportsto
order by manager;