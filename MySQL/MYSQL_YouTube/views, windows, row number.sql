# VIEWS IN SQL
use classicmodels;
select * from customers;

create view cust_details
as
select customerName, phone, city
from customers;

select * from cust_details;

# CREATE VIEW FROM 2 TABLES USE JOIN
select * from products;
select * from productlines;

create view product_description
as
select productname, quantityinstock, msrp, textdescription
from products as p inner join productlines as pl
on p.productline = pl.productline;

select * from product_description;

# RENAME DESCRIPTION
rename table product_description 
to vehicle_description;

#TO VIEW TABLES EITHER GO TO SCHEMAS PANEL ON RT SIDE AND GO TO VIEWS OR USE THE STATEMENT
show full tables
where table_type = 'VIEW';

#TO DELETE VIEW USE DROP COMMAND
#drop view table_name;

#WINDOWS FUNCITON - USEFUL APPLICATION IN SOLVING ANALYTICAL PROBLEMS
use sql_intro;

select * from employees;

select emp_name, age, dept, sum(salary) 
over (partition by dept) as total_salary
from employees;

select emp_name, age, dept, sum(salary) 
over (partition by age) as total_salary
from employees;

#ROW NUMBER

select row_number() 
over(order by salary) as row_num, emp_name, salary 
from employees
order by salary;

#CAN BE USED TO FIND DUPLICATES
create table demo (st_id int, st_name varchar(20));

insert into demo 
values (101, 'Shane'), 
(102, 'Bradley'),
(103, 'Herath'),
(103, 'Herath'),
(104, 'Nathan'),
(105, 'Kevin'),
(105, 'Kevin');

select * from demo;

select st_id, st_name, row_number()
over(partition by st_id, st_name order by st_id)
as row_num
from demo;

# RANK FUNCTION

create table demo1(var_a int);
insert into demo1
values(101),(102),(103),(103),(104),(105),(106),(106),(107);

select * from demo1;

select var_a, rank()
over(order by var_a) as test_rank
from demo1;

#FIRST VALUE
# returns the value of the specified experssion with respect to the first row in the window frame.
select emp_name, age, salary, first_value(emp_name)
over(order by salary desc) as highest_salary
from employees;

select emp_name, age, salary,dept, first_value(emp_name)
over(partition by dept order by salary desc) as highest_salary
from employees;