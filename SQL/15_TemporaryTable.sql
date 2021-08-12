-- Author: Sony Shrestha
-- Date: 2021-07-28
-- Description: Temporary Table

/* 
Temporary Table vs Permanent Table
----------------------------------------------------------------------
Permanent Table gets created in database we specify.
				It remains in database unless we drop them.

Temporary Table gets created in tempDB.
				It gets deleted automatically when they are no longer used.

Types of temporary tables
a) Local Temporary Table
b) Global Temporary Table
*/


-- Create a temporary table 
CREATE TABLE #emp(id int,name varchar(20));


-- Insert into temporary table
INSERT INTO #emp(id,name) VALUES(1,'Sony');
INSERT INTO #emp(id,name) VALUES(2,'Pragya');
INSERT INTO #emp(id,name) VALUES(3,'Prasanna');


-- Select values from temporary table 
SELECT * FROM #emp;


-- To get details of temporary table
select * from tempdb..sysobjects
where name like '#emp%';

-- Note: Name of temporary table is suffixed with lot of underscores and a random number. So, while quering in temdb..sysobjects, we use LIKE operator

-- Local temporary table is available only for the connection that has created corresponding temporary table.
-- Local temporary tables can also be dropped using DROP TABLE #emp;




-- When a local temporary table is created inside stored proceudre, it gets destroyed once procedure is called.
CREATE PROCEDURE get_emp_details
AS
BEGIN
CREATE TABLE #emp(id int,name varchar(20));
INSERT INTO #emp(id,name) VALUES(1,'Sony');
INSERT INTO #emp(id,name) VALUES(2,'Pragya');
INSERT INTO #emp(id,name) VALUES(3,'Prasanna'); 
SELECT * FROM #emp;
END


EXEC get_emp_details

SELECT * FROM #emp;


-- Different connections can create temporary table with same name 






-- Global Temporary Table
CREATE TABLE ##emp(id int,name varchar(20));


-- Insert into temporary table
INSERT INTO ##emp(id,name) VALUES(1,'Sony');
INSERT INTO ##emp(id,name) VALUES(2,'Pragya');
INSERT INTO ##emp(id,name) VALUES(3,'Prasanna');


-- Select values from temporary table 
SELECT * FROM ##emp;




/* 
Difference between Local and Global Temporary Table
-----------------------------------------------------------
Local Temporary Table								Global Temporary Table
a) Prefixed with #									Prefixed with ##

b) Random number is appended						Random number is not appended
at the end of local temporary table name

c) Accessible only from the session that			Accessible from all the sessions
had created this temporary table

d) Automatically dropped when the session			Automatically dropped when the last connection referencing 
that created temporary table is closed				to global temporary table is dropped

e) Two local temp table with same name				Two global temp table with same name	
can be created from two different sessions			cannot be created from two different sessions



