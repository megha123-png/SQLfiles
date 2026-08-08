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


select * from Employee;

insert into Employee
(Employee_ID, Employee_Name, Department, Salary, Joining_Date, Email)
values
(101, 'Megha', 'IT', 45000, '2024-01-15', 'megha@gmail.com'),
(102, 'Rahul', 'HR', 40000, '2024-03-10', 'rahul@gmail.com'),
(103, 'Priya', 'Finance', 50000, '2023-07-20', 'priya@gmail.com'),
(104, 'Amit', 'Sales', 38000, '2024-05-05', 'amit@gmail.com'),
(105, 'Neha', 'IT', 55000, '2023-11-12', 'neha@gmail.com'); 

Update Employee
set Department = "marketing"
where Employee_ID = 105;

select * from Employee;

update Employee
set Salary =
case
   when Department = 'IT' then Salary * 1.15
   when Department = 'HR' then Salary * 1.10
else salary
END;

set sql_safe_updates= 0;

update Employee
set Salary =
case
   when Department = 'IT' then Salary * 1.15
   when Department = 'HR' then Salary * 1.10
else salary
END;

delete from Employee
where Employee_ID = 105;

delete from Employee
where Employee_Name = 'Amit'
and Employee_ID = 104;

delete from Employee
where Employee_Name in ( 'Rahul', 'priya');

set sql_safe_updates= 0;

delete from Employee
where Employee_Name in ('Rahul', 'priya');

delete from Employee
where Employee_Name = 'Megha'
and Employee_ID = 101;

delete from employee
where salary > 40000;

insert into Employee
(Employee_ID, Employee_Name, Department, Salary, Joining_Date, Email)
values
(101, 'Megha', 'IT', 45000, '2024-01-15', 'megha@gmail.com'),
(102, 'Rahul', 'HR', 40000, '2024-03-10', 'rahul@gmail.com'),
(103, 'Priya', 'Finance', 50000, '2023-07-20', 'priya@gmail.com'),
(104, 'Amit', 'Sales', 38000, '2024-05-05', 'amit@gmail.com'),
(105, 'Neha', 'IT', 55000, '2023-11-12', 'neha@gmail.com');

delete from employee
where employee_id =
    case
    when Department = 'IT' then 101
    when Department = 'HR' then 102
    else 0
    end;
    
    select * from employee;