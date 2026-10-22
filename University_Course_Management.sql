DROP DATABASE IF EXISTS UniversityDB;
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 5. Departments
CREATE TABLE Departments (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- 1. Students
CREATE TABLE Students (
    StudentID      INT PRIMARY KEY,
    FirstName      VARCHAR(50)  NOT NULL,
    LastName       VARCHAR(50)  NOT NULL,
    Email          VARCHAR(100) NOT NULL UNIQUE,
    BirthDate      DATE,
    EnrollmentDate DATE
);

-- 2. Courses
CREATE TABLE Courses (
    CourseID       INT PRIMARY KEY,
    CourseName     VARCHAR(100) NOT NULL,
    DepartmentID   INT NOT NULL,
    Credits        INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 3. Instructors
-- NOTE: the project brief has no Salary field, but Query 8 needs one,
--       so a Salary column is added here.
CREATE TABLE Instructors (
    InstructorID   INT PRIMARY KEY,
    FirstName      VARCHAR(50)  NOT NULL,
    LastName       VARCHAR(50)  NOT NULL,
    Email          VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID   INT NOT NULL,
    Salary         DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 4. Enrollments
CREATE TABLE Enrollments (
    EnrollmentID   INT AUTO_INCREMENT PRIMARY KEY,
    StudentID      INT NOT NULL,
    CourseID       INT NOT NULL,
    EnrollmentDate DATE,
    UNIQUE (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Courses(CourseID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1,  'Anuj',   'Bambhaniya',     'mrbambhaniya3003@gmail.com',     '2000-01-15', '2022-08-01'),
(2,  'Vishwa',   'Ambaliya',   'vishwaambaliya1216@gmail.com',   '1999-05-25', '2021-08-01'),
(3,  'Aarav',  'Vala',   'aarav1234@gmail.com',  '2001-03-12', '2023-08-01'),
(4,  'Kruti',  'Chudasama',    'krutiichudasama1711@gmail.com',   '2002-07-19', '2023-08-01'),
(5,  'Rohan',  'Revar',   'revarrohan099@gmail.com',  '2001-11-02', '2022-09-01'),
(6,  'Priya',  'Gohil',    'priyagohil276@gmail.com',   '2003-02-28', '2024-08-01'),
(7,  'Kevin',  'Patel',   'kevinpatel07@gmail.com',  '2002-09-09', '2024-01-15'),
(8,  'Hiten',   'Chauhan',    'hitencreation1204@gmail.com',    '2000-12-05', '2020-08-01'),
(9,  'Dev',    'Mevada',   'devmevada0864@gmail.com',    '2003-06-17', '2025-08-01'),
(10, 'Darshik',   'Rathod',   'darshikrathod1213@gmail.com',   '2002-04-21', '2023-01-10'),
(11, 'Parth',   'Chudasama', 'parth65@gmail.c0om', '2001-08-30', '2021-09-01'),
(12, 'Bhavdip',  'Bambhaniya', 'bhavdipbambhaniya890@gmail.com',    '2003-10-10', '2025-01-20'),
(13, 'Vikram', 'Baraiya',   'baraiyavikram25@gmail.com', '2000-05-05', '2022-01-10'),
(14, 'Prince',   'Rathod',    'princerathod76@gmail.com',    '2002-01-01', '2024-08-01');

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL',   1, 3),
(102, 'Data Structures',       2, 4),
(103, 'Calculus',              2, 4),
(104, 'Linear Algebra',        2, 3),
(105, 'Database Systems',      1, 4),
(106, 'Statistics',            2, 3),
(107, 'Algorithms',            1, 4),
(108, 'Discrete Mathematics',  2, 3),
(109, 'Number Theory',         2, 2);

INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1, 'Vijay', 'Thalapathy', 'vijay@univ.com', 1, 85000.00),
(2, 'Madara',   'Uchiha',     'madarauchiha@univ.com',       2, 78000.00),
(3, 'Obito', 'Uchiha',   'obito@univ.com',   1, 92000.00),
(4, 'Rin', 'Nohara',   'rinnohara@univ.com',   2, 81000.00),
(5, 'Shinchan',  'Nohara',   'shinchan@univ.com',    1, 70000.00);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
-- Introduction to SQL (101): 11 students in total
(3, 101, '2023-08-01'), (4, 101, '2023-08-01'), (5, 101, '2022-09-01'),
(6, 101, '2024-08-01'), (7, 101, '2024-01-15'), (8, 101, '2020-08-01'),
(9, 101, '2025-08-01'), (10, 101, '2023-01-10'), (11, 101, '2021-09-01'),
(12, 101, '2025-01-20'),
-- Data Structures (102): 6 students in total
(1, 102, '2022-08-01'), (3, 102, '2023-09-01'), (5, 102, '2022-09-01'),
(13, 102, '2022-01-10'), (11, 102, '2021-09-01'),
-- Other courses
(4, 103, '2023-08-01'), (6, 103, '2024-08-01'), (8, 103, '2020-08-01'),
(3, 104, '2023-08-01'), (9, 104, '2025-08-01'),
(7, 105, '2024-01-15'), (10, 105, '2023-01-10'), (12, 105, '2025-01-20'),
(5, 106, '2022-09-01'), (13, 106, '2022-01-10'),
(11, 107, '2021-09-01'),
(6, 108, '2024-08-01');

-- Quick check
SELECT (SELECT COUNT(*) FROM Students)    AS students,
       (SELECT COUNT(*) FROM Courses)     AS courses,
       (SELECT COUNT(*) FROM Instructors) AS instructors,
       (SELECT COUNT(*) FROM Enrollments) AS enrollments,
       (SELECT COUNT(*) FROM Departments) AS departments;


-- ---- CREATE ----
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (3, 'Physics');

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES (100, 'Test', 'User', 'test.user@email.com', '2001-01-01', '2024-08-01');

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (200, 'Quantum Basics', 3, 3);

INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES (100, 'Zed', 'Walker', 'zed.walker@univ.com', 3, 65000.00);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES (100, 200, '2024-08-01');

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;

UPDATE Departments SET DepartmentName = 'Applied Physics' WHERE DepartmentID = 3;
UPDATE Students    SET Email = 'test.user.new@email.com'   WHERE StudentID = 100;
UPDATE Courses     SET Credits = 4                         WHERE CourseID = 200;
UPDATE Instructors SET Salary = 70000.00                   WHERE InstructorID = 100;
UPDATE Enrollments SET EnrollmentDate = '2024-09-01'       WHERE StudentID = 100 AND CourseID = 200;

SELECT * FROM Students    WHERE StudentID = 100;
SELECT * FROM Instructors WHERE InstructorID = 100;

DELETE FROM Enrollments WHERE StudentID = 100 AND CourseID = 200;
DELETE FROM Instructors WHERE InstructorID = 100;
DELETE FROM Courses     WHERE CourseID = 200;
DELETE FROM Students    WHERE StudentID = 100;
DELETE FROM Departments WHERE DepartmentID = 3;


SELECT StudentID, FirstName, LastName, EnrollmentDate
FROM   Students
WHERE  EnrollmentDate > '2022-12-31'
ORDER  BY EnrollmentDate;


SELECT c.CourseID, c.CourseName, c.Credits
FROM   Courses c
JOIN   Departments d ON d.DepartmentID = c.DepartmentID
WHERE  d.DepartmentName = 'Mathematics'
ORDER  BY c.CourseID
LIMIT  5;

SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS student_count
FROM   Courses c
JOIN   Enrollments e ON e.CourseID = c.CourseID
GROUP  BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5
ORDER  BY student_count DESC;


SELECT s.StudentID, s.FirstName, s.LastName
FROM   Students s
JOIN   Enrollments e ON e.StudentID = s.StudentID
JOIN   Courses c     ON c.CourseID  = e.CourseID
WHERE  c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP  BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM   Students s
JOIN   Enrollments e ON e.StudentID = s.StudentID
JOIN   Courses c     ON c.CourseID  = e.CourseID
WHERE  c.CourseName = 'Introduction to SQL'
   OR  c.CourseName = 'Data Structures'
ORDER  BY s.StudentID;


SELECT ROUND(AVG(Credits), 2) AS avg_credits
FROM   Courses;


SELECT MAX(i.Salary) AS max_salary_cs
FROM   Instructors i
JOIN   Departments d ON d.DepartmentID = i.DepartmentID
WHERE  d.DepartmentName = 'Computer Science';


SELECT d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS student_count
FROM   Departments d
LEFT JOIN Courses c     ON c.DepartmentID = d.DepartmentID
LEFT JOIN Enrollments e ON e.CourseID     = c.CourseID
GROUP  BY d.DepartmentID, d.DepartmentName
ORDER  BY student_count DESC;


SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, e.EnrollmentDate
FROM   Students s
INNER JOIN Enrollments e ON e.StudentID = s.StudentID
INNER JOIN Courses c     ON c.CourseID  = e.CourseID
ORDER  BY s.StudentID, c.CourseID;


SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM   Students s
LEFT JOIN Enrollments e ON e.StudentID = s.StudentID
LEFT JOIN Courses c     ON c.CourseID  = e.CourseID
ORDER  BY s.StudentID, c.CourseID;


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM   Students s
JOIN   Enrollments e ON e.StudentID = s.StudentID
WHERE  e.CourseID IN (
           SELECT CourseID
           FROM   Enrollments
           GROUP  BY CourseID
           HAVING COUNT(*) > 10
       )
ORDER  BY s.StudentID;

SELECT StudentID, FirstName, LastName, EnrollmentDate,
       EXTRACT(YEAR FROM EnrollmentDate) AS enrollment_year
FROM   Students
ORDER  BY StudentID;

SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS instructor_full_name
FROM   Instructors;

SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID)                              AS students_in_course,
       SUM(COUNT(e.StudentID)) OVER (ORDER BY c.CourseID) AS running_total
FROM   Courses c
LEFT JOIN Enrollments e ON e.CourseID = c.CourseID
GROUP  BY c.CourseID, c.CourseName
ORDER  BY c.CourseID;

SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR) THEN 'Senior'
           ELSE 'Junior'
       END AS student_level
FROM   Students
ORDER  BY EnrollmentDate;
