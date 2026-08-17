create database comapnyDB;
Use comapnyDB;

create table deapartment (
DeptID INT PRIMARY KEY,
DeptName varchar(30) Not null
);

create table Employee(
Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR(50) NOT NULL,
Department VARCHAR(30),
Salary DECIMAL(10,2) CHECK (Salary > 0),
Joining_Date DATE
);

ALTER TABLE Employee
ADD DeptID INT;

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Department
FOREIGN KEY (DeptID)
REFERENCES deapartment(DeptID);

ALTER TABLE Employee
ADD Email VARCHAR(100) UNIQUE;

ALTER TABLE Employee
MODIFY Salary DECIMAL(10,2) NOT NULL;

ALTER TABLE Employee
MODIFY Department VARCHAR(50);

ALTER TABLE Employee
Rename column Employee_Name to Full_name;

select * from employee;

RENAME TABLE Employee TO STAFF;

ALTER TABLE STAFF
DROP column Email;

insert into STAFF
(Employee_ID, Full_Name, Department, Salary, Joining_Date)
values
(101, 'Meghachoudam ', 'IT', 45000, '2024-01-15'),
(102, 'Rahulsharma', 'HR', 40000, '2024-03-10'),
(103, 'Priyabapat', 'Finance', 50000, '2023-07-20'),
(104, 'Amitguhati', 'Sales', 38000, '2024-05-05'),
(105, 'Nehapatil', 'IT', 55000, '2023-11-12');

truncate table STAFF;

DROP TABLE Deapartment;

insert into STAFF
(Employee_ID, Full_Name, Department, Salary, Joining_Date)
values
(101, 'Meghachoudam ', 'IT', 45000, '2024-01-15'),
(102, 'Rahulsharma', 'HR', 40000, '2024-03-10'),
(103, 'Priyabapat', 'Finance', 50000, '2023-07-20'),
(104, 'Amitguhati', 'Sales', 38000, '2024-05-05'),
(105, 'Nehapatil', 'IT', 55000, '2023-11-12');

Update STAFF
set Salary  = 55000
where Employee_ID = 101; 

Update STAFF
set Salary  = 38000 *1.10
where Department = 'sales';

Delete From STAFF
Where Employee_ID = 105;

select * from STAFF;

Delete From STAFF
Where Joining_Date < '2020-01-01';

Create index Department_index on STAFF (Department);
