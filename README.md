# Database and DBMS Schema Mockup

## Remarkable University Database Security Mockup

#### Kaha Mason

#### Order to load scripts
1. Load Create_Database.sql
2. Load Create_Views.sql
3. Load Create_Users.sql
4. Load Assign_Privileges.sql

#### Database Administrator Account
* Username: BWhyne001
* Password: DBAdmin01
* Role: DBA

#### Purpose
A Database system designed as mockup of a University enrolment, course management, grading system for Students, Academic Staff and Admin Staff. This database is used as a mockup for security testing such as access control, privilege control, and SQL Injection testing.

#### Database User Accounts
1. Database Admin
    * BWhyne001 - Bruce Whyne pw: DBAdmin01
2. Admin Staff
    * Course Admin: CPenaldo002 - Cristiano Penaldo pw: soccerstar210
    * Enrolment Admin: LMissy003 - Lionel Missy pw: football4lyf247
3. Academic Staff
    * SBinary004 - Seb Binary pw: binaryallday440
    * JWood005 - Jazz Wood pw: saxman678

4. Students
    * AMerkal007 - Angela Merkal pw: angel865
    * TObana010 - Tarra Obana pw: obanaman258
* Note: See SQL for more details

#### Database Tables
* Users - Contains a list of user information stored on the database.
    * Information used to authenticate login requests to access database and granted privileges.
* Students - Contains a list of users who have been assigned the role of student.
    * Can view their grades in the courses they have enrolled in.
* Academic_staff - Contains a list of users that are assigned the Academic Staff role.
    * Administrates their teaching courses and student grades of their respective teaching course.
* Admin_staff - Contains a list of users that are assigned the Admin_staff role.
    * Given the purpose of administrating the course and enrolment information.
* Courses - Contains a list of courses and their assigned convener from Academic_staff.
* Enrolment - Contains a list of students enroled in courses.
    * Foreign key information from student and courses tables
* Grades - Used to track the grades students have been given in their enrolled courses.

#### Database Views
Views are used to control the aspects in which users can interact with the database and its stored sensitive information. Views are limited constructs that act as intermediaries that allow users to update the database based on the privileges and limitations assigned to their roles without revealing sensitive information, exceeding their assigned privileges or having direct contact with the database. This security measure ensures that information can only be updated or view by authenticated users who have granted privileges.

##### Views
* Course_Administration - View that displays all information to those assigned the Course Admin role.
* Enrolment_Administration - View that display all enrolment information to those assigned the Enrolment Admin privilege.
* Course_Enrolement - View that displays list of students enrolled in the courses that the Academic Staff user is assigned to.
* Course_Grades - View that displays the student grades of enrolled students in courses an academic staff is assigned to as a convener.
* My_Grades - Displays the grades of a student user who is viewing their own personal course grades.

#### Privileges
* Database Administrator "DB Admin"
    * Granted all privileges and complete access to the database.
* Course Administrator 
    * Granted access to the Course_Administration view. 
    * Privileges include: 
        * SELECT, UPDATE, INSERT and DELETE on all information displayed by the view.
* Enrolment Administrator
    * Granted access to the Enrolment_Administration view. 
    * Privileges include: 
        * SELECT, UPDATE, INSERT and DELETE on all information displayed by the view.
* Academic Staff
    * Granted access to Course_Enrolments and Course_Grades view.
    * Privileges include: 
        * SELECT on Course_Enrolments
        * SELECT and UPDATE on Course_Grades only on score and grades information
* Student
    * Granted access to My_Grades view.
    * Privileges Limited to SELECT only. Cannot update or alter information or personal grades.