create database data;
use data;

create table customer (
customer_id int primary key,
customer_name varchar (50) not null,
phone varchar (15)
);

create table Item (
Item_id int primary key,
Item_name varchar (50) not null,
price decimal (8,2)
);

create table orders (
order_id int primary key,
customer_id int,
order_date date,
foreign key (customer_id) references customer (customer_id)
);

create table order_details (
order_details_id int primary key,
order_id int,
Item_id int,
customer_id int,
quantity int,
foreign key (order_id) references orders (order_id),
foreign key ( Item_id) references Item (Item_id),
foreign key (customer_id) references customer (customer_id)
);

create table payment (
payment_id int primary key,
order_id int,
payment_date date,
amount decimal (8,2),
foreign key (order_id) references orders (order_id)
);


