# Subquery 
show databases;
use sql_intro;

select * from employees;

select Dept
from employees
where Salary = (select max(Salary) from employees);

select Emp_name
from employees
where Salary = (select max(Salary) from employees);

#Subqueries with SELECT statement
# select all the employees who have a salary < avg salary for all the employees.
select Emp_name, Dept, Salary 
from employees
where Salary < (select avg(Salary) from employees);

select * from c_product;

# subquery using INSERT statement, first we need to create tables
create table Products ( product_id int, p_name varchar(20), sell_price float, p_type varchar(20));
describe Products;

insert into Products values (101, 'Laptop', 1400.5,'Luxury'),
(102, 'Camera', 60.4, 'Non Luxury'),
(103, 'Necklace', 1200.6, 'Non Luxury'),
(104, 'Sofa', 800.3, 'Non Luxury');

select* from Products;

create table orders (order_id int, product_sold varchar(20), selling_price float);

insert into orders
select product_id, p_name, sell_price
from Products
where product_id in(select product_id from products
where sell_price > 1000);

select * from orders;

# subqueries with UPDATE statement

#first copy empolyees table to another tabel employees_B 
create table employees_B like employees;

insert into employees_B select * from employees;

select * from employees_B;

#now update employees table and the new salary is salary*0.35 where the age is > 27 years
update employees
set Salary = Salary * 0.35
where age in (select age from employees_B where age >= 27);

select * from employees;

#subqueries with DELETE statement
delete 
from employees
where age in(select age from employees_B where age <= 30);

select * from employees;


