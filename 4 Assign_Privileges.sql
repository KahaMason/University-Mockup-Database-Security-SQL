-- DBA Privileges
GRANT ALL ON remarkable_university.* TO 'DB Admin';

-- Course Admin Privileges
GRANT SELECT, UPDATE, INSERT, DELETE ON remarkable_university.Course_Administration TO 'Course Admin';

-- Enrolment Admin Privileges
GRANT SELECT, UPDATE, INSERT, DELETE ON remarkable_university.Enrolment_Administration TO 'Enrolment Admin';

-- Academic Staff Privileges
GRANT SELECT ON remarkable_university.Course_Enrolments TO 'Academic Staff';
GRANT SELECT, UPDATE (score, grade) ON remarkable_university.Course_Grades TO 'Academic Staff';

-- Student Privileges
GRANT SELECT ON remarkable_university.My_Grades TO 'Student';

FLUSH PRIVILEGES;