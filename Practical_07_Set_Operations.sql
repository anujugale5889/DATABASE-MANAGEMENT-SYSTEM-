-- Practical 7: Set operations

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE IF NOT EXISTS Club_A (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Club_B (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO Club_A VALUES
(1, 'Anuj'), (2, 'Rahul'), (3, 'Aarav')
ON DUPLICATE KEY UPDATE student_name = VALUES(student_name);

INSERT INTO Club_B VALUES
(2, 'Rahul'), (3, 'Aarav'), (4, 'Meera')
ON DUPLICATE KEY UPDATE student_name = VALUES(student_name);

-- UNION removes duplicate rows.
SELECT student_id, student_name FROM Club_A
UNION
SELECT student_id, student_name FROM Club_B;

-- UNION ALL keeps duplicates.
SELECT student_id, student_name FROM Club_A
UNION ALL
SELECT student_id, student_name FROM Club_B;

-- MySQL 8.0.31+ supports INTERSECT and EXCEPT.
-- For earlier MySQL versions, use the alternatives below.
SELECT student_id, student_name FROM Club_A
INTERSECT
SELECT student_id, student_name FROM Club_B;

SELECT student_id, student_name FROM Club_A
EXCEPT
SELECT student_id, student_name FROM Club_B;

-- Compatible alternatives for older MySQL versions:
SELECT a.student_id, a.student_name
FROM Club_A a
INNER JOIN Club_B b ON a.student_id = b.student_id;

SELECT a.student_id, a.student_name
FROM Club_A a
LEFT JOIN Club_B b ON a.student_id = b.student_id
WHERE b.student_id IS NULL;
