-- Practical 2: ER diagram and relational schema

/*
Aim: To design a small college database and map the entities to tables.

Entities: Department, Student, Course and Enrollment.
Primary keys identify each record. Foreign keys connect related tables.

ER diagram (Mermaid):
Department ||--o{ Student : has
Department ||--o{ Course : offers
Student ||--o{ Enrollment : registers
Course ||--o{ Enrollment : includes
*/

CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(80) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(60) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    semester INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Department VALUES
(1, 'AIDS'),
(2, 'Computer Science');

INSERT INTO Student VALUES
(101, 'Anuj Ugale', 'anuj@example.com', 1),
(102, 'Rahul Patil', 'rahul@example.com', 2);

INSERT INTO Course VALUES
(201, 'DBMS', 1),
(202, 'Programming in C', 2);

INSERT INTO Enrollment VALUES
(101, 201, 3),
(102, 202, 3);

SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;
