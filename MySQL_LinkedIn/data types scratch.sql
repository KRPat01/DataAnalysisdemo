use scratch;

select * 
from Customer;

## insert data
insert into Customer(name, address, city, state, zip)
values('Fred Flinston', '123 Cobblestone Way', 'Bedrock', 'CA','91234');

insert into Customer(name, city, state)
values('Jimi HEldrix', 'Renton', 'WA');

select * 
from Customer
where name like 'Jimi%';

## update data
update Customer
set address = '123 Music Avenue', zip= '98056'
where name like 'Jimi%';

update Customer
set Name = 'Jimi Hendrix'
where name like 'Jimi%';

create table test(a int, b varchar(16), c varchar(16));
insert into test values (1, 'this', 'right here!'),
(2, 'that', 'over there'),
(3, 'another', 'nowhere'),
(4, 'again', 'guess where'),
(1, 'one more', 'everywhere!');

select *
from test;


## Delete statement
delete
from test
where a =2;

delete
from test
where a=1;
select *
from test;

delete
from test;
select *
from test;

drop table test;

select *
from Customer;

select *
from Customer
where name like 'Jimi%'
or name like 'Fred%';

show databases;

use scratch;

show tables;

CREATE TABLE test (
    id INT,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(10)
);

describe item;

describe test;

show table status;

drop table if exists test;

describe numerics;

select * from numerics;

select da+db, fa+fb
from numerics;

select da+db = 0.3
from numerics;

## DATE AND TIME TYPE
select now();

## to see which timezone MySQL is using
show variables like '%time_zone%';

## to set time in UTC
set time_zone = '+00:00';
select now();

## to return it baack to system time zone
set time_zone = 'SYSTEM';

## to get UTC timezone
select utc_timestamp();

drop table if exists temp;

create table temp(
	id int unsigned unique auto_increment primary key,
    stamp timestamp, ##this does not update the timestamp on its own as it is absolute and going to stop in 2038
    name varchar(64)
);

insert into temp (name) values ('this');
insert into temp(name) values ('that');
insert into temp(name) values ('other');

select * from temp;

## so instead of timestamp use this
create table temp(
	id int unsigned unique auto_increment primary key,
    stamp datetime default current_timestamp on update current_timestamp, ### will work till 9999 year
    name varchar(64)
);
insert into temp (name) values ('this');
insert into temp(name) values ('that');
insert into temp(name) values ('other');

select * from temp;

drop table if exists temp; ##to get the database in original form

###ENUMERATION TYPE - USES A LIST OF STRINGS BUT STORES ITS POSITION
DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
  a ENUM( 'Pablo', 'Henri', 'Jackson' )
);
INSERT INTO test ( a ) VALUES ( 'Pablo' );
INSERT INTO test ( a ) VALUES ( 'Henri' );
INSERT INTO test ( a ) VALUES ( 'Jackson' );
INSERT INTO test ( a ) VALUES ( 1 );
INSERT INTO test ( a ) VALUES ( 2 );
INSERT INTO test ( a ) VALUES ( 3 );
SELECT * FROM test;


### SET USES BINARY VALUES TO SELECT THE POSITIONS
DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
  a SET( 'Pablo', 'Henri', 'Jackson' )
);
INSERT INTO test ( a ) VALUES ( 'Pablo' );
INSERT INTO test ( a ) VALUES ( 'Henri' );
INSERT INTO test ( a ) VALUES ( 'Jackson' );
INSERT INTO test ( a ) VALUES ( 'Pablo,Jackson,Henri,Henri,Henri' );
INSERT INTO test ( a ) VALUES ( 1 );
INSERT INTO test ( a ) VALUES ( 2 );
INSERT INTO test ( a ) VALUES ( 3 );
INSERT INTO test ( a ) VALUES ( 4 );
INSERT INTO test ( a ) VALUES ( 5 );
INSERT INTO test ( a ) VALUES ( 6 );
INSERT INTO test ( a ) VALUES ( 7 );
SELECT * FROM test;


##USING SERIAL INSTEAD OF INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY
USE scratch;

DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
  a VARCHAR(32)
);
INSERT INTO test ( a ) VALUES ( 'Pablo' );
INSERT INTO test ( a ) VALUES ( 'Henri' );
INSERT INTO test ( a ) VALUES ( 'Jackson' );
SELECT * FROM test;
DESCRIBE test;
SHOW CREATE TABLE test;
DROP TABLE IF EXISTS test;
