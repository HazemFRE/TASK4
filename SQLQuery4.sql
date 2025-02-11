CREATE TABLE Students (
    St_ID INT PRIMARY KEY,
    name VARCHAR(100),
    birthyear DATE,
    address VARCHAR(100)
);

CREATE TABLE family_info (
    Fa_ID INT PRIMARY KEY,
    St_ID INT UNIQUE,  -- علاقة One-to-One مع الطلاب
    name VARCHAR(100),
    phonenumber VARCHAR(15),
    Email VARCHAR(100),
    FOREIGN KEY (St_ID) REFERENCES Students(St_ID) ON DELETE CASCADE
);

CREATE TABLE Courses (
    Co_ID INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    resource VARCHAR(100)
);

CREATE TABLE Classes (
    Cl_ID INT PRIMARY KEY,
    class_code VARCHAR(100),
    room_number INT,
    schedule DATE
);

CREATE TABLE Assignments (
    Ass_ID INT PRIMARY KEY,
    St_ID INT,
    name VARCHAR(100),
    description VARCHAR(255),
    due_date DATE,
    states VARCHAR(100),
    FOREIGN KEY (St_ID) REFERENCES Students(St_ID) ON DELETE CASCADE
);

CREATE TABLE attendance (
    At_ID INT PRIMARY KEY,
    St_ID INT,
    attendance_date DATE,
    type_of_absence VARCHAR(100),
    reason VARCHAR(255),
    FOREIGN KEY (St_ID) REFERENCES Students(St_ID) ON DELETE CASCADE
);

INSERT INTO Students (St_ID, name, birthyear, address) VALUES
(1, 'Ahmad Ali', '2005-03-15', 'Amman, Jordan'),
(2, 'Sara Khaled', '2004-06-22', 'Irbid, Jordan'),
(3, 'Omar Fawzi', '2006-01-10', 'Zarqa, Jordan'),
(4, 'Mohammed Saleh', '2007-05-20', 'Aqaba, Jordan');

select * from Students

INSERT INTO family_info (Fa_ID, St_ID, name, phonenumber, Email) VALUES
(1, 1, 'Ali Mahmoud', '0791234567', 'adnan.father@gmail.com'),
(2, 2, 'Khaled Mustafa', '0789876543', 'khaled.father@gmail.com'),
(3, 3, 'Fawzi Salem', '0775678912', 'ayman.father@gmail.com');

select * from family_info

INSERT INTO Courses (Co_ID, name, description, resource) VALUES
(101, 'Mathematics', 'Advanced Math Course', 'Math Book 2024'),
(102, 'Physics', 'Introduction to Physics', 'Physics Lab Manual'),
(103, 'Programming', 'Learn Python Basics', 'Python Guide');

select * from  Courses

INSERT INTO Classes (Cl_ID, class_code, room_number, schedule) VALUES
(1, 'MATH101', 5, '2024-02-10'),
(2, 'PHY102', 3, '2024-02-12'),
(3, 'PROG103', 7, '2024-02-15');

select * from Classes

INSERT INTO Students_Courses(St_ID, Co_ID) VALUES
(1, 101), -- Ahmad Ali مسجل في الرياضيات
(1, 103), -- Ahmad Ali مسجل في البرمجة
(2, 101), -- Sara Khaled مسجلة في الرياضيات
(2, 102), -- Sara Khaled مسجلة في الفيزياء
(3, 103); -- Omar Fawzi مسجل في البرمجة

SELECT * FROM student_courses;

INSERT INTO Assignments (Ass_ID, St_ID, name, description, due_date, states) VALUES
(1, 1, 'Math Homework', 'Solve 10 equations', '2024-02-15', 'pass'),
(2, 2, 'Physics Report', 'Write about Newton Laws', '2024-02-18', 'fail'),
(3, 3, 'SQL Assignment', 'Write SQL Queries', '2024-02-20', 'pass');

SELECT * FROM Assignments;

INSERT INTO attendance (At_ID, St_ID, attendance_date, type_of_absence, reason) VALUES
(1, 1, '2024-01-02', 'absence', 'Sick'),
(2, 2, '2024-01-03', 'late', 'Traffic jam'),
(3, 3, '2024-01-04', 'leaving', 'Family emergency'),
(4, 4, '2024-01-05', 'leaving', 'Doctor appointment');

SELECT * FROM attendance; 

-- Q 1

 SELECT * FROM Students
WHERE birthyear = '2005-03-15';

-- Q2 
SELECT * FROM Courses
WHERE name = 'Mathematics'; 

-- Q3 
ALTER TABLE Students
ADD Email VARCHAR(100); 

-- Q4 
INSERT INTO Students (St_ID, name, birthyear, address) 
VALUES (5, 'Lina Hasan', '2006-09-12', 'Madaba, Jordan');

-- Q5 

SELECT Students.*
FROM Students
INNER JOIN family_info ON Students.St_ID = family_info.St_ID;

-- Q6 

SELECT Students.name, Courses.name
FROM Students
INNER JOIN student_courses ON Students.St_ID = student_courses.St_ID
INNER JOIN Courses ON student_courses.Co_ID = Courses.Co_ID
WHERE Courses.name = 'Mathematics';

--Q7

SELECT Students.name, Courses.name
FROM Students
INNER JOIN student_courses ON Students.St_ID = student_courses.St_ID
INNER JOIN Courses ON student_courses.Co_ID = Courses.Co_ID
WHERE Courses.name = 'Mathematics';


--Q8 

SELECT Students.name, attendance.attendance_date, attendance.type_of_absence
FROM Students
INNER JOIN attendance ON Students.St_ID = attendance.St_ID
WHERE attendance.type_of_absence = 'leaving'
AND attendance.attendance_date BETWEEN '2024-01-01' AND '2024-01-05';
