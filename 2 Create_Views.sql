USE Remarkable_university;

-- Clear Existing Views
DROP VIEW IF EXISTS My_Grades;
DROP VIEW IF EXISTS Course_Enrolments;
DROP VIEW IF EXISTS Course_Grades;
DROP VIEW IF EXISTS Course_Administration;
DROP VIEW IF EXISTS Enrolment_Administration;

-- Create My Grades View to View Personal Grades
CREATE VIEW My_Grades AS
SELECT e.course_id, e.student_id, e.student_name, g.score, g.grade
FROM Users u, Students s, Enrolment e, Grades g
WHERE (CONCAT(u.username, '@localhost') = USER() OR CONCAT(u.username, '@%') = USER()) AND
    u.user_id = s.user_id AND 
    s.student_id = e.student_id AND 
    e.student_id = g.student_id AND 
    e.course_id = g.course_id;

-- Create Course Enrolments View for Academic Staff to view their students
CREATE VIEW Course_Enrolments AS
SELECT e.course_id, e.student_id, e.student_name, e.year, e.trimester
FROM Users u, Academic_staff astaff, Courses c, Enrolment e
WHERE (CONCAT(u.username, '@localhost') = USER() OR CONCAT(u.username, '@%') = USER()) AND
    u.user_id = astaff.user_id AND
    astaff.staff_id = c.staff_id AND
    CONCAT(astaff.first_name, ' ', astaff.last_name) = c.convener AND
    c.course_id = e.course_id;

-- Create Course Grades View for Academic Staff to Update their student's grades
CREATE VIEW Course_Grades AS
SELECT g.course_id, e.student_id, e.student_name, g.score, g.grade
FROM Users u, Academic_staff astaff, Courses c, Enrolment e, Grades g
WHERE (CONCAT(u.username, '@localhost') = USER() OR CONCAT(u.username, '@%') = USER()) AND
	u.user_id = astaff.user_id AND
    astaff.staff_id = c.staff_id AND
    c.course_id = e.course_id AND
	e.course_id = g.course_id AND
    e.student_id = g.student_id;

-- Create Course Administration View for Course Admins to Update Courses
CREATE VIEW Course_Administration AS
SELECT *
FROM Courses;

-- Create Enrolment Administration View for Enrolment Admins to Update Enrolments
CREATE VIEW Enrolment_Administration AS
SELECT *
FROM Enrolment;