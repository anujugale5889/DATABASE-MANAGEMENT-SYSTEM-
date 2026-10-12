-- Practical 6: Arithmetic, relational and logical operators

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE IF NOT EXISTS Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

INSERT INTO Staff VALUES
(1, 'Meera', 'IT', 30000),
(2, 'Amit', 'HR', 25000),
(3, 'Neha', 'IT', 36000),
(4, 'Kabir', 'Sales', 22000)
ON DUPLICATE KEY UPDATE staff_name = VALUES(staff_name);

-- Arithmetic operator
SELECT staff_name, salary, salary * 12 AS annual_salary
FROM Staff;

-- Relational operator
SELECT * FROM Staff WHERE salary > 25000;

-- AND and OR
SELECT * FROM Staff
WHERE department = 'IT' AND salary >= 30000;

SELECT * FROM Staff
WHERE department = 'HR' OR department = 'Sales';

-- NOT, BETWEEN and IN
SELECT * FROM Staff WHERE NOT department = 'HR';
SELECT * FROM Staff WHERE salary BETWEEN 22000 AND 30000;
SELECT * FROM Staff WHERE department IN ('IT', 'Sales');
