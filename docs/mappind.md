# 🎓 University Database Mapping

---

## 🎭 STUDENT_CLUB

STUDENT_CLUB
(
    Club_ID 🔑 PRIMARY KEY,
    Club_Name
)

---

## 👨‍🎓 STUDENT

STUDENT
(
    Student_ID 🔑 PRIMARY KEY,
    Student_Name,
    Birth_Date,
    Email,
    Uni_ID,
    Issue_Date
)

---

## 🤝 JOIN

JOIN
(
    Club_ID 🔑 PRIMARY KEY,
    Student_ID 🔑 PRIMARY KEY,
    
    -- Composite Primary Key (Club_ID, Student_ID)

    Club_ID 🔗 FOREIGN KEY → STUDENT_CLUB(Club_ID),
    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID)
)

---

## 📱 STUDENT_PHONE

STUDENT_PHONE
(
    Student_ID 🔑 PRIMARY KEY,
    Phone_Number 🔑 PRIMARY KEY,

    -- Composite Primary Key (Student_ID, Phone_Number)

    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID)
)

---

## 🎓 GRADUATION_PROJECT

GRADUATION_PROJECT (weak entity)
(
    GP_ID 🔑 PRIMARY KEY,
    Student_ID 🔑 PRIMARY KEY, GP_Name,

    -- Composite Primary Key (GP_ID, Student_ID)
    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID)
)

---

## 👨‍🏫 PROFESSOR

PROFESSOR
(
    Professor_ID 🔑 PRIMARY KEY,
    Professor_Name,
    Department_ID 🔗 FOREIGN KEY → DEPARTMENT(Department_ID)
)

---

## 🏛️ DEPARTMENT

DEPARTMENT
(
    Department_ID 🔑 PRIMARY KEY,
    Department_Name,
    Professor_ID 🔗 FOREIGN KEY → PROFESSOR(Professor_ID)
)

---

## 🔬 RESEARCH_PROJECT (weak entity)

RESEARCH_PROJECT
(
    RP_ID 🔑 PRIMARY KEY,
    Department_ID 🔑 PRIMARY KEY,RP_Name,

    -- Composite Primary Key (RP_ID, Department_ID)
    Department_ID 🔗 FOREIGN KEY → DEPARTMENT(Department_ID)
)

---

## 🤝 COLLABORATE

COLLABORATE
(
    Student_ID 🔑 PRIMARY KEY,
    Professor_ID 🔑 PRIMARY KEY,
    Department_ID 🔑 PRIMARY KEY,
    RP_ID,Department_ID  🔑 PRIMARY KEY,
    -- Composite Primary Key (Student_ID, Professor_ID,Department_ID,RP_ID,Department_ID)

    Department_ID 🔗 FOREIGN KEY → DEPARTMENT(Department_ID),
    RP_ID 🔗 FOREIGN KEY → RESEARCH_PROJECT(RP_ID),
    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID),
    Professor_ID 🔗 FOREIGN KEY → PROFESSOR(Professor_ID)
)

---

## 📚 COURSE

COURSE
(
    Course_ID 🔑 PRIMARY KEY,
    Course_Name
)

---

## 📝 ENROLL

ENROLL
(
    Course_ID 🔑 PRIMARY KEY,
    Student_ID 🔑 PRIMARY KEY,

    -- Composite Primary Key (Course_ID, Student_ID)

    Grade,

    Course_ID 🔗 FOREIGN KEY → COURSE(Course_ID),
    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID)
)

---

## 📚 LIBRARY

LIBRARY
(
    Name 🔑 PRIMARY KEY
)

---

## 📖 BOOK

BOOK
(
    Book_ID 🔑 PRIMARY KEY,
    Name,

    Name 🔗 FOREIGN KEY → LIBRARY(Name)
)

---

## 📖 BORROW

BORROW
(
    Student_ID 🔑 PRIMARY KEY,
    Book_ID 🔑 PRIMARY KEY,

    -- Composite Primary Key (Student_ID, Book_ID)

    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID),
    Book_ID 🔗 FOREIGN KEY → BOOK(Book_ID)
)

---

## 👨‍🏫 SUPERVISE

SUPERVISE
(
    GP_ID 🔑 PRIMARY KEY,
    Student_ID 🔑 PRIMARY KEY,
    Professor_ID 🔑 PRIMARY KEY,

    -- Composite Primary Key (GP_ID, Student_ID, Professor_ID)

    GP_ID 🔗 FOREIGN KEY → GRADUATION_PROJECT(GP_ID),
    Student_ID 🔗 FOREIGN KEY → STUDENT(Student_ID),
    Professor_ID 🔗 FOREIGN KEY → PROFESSOR(Professor_ID)
)