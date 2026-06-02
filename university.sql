-- =====================================
-- 📊 UNIVERSITY DATABASE SYSTEM
-- =====================================

CREATE DATABASE University_System;
USE University_System;

-- =====================================
-- 👨‍🏫 PROFESSOR
-- =====================================
CREATE TABLE PROFESSOR (
    Professor_ID INT PRIMARY KEY,
    Professor_Name VARCHAR(200)
);

-- =====================================
-- 🏛️ DEPARTMENT
-- =====================================
CREATE TABLE DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Professor_ID INT,
    FOREIGN KEY (Professor_ID) REFERENCES PROFESSOR(Professor_ID)
);

-- =====================================
-- 👨‍🎓 STUDENT
-- =====================================
CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(200),
    Birth_Date DATE,
    Email VARCHAR(100),
    Uni_ID VARCHAR(50),
    Issue_Date DATE
);

-- =====================================
-- 📚 COURSE
-- =====================================
CREATE TABLE COURSE (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(200)
);

-- =====================================
-- 🎓 GRADUATION PROJECT
-- =====================================
CREATE TABLE GRADUATION_PROJECT (
    GP_ID INT,
    Student_ID INT,
    GP_Name VARCHAR(200),

    PRIMARY KEY (GP_ID, Student_ID),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID)
);

-- =====================================
-- 🔬 RESEARCH PROJECT
-- =====================================
CREATE TABLE RESEARCH_PROJECT (
    RP_ID INT,
    Department_ID INT,
    RP_Name VARCHAR(200),

    PRIMARY KEY (RP_ID, Department_ID),
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID)
);

-- =====================================
-- 🤝 ENROLL
-- =====================================
CREATE TABLE ENROLL (
    Course_ID INT,
    Student_ID INT,
    Grade DECIMAL(5,2),

    PRIMARY KEY (Course_ID, Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID)
);

-- =====================================
-- 📖 BOOK
-- =====================================
CREATE TABLE BOOK (
    Book_ID INT PRIMARY KEY,
    Book_Name VARCHAR(200),
    Author_Name VARCHAR(200)
);

-- =====================================
-- 📖 BORROW
-- =====================================
CREATE TABLE BORROW (
    Student_ID INT,
    Book_ID INT,

    PRIMARY KEY (Student_ID, Book_ID),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID),
    FOREIGN KEY (Book_ID) REFERENCES BOOK(Book_ID)
);

-- =====================================
-- 🤝 COLLABORATE
-- =====================================
CREATE TABLE COLLABORATE (
    Student_ID INT,
    Professor_ID INT,
    Department_ID INT,
    RP_ID INT,

    PRIMARY KEY (Student_ID, Professor_ID, RP_ID),

    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID),
    FOREIGN KEY (Professor_ID) REFERENCES PROFESSOR(Professor_ID),
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID),
    FOREIGN KEY (RP_ID) REFERENCES RESEARCH_PROJECT(RP_ID)
);

-- =====================================
-- 📥 INSERT DATA
-- =====================================

INSERT INTO PROFESSOR VALUES
(1, 'Dr. Ahmed Ali'),
(2, 'Dr. Sara Mohamed');

INSERT INTO DEPARTMENT VALUES
(10, 'Computer Science', 1),
(20, 'Information Systems', 2);

INSERT INTO STUDENT VALUES
(100, 'Omar Hassan', '2002-05-10', 'omar@gmail.com', 'U1001', '2023-09-01'),
(101, 'Mona Ali', '2001-07-15', 'mona@gmail.com', 'U1002', '2023-09-01');

INSERT INTO COURSE VALUES
(501, 'Database Systems'),
(502, 'Operating Systems');

INSERT INTO ENROLL VALUES
(501, 100, 95),
(502, 101, 88);

INSERT INTO BOOK VALUES
(900, 'Database Design', 'Elmasri'),
(901, 'Operating Systems', 'Silberschatz');

INSERT INTO BORROW VALUES
(100, 900),
(101, 901);

INSERT INTO GRADUATION_PROJECT VALUES
(1, 100, 'AI Chatbot'),
(2, 101, 'Library System');

INSERT INTO RESEARCH_PROJECT VALUES
(10, 10, 'AI Research'),
(20, 20, 'Data Mining');

INSERT INTO COLLABORATE VALUES
(100, 1, 10, 10),
(101, 2, 20, 20);

-- =====================================
-- 📊 QUERIES
-- =====================================

-- All students
SELECT * FROM STUDENT;

-- All professors
SELECT * FROM PROFESSOR;

-- Students enrolled in courses
SELECT S.Student_Name, C.Course_Name, E.Grade
FROM STUDENT S
JOIN ENROLL E ON S.Student_ID = E.Student_ID
JOIN COURSE C ON C.Course_ID = E.Course_ID;

-- Students borrowing books
SELECT S.Student_Name, B.Book_Name
FROM STUDENT S
JOIN BORROW BR ON S.Student_ID = BR.Student_ID
JOIN BOOK B ON B.Book_ID = BR.Book_ID;

-- Professors with departments
SELECT P.Professor_Name, D.Department_Name
FROM PROFESSOR P
JOIN DEPARTMENT D ON P.Professor_ID = D.Professor_ID;

-- Count students
SELECT COUNT(*) AS Total_Students FROM STUDENT;

-- Average grade
SELECT AVG(Grade) AS Average_Grade FROM ENROLL;

-- Total books
SELECT COUNT(*) AS Total_Books FROM BOOK;-- =====================================
-- 📊 UNIVERSITY DATABASE SYSTEM
-- =====================================

CREATE DATABASE University_System;
USE University_System;

-- =====================================
-- 👨‍🏫 PROFESSOR
-- =====================================
CREATE TABLE PROFESSOR (
    Professor_ID INT PRIMARY KEY,
    Professor_Name VARCHAR(200)
);

-- =====================================
-- 🏛️ DEPARTMENT
-- =====================================
CREATE TABLE DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Professor_ID INT,
    FOREIGN KEY (Professor_ID) REFERENCES PROFESSOR(Professor_ID)
);

-- =====================================
-- 👨‍🎓 STUDENT
-- =====================================
CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(200),
    Birth_Date DATE,
    Email VARCHAR(100),
    Uni_ID VARCHAR(50),
    Issue_Date DATE
);

-- =====================================
-- 📚 COURSE
-- =====================================
CREATE TABLE COURSE (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(200)
);

-- =====================================
-- 🎓 GRADUATION PROJECT
-- =====================================
CREATE TABLE GRADUATION_PROJECT (
    GP_ID INT,
    Student_ID INT,
    GP_Name VARCHAR(200),

    PRIMARY KEY (GP_ID, Student_ID),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID)
);

-- =====================================
-- 🔬 RESEARCH PROJECT
-- =====================================
CREATE TABLE RESEARCH_PROJECT (
    RP_ID INT,
    Department_ID INT,
    RP_Name VARCHAR(200),

    PRIMARY KEY (RP_ID, Department_ID),
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID)
);

-- =====================================
-- 🤝 ENROLL
-- =====================================
CREATE TABLE ENROLL (
    Course_ID INT,
    Student_ID INT,
    Grade DECIMAL(5,2),

    PRIMARY KEY (Course_ID, Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID)
);

-- =====================================
-- 📖 BOOK
-- =====================================
CREATE TABLE BOOK (
    Book_ID INT PRIMARY KEY,
    Book_Name VARCHAR(200),
    Author_Name VARCHAR(200)
);

-- =====================================
-- 📖 BORROW
-- =====================================
CREATE TABLE BORROW (
    Student_ID INT,
    Book_ID INT,

    PRIMARY KEY (Student_ID, Book_ID),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID),
    FOREIGN KEY (Book_ID) REFERENCES BOOK(Book_ID)
);

-- =====================================
-- 🤝 COLLABORATE
-- =====================================
CREATE TABLE COLLABORATE (
    Student_ID INT,
    Professor_ID INT,
    Department_ID INT,
    RP_ID INT,

    PRIMARY KEY (Student_ID, Professor_ID, RP_ID),

    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID),
    FOREIGN KEY (Professor_ID) REFERENCES PROFESSOR(Professor_ID),
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID),
    FOREIGN KEY (RP_ID) REFERENCES RESEARCH_PROJECT(RP_ID)
);

-- =====================================
-- 📥 INSERT DATA
-- =====================================

INSERT INTO PROFESSOR VALUES
(1, 'Dr. Ahmed Ali'),
(2, 'Dr. Sara Mohamed');

INSERT INTO DEPARTMENT VALUES
(10, 'Computer Science', 1),
(20, 'Information Systems', 2);

INSERT INTO STUDENT VALUES
(100, 'Omar Hassan', '2002-05-10', 'omar@gmail.com', 'U1001', '2023-09-01'),
(101, 'Mona Ali', '2001-07-15', 'mona@gmail.com', 'U1002', '2023-09-01');

INSERT INTO COURSE VALUES
(501, 'Database Systems'),
(502, 'Operating Systems');

INSERT INTO ENROLL VALUES
(501, 100, 95),
(502, 101, 88);

INSERT INTO BOOK VALUES
(900, 'Database Design', 'Elmasri'),
(901, 'Operating Systems', 'Silberschatz');

INSERT INTO BORROW VALUES
(100, 900),
(101, 901);

INSERT INTO GRADUATION_PROJECT VALUES
(1, 100, 'AI Chatbot'),
(2, 101, 'Library System');

INSERT INTO RESEARCH_PROJECT VALUES
(10, 10, 'AI Research'),
(20, 20, 'Data Mining');

INSERT INTO COLLABORATE VALUES
(100, 1, 10, 10),
(101, 2, 20, 20);

-- =====================================
-- 📊 QUERIES
-- =====================================

-- All students
SELECT * FROM STUDENT;

-- All professors
SELECT * FROM PROFESSOR;

-- Students enrolled in courses
SELECT S.Student_Name, C.Course_Name, E.Grade
FROM STUDENT S
JOIN ENROLL E ON S.Student_ID = E.Student_ID
JOIN COURSE C ON C.Course_ID = E.Course_ID;

-- Students borrowing books
SELECT S.Student_Name, B.Book_Name
FROM STUDENT S
JOIN BORROW BR ON S.Student_ID = BR.Student_ID
JOIN BOOK B ON B.Book_ID = BR.Book_ID;

-- Professors with departments
SELECT P.Professor_Name, D.Department_Name
FROM PROFESSOR P
JOIN DEPARTMENT D ON P.Professor_ID = D.Professor_ID;

-- Count students
SELECT COUNT(*) AS Total_Students FROM STUDENT;

-- Average grade
SELECT AVG(Grade) AS Average_Grade FROM ENROLL;

-- Total books
SELECT COUNT(*) AS Total_Books FROM BOOK;