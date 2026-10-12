-- Practical 1: Introduction to DBMS and its architecture

/*
Aim: To study the three-schema architecture, data abstraction and data independence.

Three-schema architecture:
1. External level - the view seen by a particular user.
2. Conceptual level - the overall logical structure of the database.
3. Internal level - how data is stored on disk.

Data abstraction hides storage details from users.
Logical data independence means changes to the conceptual schema need not change every user view.
Physical data independence means storage changes need not change the logical schema.
*/

CREATE DATABASE IF NOT EXISTS dbms_practicals;
USE dbms_practicals;

CREATE TABLE student_demo (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO student_demo VALUES
(1, 'Anuj', 'AIDS', 78),
(2, 'Rahul', 'CSE', 82),
(3, 'Aarav', 'AIDS', 74);

-- Example of an external view for a student.
CREATE OR REPLACE VIEW student_marks_view AS
SELECT student_id, student_name, marks
FROM student_demo;

SELECT * FROM student_marks_view;
