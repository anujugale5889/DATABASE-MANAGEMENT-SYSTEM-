-- Practical 8: Inner and outer joins

CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

CREATE TABLE IF NOT EXISTS Join_Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS Join_Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT
);

INSERT INTO Join_Department VALUES
(1, 'AIDS'), (2, 'CSE'), (3, 'ECE')
ON DUPLICATE KEY UPDATE department_name = VALUES(department_name);

INSERT INTO Join_Student VALUES
(101, 'Anuj', 1), (102, 'Rahul', 2), (103, 'Aarav', 1), (104, 'Meera', NULL)
ON DUPLICATE KEY UPDATE student_name = VALUES(student_name);

-- INNER JOIN returns matching rows.
SELECT s.student_name, d.department_name
FROM Join_Student s
INNER JOIN Join_Department d
ON s.department_id = d.department_id;

-- LEFT JOIN keeps every student.
SELECT s.student_name, d.department_name
FROM Join_Student s
LEFT JOIN Join_Department d
ON s.department_id = d.department_id;

-- RIGHT JOIN keeps every department.
SELECT s.student_name, d.department_name
FROM Join_Student s
RIGHT JOIN Join_Department d
ON s.department_id = d.department_id;

-- MySQL does not directly support FULL OUTER JOIN.
-- UNION combines the left and right join results.
SELECT s.student_name, d.department_name
FROM Join_Student s
LEFT JOIN Join_Department d ON s.department_id = d.department_id
UNION
SELECT s.student_name, d.department_name
FROM Join_Student s
RIGHT JOIN Join_Department d ON s.department_id = d.department_id;
