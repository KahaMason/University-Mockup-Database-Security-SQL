-- Drop and Re-create Database
DROP DATABASE IF EXISTS Remarkable_University;
CREATE DATABASE IF NOT EXISTS Remarkable_University;
USE Remarkable_University;

-- Clear Existing Tables
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Academic_staff;
DROP TABLE IF EXISTS Admin_staff;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Course_staff;
DROP TABLE IF EXISTS Enrolment;
DROP TABLE IF EXISTS Grades;

-- Create Users Table
CREATE TABLE Users (
    user_id VARCHAR(10) NOT NULL,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    role VARCHAR(25) NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
);

-- Insert Users Data
INSERT INTO Users VALUES
    ('u01', 'BWhyne001', 'DBAdmin01', 'Bruce', 'Whyne', 'DBA'),
    ('u02', 'CPenaldo002', 'soccerstar210', 'Cristiano', 'Penaldo', 'Admin Staff'),
    ('u03', 'LMissy003', 'football4lyf247', 'Lionel', 'Missy', 'Admin Staff'),
    ('u04', 'SBinary004', 'binaryallday440', 'Seb', 'Binary', 'Academic Staff'),
    ('u05', 'JWood005', 'saxman678', 'Jazz', 'Wood', 'Academic Staff'),
    ('u06', 'MFranco006', 'frankman276', 'Miguel', 'Franco', 'Academic Staff'),
    ('u07', 'AMerkal007', 'angel865', 'Angela', 'Merkal', 'Student'),
    ('u08', 'DTrue008', 'president2018', 'Donaldo', 'True', 'Student'),
    ('u09', 'HBlinton009', 'candidate2018', 'Hillarious', 'Blinton', 'Student'),
    ('u10', 'TObana010', 'obanaman258', 'Tarra', 'Obana', 'Student'),
    ('u11', 'root', 'rootman', 'rootboy', 'rootington', 'Root Admin');

-- Create Students Table
CREATE TABLE Students (
    student_id VARCHAR(10) NOT NULL,
    user_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    DOB DATE NOT NULL,
    sex VARCHAR(1),
    phone int(10),
    CONSTRAINT student_pk PRIMARY KEY (student_id),
    CONSTRAINT student_user_id_fk FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE,
    CONSTRAINT chk_sex CHECK (sex = 'M' or 'F')
);

-- Insert Students Data
INSERT INTO Students VALUES
    ('s01', 'u07', 'Angela', 'Merkal', '1991-01-01', 'F', '543210'),
    ('s02', 'u08', 'Donaldo', 'True', '1992-02-02', 'M', '123456'),
    ('s03', 'u09', 'Hillarious', 'Binton', '1993-03-03', 'F', '112233'),
    ('s04', 'u10', 'Tarra', 'Obana', '1994-04-04', 'M', '221134');

-- Create Academic Staff Table
CREATE TABLE Academic_staff (
    staff_id VARCHAR(10) NOT NULL,
    user_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    position VARCHAR(25) NOT NULL,
    CONSTRAINT academic_staff_pk PRIMARY KEY (staff_id),
    CONSTRAINT academic_user_id_fk FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
);

-- Insert Academic Staff Data
INSERT INTO Academic_staff VALUES
    ('a01', 'u04', 'Seb', 'Binary', 'Professor'),
    ('a02', 'u05', 'Jazz', 'Wood', 'Asso. Professor'),
    ('a03', 'u06', 'Miguel', 'Franco', 'Lecturer');

-- Create Admin Staff Table
CREATE TABLE Admin_staff (
    staff_id VARCHAR(10) NOT NULL,
    user_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    duty VARCHAR(25) NOT NULL,
    CONSTRAINT admin_staff_pk PRIMARY KEY (staff_id),
    CONSTRAINT admin_user_id_fk FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
);

-- Insert Admin Staff Data
INSERT INTO Admin_staff VALUES
    ('f01', 'u02', 'Cristiano', 'Penaldo', 'Enrolment'),
    ('f02', 'u03', 'Lionel', 'Missy', 'Courses');

-- Create Courses Table
CREATE TABLE Courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(40) NOT NULL UNIQUE,
    convener VARCHAR(25),
    staff_id VARCHAR(10),
    trimester VARCHAR(5) NOT NULL,
    campus VARCHAR(10) NOT NULL,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT staff_id_fk FOREIGN KEY (staff_id) REFERENCES Academic_staff (staff_id) ON DELETE SET NULL
);

-- Insert Courses Data
INSERT INTO Courses VALUES
    ('101ICT', 'Information Management', 'Seb Binary', 'a01', '1, 2', 'GC'),
    ('102ICT', 'Object Oriented Programming', 'Jazz Wood', 'a02', '2', 'NA'),
    ('101STA', 'Statistics', 'Jazz Wood', 'a02', '2', 'GC, NA'),
    ('101CS', 'Data Analytics', 'Seb Binary', 'a01', '1', 'GC'),
    ('102CS', 'Information Retrieval', 'Miguel Franco', 'a03', '1, 3', 'GC');

-- Create Enrolment Table
CREATE TABLE Enrolment (
    course_id VARCHAR(10) NOT NULL,
    student_id VARCHAR(10) NOT NULL,
    student_name VARCHAR(25) NOT NULL,
    year INT(4) NOT NULL,
    trimester INT(1) NOT NULL,
    campus VARCHAR (2) NOT NULL,
    CONSTRAINT enrolment_pk PRIMARY KEY (course_id, student_id),
    CONSTRAINT course_fk FOREIGN KEY (course_id) REFERENCES Courses (course_id) ON DELETE CASCADE,
    CONSTRAINT student_fk FOREIGN KEY (student_id) REFERENCES Students (student_id) ON DELETE CASCADE
);

-- Insert Enrolment Data
INSERT INTO Enrolment VALUES
    ('101ICT', 's01', 'Angela Merkal', '2017', '1', 'GC'),
    ('101STA', 's01', 'Angela Merkal', '2017', '1', 'GC'),
    ('101CS', 's01', 'Angela Merkal', '2017', '1', 'GC'),
    ('102ICT', 's02', 'Donald True', '2018', '2', 'NA'),
    ('101CS', 's02', 'Donald True', '2017', '1', 'GC'),
    ('102CS', 's03', 'Hillarious Blinton', '2018', '3', 'GC'),
    ('102ICT', 's04', 'Tarra Obana', '2018', '2', 'NA'),
    ('101STA', 's04', 'Tarra Obana', '2017', '1', 'NA'),
    ('101CS', 's04', 'Tarra Obana', '2017', '1', 'GC'),
    ('102CS', 's04', 'Tarra Obana', '2018', '1', 'GC');

-- Create Grades Table
CREATE TABLE Grades (
    course_id VARCHAR(10) NOT NULL,
    student_id VARCHAR(10) NOT NULL,
    score INT(3),
    grade INT(1),
    CONSTRAINT grades_pk PRIMARY KEY (course_id, student_id),
    CONSTRAINT grades_fk FOREIGN KEY (course_id, student_id) REFERENCES Enrolment (course_id, student_id) ON DELETE CASCADE,
    CONSTRAINT score_chk CHECK (score <= 100),
    CONSTRAINT grade_chk CHECK (grade <= 7)
);

-- Insert Grades Data
INSERT INTO Grades VALUES
    ('101ICT', 's01', '75', '6'),
    ('101STA', 's01', '80', '6'),
    ('101CS', 's01', '92', '7'),
    ('102ICT', 's02', '86', '7'),
    ('101CS', 's02', '71', '5'),
    ('102CS', 's03', '65', '5'),
    ('102ICT', 's04', '55', '4'),
    ('101STA', 's04', '66', '5'),
    ('101CS', 's04', '80', '6'),
    ('102CS', 's04', '86', '7');