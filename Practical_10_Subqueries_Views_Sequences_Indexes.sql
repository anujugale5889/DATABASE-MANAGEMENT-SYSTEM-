-- Practical 10: Subqueries, views, sequences and indexes

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE IF NOT EXISTS Student_Final (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO Student_Final VALUES
(1, 'Anuj', 'AIDS', 78),
(2, 'Rahul', 'CSE', 82),
(3, 'Aarav', 'AIDS', 74),
(4, 'Meera', 'CSE', 90)
ON DUPLICATE KEY UPDATE marks = VALUES(marks);

-- Subquery: students with marks above the average.
SELECT student_name, marks
FROM Student_Final
WHERE marks > (SELECT AVG(marks) FROM Student_Final);

-- View
CREATE OR REPLACE VIEW High_Scorers AS
SELECT student_id, student_name, marks
FROM Student_Final
WHERE marks >= 80;

SELECT * FROM High_Scorers;

-- Index
CREATE INDEX idx_student_department
ON Student_Final(department);

-- MySQL normally uses AUTO_INCREMENT instead of SEQUENCE.
CREATE TABLE IF NOT EXISTS Sequence_Demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note VARCHAR(50)
);

INSERT INTO Sequence_Demo (note) VALUES ('First entry'), ('Second entry');
SELECT * FROM Sequence_Demo;

-- Oracle sequence example (run in Oracle, not MySQL):
-- CREATE SEQUENCE student_seq START WITH 1 INCREMENT BY 1;
-- SELECT student_seq.NEXTVAL FROM dual;
