use world;

select 'Hello World';

select 1+2;

select *
from Country;

select *
from Country
order by Name;

select Name, LifeExpectancy as 'Life Expectancy'
from Country
order by Name;

select count(*) 
from Country;

select *
from Country
order by Name LIMIT 5;

##Offset (10)
select *
from Country
order by Name LIMIT 10, 5;


## giving alias
select Name as Country, Code as ISO, Region, Population
from country
order by Code;

## count function
select count(*) 
from Country
where Population > 100000000 and Continent = 'Europe';

select count(LifeExpectancy) ## will olny count rows where there is data present
from Country;

## insert 

