show databases;

use sql_intro;

show tables;

create table employees(Emp_id int primary key, Emp_name varchar(25),
Age int, Gender char(1), Doj date, Dept varchar(20), City varchar(15),
Salary float);

describe employees;

insert into employees values
(101,"Jimmy", 35, "M", "2005-05-30","Slaes", "Chicago", 70000),
(102,"Shane", 30, "M", "1999-06-25","Marketing", "Seattle", 55000),
(103,"Marry", 28, "F", "2009-03-10", "Product","Boston", 62000),
(104,"Dwayne", 37, "M", "2011-07-12", "Tech", "Austin", 57000),
(105,"Sara", 32, "F", "2017-10-27", "Sales","New York", 72000),
(106,"Ammy", 35, "F", "2014-12-20", "IT","Seattle", 80000),
(107, "Jack", 40, "M", "2012-07-14", "Finance", "Houston", 100000),
(108, "Angela", 36, "F", "2007-02-04","Tech","New York", 110000),
(109, "Marcus", 25, "M", "2010-07-18", "HR", "Boston", 90000),
(110, "David", 34,"M", "2009-08-25", "Product", "Miami", 75000),
(111, "Rose",28,"F","2011-02-27", "Tech", "Chicago", 60000),
(112, "Sophia",33, "F","2013-09-21", "HR", "Houston", 65000),
(113,"Amelia", 30, "F", "2018-10-15", "Finance", "Austin", 55000),
(114, "Robert", 40, "M", "2015-12-18", "Sales", "Detroit", 95000),
(115, "William", 36, "M", "2016-04-20", "IT", "Chicago", 83000),
(116, "John", 32, "M", "2004-08-09", "Marketing", "Miami",67000),
(117, "Bella", 29, "F", "2002-06-11", "Tech", "Detroit", 72000),
(118, "Maya", 25, "F", "2018-10-15", "IT", "Houston", 48000),
(119, "Alice", 37, "F", "2019-05-28", "Product", "Seattle", 76000),
(120, "Joseph", 45, "M", "2016-11-23", "Sales", "Chicago", 115000);

select * from employees;

update employees
set dept="Sales"
where Emp_id = 101;

select distinct city 
from employees;

select distinct dept
from employees;

select avg(age)
from employees;

select dept, round(avg(age),1) as avg_age
from employees
group by dept;

select dept, sum(Salary) as total_salary
from employees
group by dept
order by total_salary desc;

select city, count(Emp_id) as total_employees
from employees
group by city
order by count(Emp_id) desc;

select year(Doj) as year, count(Emp_id) as total_employees
from employees
group by year
order by year;

create table Sales (product_id int, sell_price float, quantity int,
state varchar(20));

insert into Sales values (121, 320.0, 3, "California"),
(121, 320.0, 6, "Texas"),
(121, 320.0, 4, "Alaska"),
(123, 290.0, 2, "Texas"),
(123, 290.0, 7, "California"),
(123, 290.0, 4, "Washington"),
(121, 320.0, 7, "Ohio"),
(121, 320.0, 2, "California"),
(123, 290.0, 8, "Colorado");

describe Sales;

select *
from Sales;

select product_id, sum(sell_price * quantity) revenue
from Sales
group by product_id;


create table c_product (product_id int, cost_price float);
insert into c_product
values(121, 270.0),
(123, 250.0);

#join
select c.product_id, sum((s.sell_price - c.cost_price)* s.quantity) as profit
from Sales as s inner join c_product as c
where s.product_id = c.product_id
group by c.product_id;

#having clause
select City,count(Emp_id)
from employees
group by City
having count(Emp_id) >2;

select dept, avg(salary) as avg_salary
from employees
group by dept
having avg_salary >75000;

select City, sum(Salary) as total_salary
from employees
group by City
having sum(salary) >200000;

select dept, count(*) as emp_count
from employees
group by dept
having count(*) >2;

select city, count(*) as emp_count
from employees
where city != "Houston"
group by city
having count(*) >2;

select dept, count(*) as emp_count
from employees
group by dept
having avg(Salary) >75000;