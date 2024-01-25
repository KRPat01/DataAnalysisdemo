show databases;
use mysql;
show tables;
create database sql_intro;
show databases;
use sql_intro;
create table emp_details (Name varchar(25), Age int, Sex char(1),
doj date, City varchar(15), Salary float);
describe emp_details;

insert into emp_details
values ("Jimmy", 35, "M", "2005-05-30", "Chicago", 70000),
("Shane", 30, "M", "1999-06-25", "Seattle", 55000),
("Marry", 28, "F", "2009-03-10", "Boston", 62000),
("Dwayne", 37, "M", "2011-07-12", "Austin", 57000),
("Sara", 32, "F", "2017-10-27", "New York", 72000),
("Ammy", 35, "F", "2014-12-20", "Seattle", 80000);

select * from emp_details;

select distinct City from emp_details;

select count(Name) as count_name from emp_details;

select sum(Salary) as total_salary from emp_details;

select avg(Salary) as average_salary from emp_details;

select name, age, salary from emp_details;

select * from emp_details where age > 30;

select name, city from emp_details where sex = "F";

select * from emp_details
where city = 'Chicago' or city = 'Austin';

select * from emp_details
where city in ('Chicago', 'Austin');

select * from emp_details
where doj between '2000-01-01' and '2010-12-31';

select * from emp_details
where age > 30 and sex = 'M';

select sex, sum(salary) as total_salary 
from emp_details
group by sex;

select * from emp_details
order by salary desc;

select (100-40) as total;

select length('I love you!') as total_len;

select repeat('@',20);

select upper('India');

select curdate();

select now();

# String functions
select upper('India') as upper_case;
select lower('INDIA') as lower_case;
select lcase('INDIA ') as lower_case;
select character_length('india') as total_len;

select name, character_length(name) as total_len
from emp_details;

select name, char_length(name) as total_len
from emp_details;

select concat("India", " is", " in Asia.") as merged;

select city, concat(name, " ",age) as name_age
from emp_details;

select reverse('India');

select reverse(Name)
from emp_details;

select replace("Orange is a vegetable", "vegetable", "fruit");

select length(trim("      India     "));
select length(rtrim("      India     "));
select rtrim("      India     ");

select length(ltrim("      India     "));

select ascii('k');

