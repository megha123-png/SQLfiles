create database product;
use product;

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(8,2) CHECK (Price > 0),
    Quantity INT DEFAULT 0,
    Manufacture_Date DATE,
    Expiry_Date DATE
);

select * from Product;
