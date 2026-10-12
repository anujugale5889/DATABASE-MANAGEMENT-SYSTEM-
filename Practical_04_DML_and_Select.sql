-- Practical 4: DML commands and basic SELECT

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE IF NOT EXISTS Student_DML (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    department VARCHAR(30),
    marks INT
);

INSERT INTO Student_DML VALUES
(1, 'Anuj', 'AIDS', 78),
(2, 'Rahul', 'CSE', 82),
(3, 'Aarav', 'AIDS', 74);

SELECT * FROM Student_DML;
SELECT student_name, marks FROM Student_DML;
SELECT * FROM Student_DML WHERE marks >= 80;

UPDATE Student_DML
SET marks = 80
WHERE student_id = 1;

SELECT * FROM Student_DML;

DELETE FROM Student_DML
WHERE student_id = 3;

SELECT * FROM Student_DML;
