## COMPARISION OPERATORS

## IN SQL 0 IS USED AS 'FALSE' AND 1 REPRESENTS 'TRUE'
select 0=1; ##will return 0 suggesting it is false
select 0=0; ## will retrun 1 suggesting true
select 0.0=0; ## return 1
select '0.0' =0; ## first the string is converted to numeric equivalent number and then compared return 1
select '0.1' >0; ## return 1

## != DOES NOT EQUAL TO
select 7 !=9;

select 7 <=9;

select (9 > 7) and (12 < 27); ## will return 1 as both conditions are true

select (9 > 7) or (12 < 27); ## will return 1 

select (9 < 7) and (12 < 27); ### will return 0

select (9 > 7) or (12 < 27); ## will return 1

select (9 >7) is true; ## return 1

select (9 > 7) is not true; # return 0

## LOGICAL OPERATORS true-1 or false-0
select 1 and 1; ## returns 1

select 1 or 1; ## 1

select 1 or 0; ## 1

select 0 or 0; ## 0

select 0 and 0; ## 0
select 1 xor 0; ##1

select 1 xor 1; ## 0 false as both sides are true

select 1 is true; ## 1
select 1 is not true; ## 0 as 1 is true

select 1 is null; ## 0

select 1 is not null; ## 1

select 0 is not null; ##1

select null is null; ## 1

select '' is null; ## 0

select 7 in (1,3,5); ## 0 as 7 is not in list

USE world;
SELECT Name AS 'Country', ROUND(Population / 1000000) AS 'PopMM' 
  FROM Country 
  WHERE Population > 50000000 AND Continent IN ('Asia', 'Europe')
  ORDER BY Population DESC;


use album;
SELECT t.title AS 'Track', t.track_number AS 'Track No', a.title AS 'Album', 
    a.artist AS 'Artist', t.duration AS 'Seconds'
  FROM Album AS a
  JOIN Track AS t ON t.album_id = a.id
  WHERE t.duration > 120 AND t.track_number > 3
  ORDER BY t.duration DESC;
  
  ## arithmatic operators
  
SELECT 5 + 3;
SELECT 5 - 3;
SELECT 5 * 3;
SELECT 5 / 3;
select 5 div 3;
select 5 mod 3;
select 5 % 3; ## same as mod just for mysql

select 5/0; ## null on mysql

### OPERATOR PRECEDENCE
SELECT 5 + 6 * 7 - 8;
SELECT (5 + 6) * (7 - 8);
SELECT 5 + (6 * 7) - 8;


##the CASE STATEMENT
USE scratch;

DROP TABLE IF EXISTS booltest;
CREATE TABLE booltest (a INTEGER, b INTEGER);
INSERT INTO booltest VALUES (1, 0);
SELECT * FROM booltest;

select
	case when a < 5 then 'true' else 'false' end as boolA,
    case when b >0 then 'true' else 'false' end as boolB
    from booltest;

SELECT
  CASE a WHEN 1 THEN 'true' ELSE 'false' END AS boolA,
  CASE b WHEN 1 THEN 'true' ELSE 'false' END AS boolB 
  FROM booltest;
  
select if(a < 5, 'true', 'false') 
from booltest;

SELECT IF(b > 0, 'TRUE', 'FALSE') FROM booltest;