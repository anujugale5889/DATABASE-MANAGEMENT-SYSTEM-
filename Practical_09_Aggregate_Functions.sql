-- Practical 9: Aggregate functions, GROUP BY and HAVING

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE IF NOT EXISTS Exam_Result (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO Exam_Result VALUES
(1, 'Anuj', 'AIDS', 78),
(2, 'Rahul', 'CSE', 82),
(3, 'Aarav', 'AIDS', 74),
(4, 'Meera', 'CSE', 90),
(5, 'Kabir', 'ECE', 69)
ON DUPLICATE KEY UPDATE marks = VALUES(marks);

SELECT COUNT(*) AS total_students FROM Exam_Result;
SELECT SUM(marks) AS total_marks FROM Exam_Result;
SELECT AVG(marks) AS average_marks FROM Exam_Result;
SELECT MAX(marks) AS highest_marks FROM Exam_Result;
SELECT MIN(marks) AS lowest_marks FROM Exam_Result;

SELECT department, COUNT(*) AS student_count, AVG(marks) AS average_marks
FROM Exam_Result
GROUP BY department;

SELECT department, AVG(marks) AS average_marks
FROM Exam_Result
GROUP BY department
HAVING AVG(marks) >= 80;
