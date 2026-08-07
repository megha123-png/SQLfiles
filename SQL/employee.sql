create database Employee;
use Employee;

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50) NOT NULL,
    Department VARCHAR(30),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Joining_Date DATE,
    Email VARCHAR(100) UNIQUE,
    IsActive BIT DEFAULT 1
);

select * from Employee;
