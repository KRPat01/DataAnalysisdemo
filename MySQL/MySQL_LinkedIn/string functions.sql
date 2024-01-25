use world;

select name
from country
order by name;
## string comparision
select name 
from country
where name like '_a%'
order by name;

select name 
from country
where strcmp(name, 'France') <= 0
order by name;

## regular expressions

select name
from country
where name like  '%y'
order by name;

select name
from country
where name rlike  'y$'
order by name;

select name
from country
where name RLIKE '[xy][ai]' ## name having x or y followed by a or i
order by name;

## string concotenation

select concat('Love ','is ','all ','you ','need.');
select concat(42,42);

## numeric conversions
select 32742;

select hex(32742);

select oct(32742); ##base 8 no numbers higher than 7

select bin(32742);

select conv(32742, 10, 16); ## convert from base 10 to base 16

select conv('7FE6', 16, 10); ## to convert it back to 32742

## trimming  and padding
use scratch;

SELECT * FROM customer WHERE name LIKE '  Bill Smith  ';
SELECT * FROM customer WHERE name LIKE TRIM('  Bill Smith  ');
SELECT CONCAT(':', RTRIM('  Bill Smith  '), ':');
SELECT CONCAT(':', LTRIM('  Bill Smith  '), ':');

SELECT CONCAT(':', TRIM('x' FROM 'xxxBill Smithxxx'), ':');

## adding padding #20 includes the word as well
SELECT LPAD('Price', 20, '.');
SELECT LPAD('Price', 20, '. ');
SELECT RPAD('Price', 20, '. ');


## CASE CONVERSION
SELECT upper(NAME)
from customer;

SELECT ucase(NAME)
from customer;

SELECT lower(NAME)
from customer;

SELECT lcase(NAME)
from customer;

## to convert only first letter capital and others lower case
select concat(upper(substring(name, 1,1)), lower(substring(name,2)))
from customer;

### SUBSTRING FUNCTION
select substring('this is a string', 6); ## result starts from the 6th position
select substr('this is a string', 6); ##same as above, an alias for substring

select substring('this is a string', 6, 4); ## shows only 4 characters after 6

select substring('this is a string', -6); ## last 6

select substring_index('this is a string', ' ',1); ## returns all the characters before the first delimiter ' '

select substring_index('this is a string', ' ',-2); ## last 2 

## SOUNDEX FUNCTIONS used for words that sound alike

select soundex('bill'), soundex('bell'); ###gives same value for both coz kind of same in pronouciation



