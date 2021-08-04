-- Description: Check Constarint
/*
MySQL Constraints are:
a) NOT NULL
b) UNIQUE
c) PRIMARY KEY
d) FOREIGN KEY
e) CHECK
f) DEFAULT
*/


SELECT TABLE_NAME,
       COLUMN_NAME,
       CONSTRAINT_NAME,
       REFERENCED_TABLE_NAME,
       REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "sample_db" AND TABLE_NAME = "unique_demo" ;
      


-- > NOT NULL ##################################
-- Enforces NULL value not to be accepted
create table not_null_demo
(
id int NOT NULL
);

create table not_null_demo
(
id int
);


-- Add NOT NULL CONSTRAINT in existing field
ALTER TABLE not_null_demo MODIFY id int NOT NULL; -- MySQL
ALTER TABLE not_null_demo ALTER COLUMN id int NOT NULL; -- SQL




-- > UNIQUE ##########################################
-- It ensures that all values in a a field is unique.
create table unique_demo
(
id int not null,
name varchar(100) UNIQUE
);

insert into unique_demo(id,name) values(1,'Sony');
insert into unique_demo(id,name) values(2,'Shrestha');
insert into unique_demo(id,name) values(3,'Shrestha');


-- Add UNIQUE Constraint in existing field
ALTER TABLE unique_demo ADD UNIQUE(name);
ALTER TABLE unique_demo ADD CONSTRAINT unique_cons UNIQUE(name);


-- Drop UNIQUE Index
ALTER TABLE unique_demo DROP INDEX name; -- MySQL
ALTER TABLE unique_demo DROP CONSTRAINT unique_cons; -- SQL



-- > PRIMARY KEY #############################
create table pk_demo
(
id int not null
);

-- Add primary key on existing field
ALTER TABLE pk_demo ADD PRIMARY KEY(id); -- MySQL, SQL
ALTER TABLE pk_demo ADD CONSTRAINT pk_id PRIMARY KEY(id); -- MySQL, SQL

-- Drop primary key 
ALTER TABLE pk_demo DROP PRIMARY KEY; -- MySQL
ALTER TABLE pk_demo DROP CONSTRAINT pk_id; -- SQL


-- Add field with primary key constraint
ALTER TABLE pk_demo ADD manager_id int NOT NULL PRIMARY KEY;




-- > FOREIGN KEY #####################################
create table fk_demo
(
id int not null,
manager_id int,
foreign key (manager_id) references manager(id)
);

-- Add primary key on existing field
ALTER TABLE fk_demo ADD CONSTRAINT fk1 FOREIGN KEY (manager_id) REFERENCES manager(id); -- MySQL, SQL
ALTER TABLE fk_demo ADD FOREIGN KEY (manager_id) REFERENCES manager(id); -- MySQL, SQL

-- Drop primary key 
ALTER TABLE fk_demo DROP FOREIGN KEY fk1; -- MySQL
ALTER TABLE fk_demo DROP CONSTRAINT fk1; -- SQL


################################ CHECK CONSTRAINT #########################
SELECT VERSION();

create table check_constraint_demo
(
id int not null,
age int check(age>0 and age<150)
);


insert into check_constraint_demo(id,age) values(1,20);
insert into check_constraint_demo(id,age) values(1,-20); -- check constraint raises error 
insert into check_constraint_demo(id,age) values(1,1120); -- check constraint raises error


-- Add field with CHECK constraint
ALTER TABLE check_constraint_demo ADD salary int check(salary>0);


-- Add CHECK constraint in existing field 
ALTER TABLE check_constraint_demo ADD constraint check_salary check(salary>1000); -- MySQL, SQL
ALTER TABLE check_constraint_demo ADD check(salary>1000); -- MySQL, SQL


-- Drop constraint
ALTER TABLE check_constraint_demo DROP CHECK check_salary; -- MySQL
ALTER TABLE check_constraint_demo DROP CONSTRAINT check_salary; -- SQL

-- Note: MySQL version prior to 8.0.16 does not support CHECK constraint





-- > DEFAULT ####################33
create table default_demo
(
id int not null,
name varchar(100) default 'SSHRESTHA'
);


-- Add DEFAULT constraint to existing field
ALTER TABLE default_demo ALTER name SET DEFAULT 'SSHRESTHA'; -- MySQL
ALTER TABLE default_demo ADD CONSTRAINT df_name DEFAULT 'SSHRESTHA' FOR name; -- SQL


-- Drop default
ALTER TABLE default_demo ALTER name DROP DEFAULT; -- MySQL
ALTER TABLE default_demo ALTER COLUMN name DROP DEFAULT; -- SQL
