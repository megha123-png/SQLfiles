create database clause;
use clause;

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);

INSERT INTO Employees
(Emp_ID, Emp_Name, Department, Salary, City)
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

SELECT * FROM Employees;

SELECT Department, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department;  

SELECT Department, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department
having AVG(Salary) >20000;

select city, sum(salary) as total_Salary
from Employees

select * ,
row number () over (order by salary desc) as row_number
from Employees;

SELECT *,
    ROW_NUMBER() OVER (ORDER BY Emp_ID) AS Row_Num
FROM Employees;

SELECT *,
    ROW_NUMBER() OVER (partition by Department ORDER BY Salary desc) as row_num
FROM Employees;

SELECT *,
    ROW_NUMBER() OVER ( ORDER BY Salary desc) as row_num
FROM Employees;

SELECT *,
    rank() OVER ( ORDER BY Salary desc) as row_num
FROM Employees;

SELECT *,
    rank() OVER ( ORDER BY Salary) as row_num
FROM Employees;

SELECT *,
    DENSE_RANK() OVER ( ORDER BY Salary) as row_num
FROM Employees;


SELECT *,
    DENSE_RANK() OVER ( partition by Department ORDER BY Salary) as row_num
FROM Employees;

SELECT *,
    NTILE(2) OVER ( ORDER BY Salary) as row_num
FROM Employees;

delete from Employees
where Emp_ID = 108;

Select * from Employees;

SELECT *,
    NTILE(2) OVER ( ORDER BY Salary) as row_num
FROM Employees;

SELECT *,
    NTILE(4) OVER ( ORDER BY Salary) as row_num
FROM Employees;

SELECT *,
 SUM(Salary)
 over(partition by Department ORDER BY emp_id
 ) AS running_total
 FROM Employees;
 
 
 SELECT *,
 SUM(Salary)
 over(partition by Department ORDER BY emp_id
 ) AS dept_running_count
 FROM Employees;
 
 SELECT *,
 count(Salary)
 over(partition by Department ORDER BY emp_id
 ) AS dept_running_count
 FROM Employees;
 
 select *,
 round(
     salary * 100.0/sum(salary) over (), 0) as contribution_percentage
     FROM Employees;
 






