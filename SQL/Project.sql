

-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- =====================================================
-- 2. TABLE: customers
-- =====================================================
CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) UNIQUE,
    phone           VARCHAR(15),
    city            VARCHAR(50),
    state           VARCHAR(50),
    signup_date     DATE,
    membership_tier VARCHAR(20),
    signup_source   VARCHAR(30)
);

-- =====================================================
-- 3. TABLE: products
-- =====================================================
CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(150) NOT NULL,
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    brand           VARCHAR(50),
    price           DECIMAL(10,2),
    stock_quantity  INT,
    seller_name     VARCHAR(100),
    avg_rating      DECIMAL(2,1)
);

-- =====================================================
-- 4. TABLE: orders  (links customers & products)
-- =====================================================
CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT,
    product_id      INT,
    order_date      DATE,
    quantity        INT,
    payment_method  VARCHAR(30),
    shipping_type   VARCHAR(20),
    order_status    VARCHAR(20),
    total_amount    DECIMAL(10,2),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =====================================================
-- 5. LOAD DATA FROM CSV
-- Update the file path to where your CSVs are stored.
-- On Windows use double backslashes, e.g. 'C:\\data\\ecom_customers.csv'
-- Requires: SET GLOBAL local_infile = 1;  (run once, if using LOCAL)
-- =====================================================

LOAD DATA LOCAL INFILE 'ecom_customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'ecom_products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'ecom_orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =====================================================
-- 6. QUICK CHECK
-- =====================================================
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_products  FROM products;
SELECT COUNT(*) AS total_orders    FROM orders;

select * from customers;
select * from products;
select * from orders;

 --- Q1. List all customers from Maharashtra
 
select * 
from customers
where state = "Maharashtra";

--- Q2.Show all products priced above 5000

select product_name, category, price 
from products
where price > 5000;

--- Q3.Count the total number of orders

select count(*) AS total_orders 
from orders;

--- Q4. Show all distinct payment methods used

select distinct payment_method 
from orders;

--- Q5.List all cancelled orders

select order_id, customer_id, product_id, order_date, total_amount, order_status
from orders
where order_status = 'Cancelled';

--- Q6. Insert a new order

insert into orders (order_id, customer_id, product_id, order_date, quantity,
                     payment_method, shipping_type, order_status, total_amount)
values (8003, 25, 101, curdate(), 2, 'UPI', 'Standard', 'Processing', 2499.00);

--- Q7. Update stock quantity after a sale

update products
set stock_quantity = stock_quantity - 2
where product_id = 101;

--- Q8. Find Customers Whose Name Starts with 'A'

select 
    customer_id,
    full_name,
    city
from customers
where full_name like 'A%';



--- Q9.Customers who never placed an order (LEFT JOIN)

SELECT c.customer_id, c.full_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

  
--- Q10.Customers with more than 5 orders
  
  SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;

--- Q11. Products priced above the average price of all products

SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);


--- Q12. Find Products Containing the Word 'Phone'

 select 
    product_id,
    product_name,
    category,
    price
from products
where product_name like '%Phone%';

  

--- Q13.Find all products priced below the average price of products in the 'Fashion' category.

SELECT product_id, product_name, category, price
FROM products
WHERE price < (
    SELECT AVG(price)
    FROM products
    WHERE category = 'Fashion'
);

--- Q14.Find categories where the average product price exceeds ₹10,000.

SELECT category, AVG(price)
FROM products
GROUP BY category
HAVING AVG(price) > 10000;

--- Q15. Find customers who have placed orders using more than 3 different payment methods.

SELECT customer_id, COUNT(DISTINCT payment_method)
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT payment_method) > 3;

--- Q16. Show top 3 customers by number of orders

select customer_id, count(order_id) as total_orders
from orders
group by customer_id
order by total_orders desc
limit 3;

--- Q17. Find the average price of products in each category

select category, avg(price) as avg_price
from products
group by category;

--- Q18. Find customers who placed more than 2 orders

select customer_id, COUNT(order_id) as total_orders
from orders
group by customer_id
having count(order_id) > 2;

--- Q19. Show customer name with their orderdate (basic JOIN)

select c.full_name, o.order_date
from customers c 
join orders o on c.customer_id = o.customer_id;

--- Q20. Find the cheapest product

select product_name, price
from products
order by price asc
limit 1;


--- Q21.Customers Who Purchased From More Than 2 Categories

select
c.customer_id,
c.full_name,
count(distinct p.category) as category_count
from customers c 
join orders o
on c.customer_id = o.customer_id
join products p 
on o.product_id = p.product_id
group by c.customer_id, c.full_name
having count(distinct p.category) >2;

--- Q22.First and Last Order of Each Customer

select
c.customer_id,
c.full_name,
min(o.order_date) as first_order_date,
max(o.order_date) as last_order_date,
count(o.order_id) as total_orders,
sum(o.total_amount) as total
from customers c 
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

--- Q23.Find the Top-Selling Product by Quantity

select
    p.product_id,
    p.product_name,
    SUM(o.quantity) as total_quantity
from products p
join orders o
   on p.product_id = o.product_id
group by
    p.product_id,
    p.product_name
order by total_quantity desc
limit 1;

--- Q24. Find Total Sales for Each Customer's City and State

SELECT 
    c.state,
    c.city,
    SUM(o.total_amount) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.state,
    c.city
ORDER BY total_sales DESC;









