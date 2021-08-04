-- Description: TableBasics
create database sample_db;

CREATE TABLE employee
(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
name varchar(100)
);


-- Add default constraint to existing field
ALTER TABLE employee
ADD CONSTRAINT default_constraint DEFAULT 'SSHRESTHA' for name;

-- Add new field with DEFAULT CONSTRAINT
ALTER TABLE employee
ADD salary int  DEFAULT 0;

-- Drop constraint
ALTER TABLE employee 
DROP CONSTRAINT default_constraint;

