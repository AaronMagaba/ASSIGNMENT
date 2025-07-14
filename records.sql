-- Active: 1752513978235@@127.0.0.1@3306@studentsrecords


CREATE DATABASE studentsRecords;

USE studentsRecords;

CREATE TABLE students(
    student_id INT PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female'),
    dob DATE NOT NULL,
    email VARCHAR(50),
    program VARCHAR(50),
    year_of_study INT
);

CREATE TABLE courses(
    course_id INT PRIMARY KEY ,
    course_name VARCHAR(50),
    credit_units INT,
    instructor VARCHAR(50)
);

CREATE TABLE registrations(
    registration_id INT PRIMARY KEY ,
    student_id INT,
    course_id INT,
    academic_year VARCHAR(9) NOT NULL,
    semester ENUM('semester 1', 'semester 2'),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE grades(
    grade_id INT PRIMARY KEY ,
    registration_id INT,
    marks INT,
    grade VARCHAR(2),
    FOREIGN KEY (registration_id) REFERENCES registrations(registration_id)
);



INSERT INTO students
VALUES 
(1,'John', 'Doe', 'Male', '2002-05-15', 'johndoe@ucu.ac.ug', 'Computer Science', 3),
(2,'Jane', 'Sandrah', 'Female', '2001-08-22', 'janesandrah@ucu.ac.ug', 'Information Systems', 2),
(3,'Mark', 'Olowo', 'Male', '2003-01-11', 'markolowo@ucu.ac.ug', 'Software Engineering', 1),
(4,'Emily', 'Jones', 'Female', '2000-12-09', 'emilyjones@ucu.ac.ug', 'Computer Science', 4),
(5,'Alex', 'Johnson', 'Male', '2002-03-17', 'alexjohnson@ucu.ac.ug', 'Information Systems', 3),
(6,'Linda', 'Martha', 'Female', '2001-07-29', 'lindakim@ucu.ac.ug', 'Computer Science', 2),
(7,'David', 'Lodan', 'Male', '2003-02-05', 'davidlodan@ucu.ac.ug', 'Software Engineering', 1),
(8,'Sophia', 'Martins', 'Female', '2000-06-19', 'sophiamartins@ucu.ac.ug', 'Information Systems', 4),
(9,'Brian', 'Clark', 'Male', '2002-11-02', 'brianclark@ucu.ac.ug', 'Computer Science', 3),
(10,'Grace', 'Ganja', 'Female', '2001-09-14', 'graceganja@ucu.ac.ug', 'Software Engineering', 2);


INSERT INTO courses
VALUES
(1,'Datascience',4, 'Dr. Bitalo'),
(2,'Software Engineering', 3, 'Prof. Grace'),
(3,'Information Technology', 3, 'Dr.Ndibtya'),
(4,'Journalism',4, 'Mr.Kenneth'),
(5,'Civil Engineering', 4, 'Dr.Kasanda ');


INSERT INTO registrations 
VALUES
(100,1, 1, '2024/2025', 'semester 1'),
(101,1, 2, '2024/2025', 'semester 2'),
(102,8, 3, '2024/2025', 'semester 1'),
(103,2, 1, '2024/2025', 'semester 1'),
(104,8, 4, '2024/2025', 'semester 1'),
(105,3, 2, '2024/2025', 'semester 1'),
(106,3, 3, '2024/2025', 'semester 1'),
(107,3, 5, '2024/2025', 'semester 2'),
(108,4, 1, '2024/2025', 'semester 2'),
(109,4, 5, '2024/2025', 'semester 1'),
(110,5, 2, '2024/2025', 'semester 1'),
(111,9, 3, '2024/2025', 'semester 2'),
(112,5, 4, '2024/2025', 'semester 1'),
(113,6, 1, '2024/2025', 'semester 1'),
(114,6, 5, '2024/2025', 'semester 2'),
(115,7, 3, '2024/2025', 'semester 1'),
(116,7, 4, '2024/2025', 'semester 1'),
(117,8, 2, '2024/2025', 'semester 2'),
(118,8, 5, '2024/2025', 'semester 2'),
(119,9, 1, '2024/2025', 'semester 1');


INSERT INTO grades 
VALUES
(1,100, 75, 'A'),
(2,101, 68, 'B'),
(3,102, 55, 'C'),
(4,103, 80, 'A'),
(5,104, 60, 'C'),
(6,105, 72, 'B'),
(7,106, 49, 'F'),
(8,107, 90, 'A'),
(9,108, 88, 'A'),
(10,109, 66, 'C'),
(11,110, 53, 'C'),
(12,111, 47, 'F'),
(13,112, 78, 'B'),
(14,113, 82, 'A'),
(15,114, 59, 'D'),
(16,115, 70, 'B'),
(17,116, 63, 'C'),
(18,117, 85, 'A'),
(19,118, 95, 'A'),
(20,119, 50, 'D');


SELECT s.student_id, s.first_name, s.last_name, COUNT(r.registration_id) AS course_count
FROM students s
JOIN registrations r ON s.student_id = r.student_id
GROUP BY s.student_id
HAVING course_count > 2;


SELECT s.first_name, s.last_name, c.course_name, g.marks, g.grade
FROM students s
JOIN registrations r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id
JOIN grades g ON r.registration_id = g.registration_id
ORDER BY s.student_id;


SELECT c.course_name, AVG(g.marks) AS average_marks
FROM courses c
JOIN registrations r ON c.course_id = r.course_id
JOIN grades g ON r.registration_id = g.registration_id
GROUP BY c.course_name;

SELECT DISTINCT s.student_id, s.first_name, s.last_name, g.marks
FROM students s
JOIN registrations r ON s.student_id = r.student_id
JOIN grades g ON r.registration_id = g.registration_id
WHERE g.marks < 50;













































