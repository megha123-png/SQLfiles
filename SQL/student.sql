create database student;
use student;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Gender CHAR(1),
    Email VARCHAR(100) UNIQUE,
    Course VARCHAR(50),
    Admission_Date DATE
);

select * from student;

