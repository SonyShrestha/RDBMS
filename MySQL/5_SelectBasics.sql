-- Description: SELCT Basics


-- get limited number of rows
SELECT * FROM employee_details.employee limit 1;

-- like 
SELECT * FROM employee_details.employee where name like 's%';
SELECT * FROM employee_details.employee where name like '____'; 
SELECT * FROM employee_details.employee where name like '[sa]%'; -- Supported Only in SQL


-- REGEXP 
SELECT * FROM employee_details.employee where name REGEXP '^s'; -- begins with s
SELECT * FROM employee_details.employee where name REGEXP 'y$'; -- ends with o
SELECT * FROM employee_details.employee where name REGEXP '^[sa]'; -- begins with s or a
SELECT * FROM employee_details.employee where name REGEXP '[oa]$'; -- ends with s or a
SELECT * FROM employee_details.employee where name REGEXP 'n{2}'; -- strings with 2 occurences of preeceding characters
SELECT * FROM employee_details.employee where name REGEXP 'n{1,3}'; -- strings with 1 to 3 occurences of preeceding characters


-- WHERE AND HAVING 
/*
a) WHERE can be used with SELECT, INSERT AND UPDATE statement.
HAVING can be used with SELECT statement only.

b) WHERE applies filter before aggregation.
HAVING pplies filter after aggregation.

c) Aggregate functions cannot be used in WHERE clause.
Aggregate functions can be used in HAVING clause. 
*/