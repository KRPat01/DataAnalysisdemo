use sql_intro;

select * from employees;
#Subqueries with SELECT statement
# select all the employees who have a salary < avg salary for all the employees.
select Emp_name, Dept, Salary 
from employees
where Salary > (select avg(Salary) from employees);

select Emp_name, Dept, Salary 
from employees
where Salary > (select Salary from employees
where Emp_name = "John");

select * 
from employees
where Emp_name = "John";

#subqueries for 2 different tables

use classicmodels;
select * from products;


select * from orderdetails;

select productcode, productname, msrp #NOT WORKING ASK ID
from products
where productcode in (select productcode from orderdetails
where priceEach > 100);

#STORED PROCEDURE

delimiter &&
create procedure high_price()
begin
select productCode, productName
from products
where msrp-buyprice > 50;
end &&
delimiter ;

call high_price();

#STORED PROCEDURE USING 'IN' PARAMETER
#TOP RECORDS OF EMPLOYEES BASED ON THEIR SALARIES
use sql_intro;
select * from employees_B;

delimiter //
create procedure sp_sortBySalary(in var int)
begin
select emp_name, age, dept, city, salary
from employees_b
order by salary desc
limit var;
end //
delimiter ;

call sp_sortBySalary(5);

#STORED PROCEDURE WITH 'UPDATE' COMMAND
select * from employees_b;
select * from employees;

delimiter //
create procedure update_salary_emp(IN temp_name varchar(30), IN new_salary float)
update employees
set salary = new_salary where emp_name = temp_name;
end //
delimiter ;
use sql_intro;
call update_salary_emp('sara', 30000);

#STORED PROCEDURES USING 'OUT' PARAMETER
# FET THE COUNT OF FEMALE EMPLOYEES OUT OF ALL EMPLOYEES

delimiter //
create procedure sp_countEmployees2(OUT Total_Emps int)
begin
select count(emp_name) into Total_Emps 
from employees
where Gender="F";
end //
delimiter ;
select * from employees;
call sp_countEmployees2(@F_emp);
select @F_emp as female_emps;