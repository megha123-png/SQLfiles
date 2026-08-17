create database test;
use test 

create table Customers(
customer_id int primary key,
Email VARCHAR(100) UNIQUE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price >= 0),
    stock_quantity INT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price >= 0),
    stock_quantity INT default '0'
);

drop table Products;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price >= 0),
    stock_quantity INT default '0'
);


