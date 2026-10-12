-- Practical 3: DDL statements and constraints

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(80) UNIQUE,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2) DEFAULT 15000
);

-- Add a column.
ALTER TABLE Employee ADD department VARCHAR(30);

INSERT INTO Employee (employee_id, employee_name, email, age, salary, department)
VALUES (1, 'Rohan', 'rohan@example.com', 21, 22000, 'IT');

SELECT * FROM Employee;

-- TRUNCATE removes all rows but keeps the table.
-- Run this only when you want to clear the table.
-- TRUNCATE TABLE Employee;

-- DROP removes the table itself.
-- DROP TABLE Employee;
