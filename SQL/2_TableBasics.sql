-- Description: TableBasics
create database sample_db;

drop table if exists employee;
CREATE TABLE employee
(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
name varchar(100)
);

-- Add column
ALTER TABLE employee ADD salary varchar(100);

-- Alter column
ALTER TABLE employee ALTER COLUMN salary INT;


SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='employee';


-- Add default constraint to existing field
ALTER TABLE employee
ADD CONSTRAINT default_constraint DEFAULT 'SSHRESTHA' for name;

-- Add new field with DEFAULT CONSTRAINT
ALTER TABLE employee
ADD salary int  DEFAULT 0;

-- Drop constraint
ALTER TABLE employee 
DROP CONSTRAINT default_constraint;

