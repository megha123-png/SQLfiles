create database test1;
use test1;

create table table1 (
user_id tinyint primary key,
full_name varchar (50) not null,
age tinyint,
city varchar(25) not null
);

alter table table1
add constraint applying_for_age check (age > 18);

create table table2 (
product_id tinyint primary key,
product_name varchar(100) not null,
product_price int,
user_id tinyint references table1(user_id)
);
 select * from table2;

insert into table2 ( product_id, product_price)
values ( 001, 500); 

insert into table2
(product_id, product_name, product_price, user_id)
values
(101, "laptop", 50000, 1);

update table2
set product_name = "remote"
where product_id = 101;

select * from table2;

insert into table2
(product_id, product_name, product_price, user_id)
values
(102, "tv", 25000, 2),
(103, "toy", 1000, 3),
(104, "cupbord", 20000,4);

update table2
set product_price = 25000 + 3000
where product_name = "tv";

select * from table2
where product_id = 102;

insert into table2
(product_id, product_name, product_price, user_id)
values
(1, 'Laptop', 55000, 101),
(2, 'Mobile Phone', 25000, 102),
(3, 'Headphones', 3000, 103),
(4, 'Keyboard', 1500, 101),
(5, 'Mouse', 800, 102);

select product_id, product_name
from table2;

select product_id, product_name
from table2
where product_price > 20000;

select  distinct product_id, product_name
from table2;

select  distinct product_name, product_id
from table2;

insert into table2
(product_id, product_name, product_price, user_id)
values
(7, 'Laptop', 55000, 107),
(8, 'Mobile Phone', 25000, 108),
(9, 'Headphones', 3000, 109);

select  distinct product_name, product_price
from table2
ORDER BY product_price desc;

select  distinct product_name, product_price
from table2
ORDER BY product_price desc
LIMIT 3;

select  distinct product_name, product_price
from table2
ORDER BY product_price desc
LIMIT 5
offset 2;





