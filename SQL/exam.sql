create database companyDB;
use companyDB;

create table Employee(
Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR(50) NOT NULL,
Department VARCHAR(30),
Salary DECIMAL(10,2) CHECK (Salary > 0),
Joining_Date DATE
);

select * from Employee;

ALTER TABLE Employee
ADD Email VARCHAR(100) UNIQUE;

ALTER TABLE Employee
MODIFY Salary DECIMAL(10,2) CHECK (Salary > 0);

