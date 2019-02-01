-- Clear Existing Users
DROP USER IF EXISTS 'BWhyne001'@'localhost';
DROP USER IF EXISTS 'CPenaldo002'@'localhost';
DROP USER IF EXISTS 'LMissy003'@'localhost';
DROP USER IF EXISTS 'SBinary004'@'localhost';
DROP USER IF EXISTS 'JWood005'@'localhost';
DROP USER IF EXISTS 'AMerkal007'@'localhost';
DROP USER IF EXISTS 'TObana010'@'localhost';

-- Clear Existing Roles
DROP ROLE IF EXISTS 'DB Admin';
DROP ROLE IF EXISTS 'Course Admin';
DROP ROLE IF EXISTS 'Enrolment Admin';
DROP ROLE IF EXISTS 'Academic Staff';
DROP ROLE IF EXISTS 'Student';

-- Create User Roles
CREATE ROLE IF NOT EXISTS 'DB Admin';
CREATE ROLE IF NOT EXISTS 'Course Admin';
CREATE ROLE IF NOT EXISTS 'Enrolment Admin';
CREATE ROLE IF NOT EXISTS 'Academic Staff';
CREATE ROLE IF NOT EXISTS 'Student';

-- Create Database Users
CREATE USER IF NOT EXISTS 'BWhyne001'@'localhost' IDENTIFIED BY 'DBAdmin01';
CREATE USER IF NOT EXISTS 'CPenaldo002'@'localhost' IDENTIFIED BY 'soccerstar210';
CREATE USER IF NOT EXISTS 'LMissy003'@'localhost' IDENTIFIED BY 'football4lyf247';
CREATE USER IF NOT EXISTS 'SBinary004'@'localhost' IDENTIFIED BY 'binaryallday440';
CREATE USER IF NOT EXISTS 'JWood005'@'localhost' IDENTIFIED BY 'saxman678';
CREATE USER IF NOT EXISTS 'AMerkal007'@'localhost' IDENTIFIED BY 'angel865';
CREATE USER IF NOT EXISTS 'TObana010'@'localhost' IDENTIFIED BY 'obanaman258';

-- Grant Users Roles
GRANT 'DB Admin' TO 'BWhyne001'@'localhost';
GRANT 'Course Admin' TO 'CPenaldo002'@'localhost';
GRANT 'Enrolment Admin' TO 'LMissy003'@'localhost';
GRANT 'Academic Staff' TO 'SBinary004'@'localhost';
GRANT 'Academic Staff' TO 'JWood005'@'localhost';
GRANT 'Student' TO 'AMerkal007'@'localhost';
GRANT 'Student' TO 'TObana010'@'localhost';

-- Set Users Default Roles on Login
SET DEFAULT ROLE 'DB Admin' FOR 'BWhyne001'@'localhost';
SET DEFAULT ROLE 'Course Admin' FOR 'CPenaldo002'@'localhost';
SET DEFAULT ROLE 'Enrolment Admin' FOR 'LMissy003'@'localhost';
SET DEFAULT ROLE 'Academic Staff' FOR 'SBinary004'@'localhost';
SET DEFAULT ROLE 'Academic Staff' FOR 'JWood005'@'localhost';
SET DEFAULT ROLE 'Student' FOR 'AMerkal007'@'localhost';
SET DEFAULT ROLE 'Student' FOR 'TObana010'@'localhost';