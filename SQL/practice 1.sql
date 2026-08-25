create database sub;
use sub;

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);

INSERT INTO Employee
(Employee_ID, Employee_Name, Department, Salary, City)
VALUES
(101, 'Amit', 'IT', 55000, 'Mumbai'),
(102, 'Priya', 'HR', 40000, 'Pune'),
(103, 'Rahul', 'IT', 65000, 'Mumbai'),
(104, 'Sneha', 'Sales', 45000, 'Nashik'),
(105, 'Neha', 'HR', 50000, 'Pune'),
(106, 'Rohit', 'IT', 60000, 'Pune'),
(107, 'Pooja', 'Sales', 55000, 'Mumbai'),
(108, 'Akash', 'Finance', 70000, 'Mumbai'),
(109, 'Kiran', 'Finance', 65000, 'Pune'),
(110, 'Anjali', 'Sales', 48000, 'Nashik');

select * from Employee
where salary >= (select avg(salary) from Employee);

select Employee_Name, Salary
from Employee
where salary >(select salary from employee Where Employee_Name = 'Anjali');

select Employee_Name, Employee_ID
from Employee
where Employee_ID in (select Employee_ID from  Employee where Department in ('Finance', 'Sales'));

select Employee_Name
from Employee
where salary >(select avg(salary) from Employee);

select Employee_Name
from Employee
where salary = (select salary from Employee where Employee_ID = 105);

select Employee_Name
from Employee
where salary= (select max(salary) from Employee);

select Employee_Name
from employee
where department = (select department from employee where Employee_Name = 'Amit');

select Employee_Name, salary
from Employee
where salary < (select salary from employee where Employee_Name = 'Rohit');

select Employee_Name, salary
from Employee
where salary = (select min(salary) from Employee);

select Employee_Name, salary
from Employee
where salary > (select salary from employee where Employee_Name = 'Neha');

 select Employee_Name, Department, city
 from Employee
 where department IN (select Department from employee where City = 'Mumbai');






