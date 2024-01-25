select * from customer;
select * from product;
select * from sales;

--- IN statement
select *
from customer
where city in ('Philadelphia','Seattle');

---BWTWEEN statemnt
select *
from customer
where age between 20 and 30;

select *
from customer
where age >=20 and age<=30;

select * 
from customer
where age not between 20 and 30;

select *
from sales
where ship_date between '2015-04-01' and '2016-04-01';

---LIKE condition
select *
from customer
where customer_name like 'J%';

select *
from customer
where customer_name like '%Nelson%';

select distinct city
from customer
where city not like 'S%';

select *
from customer
where customer_name like '____ %';

select *
from customer
where customer_name like 'G\%';

---Exercise 6
select distinct city
from customer
where region in ('North','East');

select *
from sales
where sales between 100 and 500;

select customer_name
from customer
where customer_name like '% ____';


---ORDER BY COMMNAD
select * 
from customer
where state = 'California'
order by Customer_name;

---order by column number
select * 
from customer
order by 2 desc;

select *
from  customer
where age>25
order by city asc, customer_name desc;

---LIMIT STATEMENT
select *
from customer
where age >=25
order by age desc
limit 8;

select *
from customer
where age >=25
order by age asc
limit 10;

---exercise 7
select *
from sales;

select *
from sales
where discount >0
order by discount desc
limit 10;

---ALIAS 'AS'
select customer_id as "Serial number",customer_name as name, age as Customer_age
from customer;

/* AGGREGATE FUNCTIONS*/

---COUNT FUNCTION
select *
from sales;

select count(*)
from sales;

select count(order_line)as "Number of Products Ordered",
count(distinct order_id) as "Number of orders"
from sales
where customer_id = 'CG-12520';

---SUM FUNCTION
select sum(profit) as "Total Profit"
from sales;

select sum (quantity) as "Total Quantity"
from sales
where product_id = 'FUR-TA-10000577';

---AVERAGE FUNCTION
select avg(age) as "Average Customer Age"
from customer;

select avg(sales*0.10) as "Average Commission Value"
from sales;

---MIN/MAX FUNCTION
select min (sales) as Min_sales_june15
from sales
where order_date between '2015-06-01' and '2015-06-30';

select max (sales) as Max_sales_june15
from sales
where order_date between '2015-06-01' and '2015-06-30';

---Exercise 8
select sum(sales)
from sales;

select *
from customer;

select count(customer_id)
from customer
where region = 'East' and age between 20 and 30;

select avg(age) as "Average Customer Age"
from customer
where region = 'East';

select min(age) as MinAge, max(age) as MaxAge
from customer
where city = 'Philadelphia';

---GROUP BY CLUASE
select region, count(customer_id) as customer_count
from customer
group by region;

select product_id, sum(quantity) as quantity_sold
from sales
group by product_id
order by quantity_sold desc;

select customer_id,
min(sales) as min_sales,
max(sales) as max_sales,
avg(sales) as avg_sales,
sum(sales) as total_sales
from sales
group by customer_id
order by total_sales desc
limit 10;

---HAVING CLAUSE
select region, count(customer_id) as customer_count
from customer
group by region
having count(customer_id)>200;

--vs WHERE CLAUSE WHICH IS USED FOR NON AGGREGATE FUNCTIONS
select region, count (customer_id) as customer_count
from customer
where customer_name like 'A%'
group by region
having count(customer_id)>15;

select product_id, sum(sales) as "Total Sales",
sum(quantity)as "Total Sales Quantity",
count(order_id) as "Number of Orders",
max(sales) as "Max Sales Value",
min(sales) as "Min Sales Value",
avg(sales) as "Average Sales Value"
from sales
group by product_id
order by "Total Sales" desc;

select product_id,
sum(quantity)
from sales
group by product_id
having sum(quantity)>10;

---CASE EXPRESSION
SELECT *,
	CASE when age<30 Then 'young'
		when age>60 then 'Senior Citizen'
		else 'Middle Aged'
	end as Age_catagory
from customer;


---JOINS
/* creating sales table for year 2015*/
Create table sales_2015 as select * 
from sales
where ship_date between '2015-01-01' and '2015-12-31';

select count(*)
from sales_2015;

select count(distinct customer_id)
from sales_2015;

/*create customer table with age between 20 and 60 */
create table customer_20_60 as select *
from customer
where age between 20 and 60;

select count (*)
from customer_20_60;

---INNER JOIN
select
	s.order_line,
	s.product_id,
	s.customer_id,
	s.sales,
	c.customer_name,
	c.age
from sales_2015 as s
inner join customer_20_60 as c
on s.customer_id = c.customer_id
order by customer_id;

---LEFT JOIN
---will get all the data from sales_2015 table
---will have null for corresponding rows from customer_20_60 table where no data available
select 
	s.order_line,
	s.product_id,
	s.customer_id,
	s.sales,
	c.customer_name,
	c.age
from sales_2015 as s
left join customer_20_60 as c
on s.customer_id = c.customer_id
order by customer_id;

---RGHT JOIN
---will get all the data from customer_20_60 table
---will have null for corresponding rows from sales_2015  table where no data available

select 
	s.order_line,
	s.product_id,
	c.customer_id,
	s.sales,
	c.customer_name,
	c.age
from sales_2015  as s
right join customer_20_60 as c
on s.customer_id = c.customer_id
order by customer_id;

---FULL OUTER JOIN
---will get all data from both the table
---will show null value on both the tables for the corresponding values
select
	s.order_line,
	s.product_id,
	s.customer_id,
	s.sales,
	c.customer_name,
	c.age,
	c.customer_id
from sales_2015 as s
full join customer_20_60 as c
on s.customer_id = c.customer_id
order by s.customer_id, c.customer_id;


--CROSS JOIN
--CREATES A CARTESIAN PRODUCT BETWEEN 2 SETS OF DATA

create table month_value (MM integer);

insert into month_value values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

select * 
from month_value;

create table year_value (YYYY integer);

insert into year_value values (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019);

select *
from year_value;

select
	y.YYYY,
	m.MM
from year_value as y, month_value as m
order by y.YYYY, m.MM;

---COMBINING QUERIES (NEEDS TO HAVE THE SAME STRUCTURE OF OUTPUT FOR BOTH THE TABLES)
---INTERSECT ALL AND UNION ALL allow duplicates in the result

--INTERSECT-GET THE RESULT OF COMMON OUTPUT FROM BOTH THE TABLES
select customer_id from sales_2015
intersect
select customer_id from customer_20_60;

---EXCEPT- REMOVES COMMONS FROM THE FIRST TABLE
select customer_id from sales_2015
except
select customer_id from customer_20_60;

---UNION-COMBINES BOTH THE TABLE OUTPUTS
select customer_id from sales_2015
union
select customer_id from customer_20_60;

---exercise 10
/* find the total sales done in every state for customer_20_60 and 
sales_2015 table

get data containing Product_id, product name. catagory, total sales
value of that product and total quantity sold.*/

select c.state, sum(s.sales) as total_sales
from customer_20_60 as c
inner join sales_2015 as s
on c.customer_id =s.customer_id
group by c.state
order by total_sales desc;

select *
from product;

select *
from sales;

select
	p.product_id,
	p.product_name,
	p.category,
	sum(s.sales) as "total sales value",
	sum(s.quantity) as "total quantity sold"
from product as p
inner join sales as s
on p.product_id = s.product_id
group by p.product_id;
