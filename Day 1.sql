-- create a database
Create database MyCollege;

-- to work on it, you need to use it first
use mycollege;

-- delete database
drop database Mycollege;

-- to execute query(ctrl+enter)

-- SQL is not a case sensitive language, ex- AGE or Age or age will be treated as same word

create table Student(
id int primary key,  -- primary key = unique + not null
name varchar(100) not null,
std varchar(10) not null,
address varchar(200),
age int
);

-- to select all records
select * from student;

-- to insert multiple records together
insert into Student
values 
(3,'Yusuf', '1st', 'Dombivli',5),
(4,'Shoeb', '1st', 'Dombivli',5),
(5,'Kajal', '1st', 'Dombivli',5),
(6,'Trisha', '1st', 'Dombivli',5),
(7,'Khushi', '1st', 'Dombivli',5),
(8,'Mitali', '1st', 'Dombivli',5),
(9,'Anjali', '1st', 'Dombivli',5),
(10,'Priya', '1st', 'Dombivli',5);

-- to remove complete records from table
truncate table student;

-- to remove complete records and attributes from table
drop table student;


CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Subject VARCHAR(50),
    Experience INT,
    Email VARCHAR(100)
);

-- to select all records
select * from Teachers;

INSERT INTO Teachers (TeacherID, Name, Subject, Experience, Email) VALUES
(1, 'Mr. Rajesh Kumar', 'Mathematics', 10, 'rajesh.kumar@example.com'),
(2, 'Ms. Anita Desai', 'Science', 8, 'anita.desai@example.com'),
(3, 'Mr. Sanjay Gupta', 'English', 12, 'sanjay.gupta@example.com'),
(4, 'Ms. Priya Sharma', 'History', 5, 'priya.sharma@example.com'),
(5, 'Mr. Rakesh Mehta', 'Geography', 15, 'rakesh.mehta@example.com');


CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(10),
    Section CHAR(1),
    TotalStudents INT,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

-- to select all records
select * from Classes;

INSERT INTO Classes (ClassID, ClassName, Section, TotalStudents, TeacherID) VALUES
(1, '10th', 'A', 30, 1),
(2, '9th', 'B', 25, 2),
(3, '11th', 'C', 20, 3),
(4, '8th', 'A', 28, 4),
(5, '12th', 'B', 22, 5);


CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50),
    Credits INT,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- to select all records
select * from Subjects;

INSERT INTO Subjects (SubjectID, SubjectName, Credits, ClassID) VALUES
(1, 'Mathematics', 4, 1),
(2, 'Science', 4, 2),
(3, 'English', 3, 3),
(4, 'History', 3, 4),
(5, 'Geography', 3, 5);


CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(50),
    Date DATE,
    TotalMarks INT,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- to select all records
select * from Exams;

INSERT INTO Exams (ExamID, ExamName, Date, TotalMarks, ClassID) VALUES
(1, 'Mid Term Exam', '2023-10-15', 100, 1),
(2, 'Final Exam', '2023-12-20', 100, 2),
(3, 'Unit Test', '2023-11-10', 50, 3),
(4, 'Quarterly Exam', '2023-09-25', 75, 4),
(5, 'Annual Exam', '2024-03-15', 100, 5);


CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    Date DATE,
    Status ENUM('Present', 'Absent'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- to select all records
select * from Attendance;

INSERT INTO Attendance (AttendanceID, StudentID, ClassID, Date, Status) VALUES
(1, 1, 1, '2023-10-01', 'Present'),
(2, 2, 2, '2023-10-01', 'Absent'),
(3, 3, 3, '2023-10-01', 'Present'),
(4, 4, 4, '2023-10-01', 'Present'),
(5, 5, 5, '2023-10-01', 'Absent');


CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- to select all records
select * from Grades;

INSERT INTO Grades (GradeID, StudentID, SubjectID, Marks) VALUES
(1, 1, 1, 85),
(2, 2, 2, 78),
(3, 3, 3, 90),
(4, 4, 4, 88),
(5, 5, 5, 92);


CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    AvailableCopies INT
);

-- to select all records
select * from Library;

INSERT INTO Library (BookID, Title, Author, ISBN, AvailableCopies) VALUES
(1, 'The Alchemist', 'Paulo Coelho', '978-0061122415', 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', '978-0061120084', 3),
(3, '1984', 'George Orwell', '978-0451524935', 4),
(4, 'Pride and Prejudice', 'Jane Austen', '978-1503290563', 2),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', '978-0743273565', 6);


CREATE TABLE ExtracurricularActivities (
    ActivityID INT PRIMARY KEY,
    ActivityName VARCHAR(100),
    Description TEXT,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- to select all records
select * from ExtracurricularActivities;

INSERT INTO ExtracurricularActivities(ActivityID, ActivityName, Description, ClassID) VALUES
(1, 'Basketball', 'Team sport played on a court.', 1),
(2, 'Debate Club', 'A club for debating current issues.', 2),
(3, 'Science Club', 'A club for science enthusiasts.', 3),
(4, 'Drama Club', 'A club for aspiring actors.', 4),
(5, 'Art Club', 'A club for artists and creative minds.', 5);


CREATE TABLE ParentDetails (
    ParentID INT PRIMARY KEY,
    StudentID INT,
    ParentName VARCHAR(100),
    Relationship VARCHAR(50),
    ContactNumber VARCHAR(15),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- to select all records
select * from ParentDetails;

INSERT INTO ParentDetails (ParentID, StudentID, ParentName, Relationship, ContactNumber) VALUES
(1, 1, 'Mr. Anil Sharma', 'Father', '9876543210'),
(2, 2, 'Mrs. Sunita Patel', 'Mother', '9876543211'),
(3, 3, 'Mr. Raj Verma', 'Father', '9876543212'),
(4, 4, 'Mrs. Kavita Iyer', 'Mother', '9876543213'),
(5, 5, 'Mr. Vikram Singh', 'Father', '9876543214');
