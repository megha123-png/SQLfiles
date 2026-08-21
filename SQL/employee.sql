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
    
    INSERT INTO Employee
(Employee_ID, Employee_Name, Department, Salary, Joining_Date, Email)
VALUES
(111, 'Amit Sharma', 'IT', 55000, '2022-01-15', 'amit.sharma@gmail.com'),
(112, 'Priya Patil', 'HR', 45000, '2021-03-20', 'priya.patil@gmail.com'),
(113, 'Rahul Jadhav', 'Finance', 60000, '2020-07-10', 'rahul.jadhav@gmail.com'),
(114, 'Sneha Kulkarni', 'Sales', 48000, '2023-02-05', 'sneha.kulkarni@gmail.com'),
(115, 'Neha Deshmukh', 'IT', 65000, '2019-11-25', 'neha.deshmukh@gmail.com'),
(116, 'Rohit Pawar', 'HR', 42000, '2022-06-18', 'rohit.pawar@gmail.com'),
(117, 'Pooja Shinde', 'Sales', 52000, '2021-09-12', 'pooja.shinde@gmail.com'),
(118, 'Akash More', 'Finance', 70000, '2018-04-30', 'akash.more@gmail.com'),
(119, 'Kiran Joshi', 'IT', 58000, '2023-01-10', 'kiran.joshi@gmail.com'),
(120, 'Anjali Gaikwad', 'Sales', 50000, '2020-12-15', 'anjali.gaikwad@gmail.com');

CREATE TABLE Employee1 (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Joining_Date DATE,
    Email VARCHAR(100)
);

INSERT INTO Employee1
(Employee_ID, First_Name, Last_Name, Department, Salary, Joining_Date, Email)
VALUES
(101, 'Amit', 'Sharma', 'IT', 55000, '2022-01-15', 'amit.sharma@gmail.com'),
(102, 'Priya', 'Patil', 'HR', 45000, '2021-03-20', 'priya.patil@gmail.com'),
(103, 'Rahul', 'Jadhav', 'Finance', 60000, '2020-07-10', 'rahul.jadhav@gmail.com'),
(104, 'Sneha', 'Kulkarni', 'Sales', 48000, '2023-02-05', 'sneha.kulkarni@gmail.com'),
(105, 'Neha', 'Deshmukh', 'IT', 65000, '2019-11-25', 'neha.deshmukh@gmail.com'),
(106, 'Rohit', 'Pawar', 'HR', 42000, '2022-06-18', 'rohit.pawar@gmail.com'),
(107, 'Pooja', 'Shinde', 'Sales', 52000, '2021-09-12', 'pooja.shinde@gmail.com'),
(108, 'Akash', 'More', 'Finance', 70000, '2018-04-30', 'akash.more@gmail.com'),
(109, 'Kiran', 'Joshi', 'IT', 58000, '2023-01-10', 'kiran.joshi@gmail.com'),
(110, 'Anjali', 'Gaikwad', 'Sales', 50000, '2020-12-15', 'anjali.gaikwad@gmail.com');

select Employee_ID, Department, Salary, Joining_Date,Email, concat(First_name, " ",
Last_Name) as employee_full_name from Employee1;

select Employee_ID, Department, Salary, Joining_Date,Email, UPPER(First_name) as 
employee_First_name_in_upper from Employee1;

select Employee_ID, Department, Salary, Joining_Date,Email, LOWER(First_name) as 
employee_First_name_in_upper from Employee1;

ALTER TABLE Employee1
ADD PhoneNumber VARCHAR(15);

UPDATE Employee1
SET PhoneNumber =
    CASE Employee_ID
        WHEN 101 THEN '9876543210'
        WHEN 102 THEN '9876543211'
        WHEN 103 THEN '9876543212'
        WHEN 104 THEN '9876543213'
        WHEN 105 THEN '9876543214'
        WHEN 106 THEN '9876543215'
        WHEN 107 THEN '9876543216'
        WHEN 108 THEN '9876543217'
        WHEN 109 THEN '9876543218'
        WHEN 110 THEN '9876543219'
    END;
    
    set sql_safe_updates= 0;
    
    UPDATE Employee1
SET PhoneNumber =
    CASE Employee_ID
        WHEN 101 THEN '9876543210'
        WHEN 102 THEN '9876543211'
        WHEN 103 THEN '9876543212'
        WHEN 104 THEN '9876543213'
        WHEN 105 THEN '9876543214'
        WHEN 106 THEN '9876543215'
        WHEN 107 THEN '9876543216'
        WHEN 108 THEN '9876543217'
        WHEN 109 THEN '9876543218'
        WHEN 110 THEN '9876543219'
    END;
    
    
select Employee_ID, Department, Salary, Joining_Date,Email, phonenumber, length(phonenumber) as digit_of_mobile_number
from Employee1;

select *, trim(First_Name) as proper_formatting from Employee1;

select * , substring(First_Name, 2,2) as use_case_of_substring from Employee1;

select *, replace(First_Name, 'a', 'A') as replacement_of_a_with_A from Employee1;

select *, now() AS current_date_and_time from Employee1;

select *, year(Joining_Date) as year from Employee1;

select *, month(Joining_Date) as month from Employee1;

select *, day(Joining_Date) as day from Employee1;

select *, datediff(Joining_Date) as day_required_to_join_of_the_employee from Employee1;