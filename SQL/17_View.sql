-- Description: View
-- View is like a virtual table. It is nothing more than a saved SQL Query.

CREATE VIEW vw_employee AS
SELECT * FROM employee;

SELECT * FROM employee;
select * from vw_employee;

-- Updating, Deleting and Insertiing into View will Update, Delete and Insert records into underlying tables
UPDATE vw_employee SET name='E1' WHERE id=1;
DELETE FROM vw_employee WHERE id=4;
INSERT INTO vw_employee VALUES(4,'E4',1);

-- To get view defination
sp_helptext vw_employee;


-- ALTER VIEW
ALTER VIEW vw_employee AS
SELECT id,name FROM employee;

select * from vw_employee;



-- Drop View
DROP VIEW vw_employee;


/*
Advantages of View 
a) Reduce complexity of Database schema
b) Implement row and column level security (row level = expose only details of IT department, column level = expose only relevant tables)
c) Present aggregated data and hide detailed data
*/




-- Updating Views that involve two Table Joins
/*
If a view is based on multiple tables, and if you update the view, 
It may not update the underlying base tables correctly.
To correctly update a view, that is based on multiple tables, INSTEAD OF triggers are used
*/

CREATE TABLE employee_det
(
id int not null,
name varchar(100),
salary int,
gender varchar(100),
department_id int);

insert into employee_det values
(1,'John',50000,'Male',3),
(2,'Mikey',50000,'Male',2),
(3,'Pam',50000,'Female',1),
(4,'Todd',50000,'Male',4),
(5,'Sara',50000,'Female',1),
(6,'Ben',50000,'Male',3);


Create table department(
id int not null,
dept_name varchar(100));

insert into department
values 
(1,'HR'),
(2,'Payroll'),
(3,'IT'),
(4,'Admin');


create view vw_employee_details as
select e.id,e.name,e.gender,e.department_id
from employee_det e
inner join department d
on e.department_id=d.id;



ALTER view vw_employee_details as
select e.id,e.name,e.gender,d.dept_name
from employee_det e
inner join department d
on e.department_id=d.id;

select * from vw_employee_details;


UPDATE vw_employee_details SET 
dept_name='CSE' where name='John';





-- Indexed view
/*
A standard or non-indexed view is just a stored SQL query.
When we try to retrieve data from the view, the data is actually retrieved from the underlying base tables.
So, a view is just a virtual table it does not store any data, by default.
However, when you create an index, on a view, the view gets materialized, This means, the view is now, capable of storing data.

In SQL server, we call then indexed views and in Oracle, Materialized View.
*/

/*
To create Indexed View,
a) View should be created WITH SCHEMABINDING option.
Cannot create index on view 'vw_employee_details' because the view is not schema bound.

b) Base table in view should be referenced with 2 part name.
Cannot schema bind view 'vw_employee_details' because name 'employee_det' is invalid for schema binding. Names must be in two-part format and an object cannot reference

c) If group by is being used, COUNT_BIG must be used.
Cannot create index on view 'sample_db.dbo.vw_employee_details' because its select list does not include a proper use of COUNT_BIG. 
Consider adding COUNT_BIG(*) to select list.

d) If select statement returns NULL, then a replacement value should be specified.
Cannot create the clustered index "idx1" on view "sample_db.dbo.vw_employee_details" because the view references an unknown value (SUM aggregate of nullable expression). 
Consider referencing only non-nullable values in SUM. ISNULL() may be useful for this.
*/

-- Note: First index created must be UNIQUE CLUSTERED index.

ALTER view vw_employee_details with schemabinding
as
select e.id,e.name,e.gender,d.dept_name
from dbo.employee_det e
inner join dbo.department d
on e.department_id=d.id;


create unique clustered index idx1 on
vw_employee_details(name);



drop view vw_employee_details;


create view vw_employee_details 
with schemabinding
as
select 
e.gender,sum(salary) as sal,COUNT_BIG(1) as num_of_emp
from dbo.employee_det e
inner join dbo.department d
on e.department_id=d.id
group by e.gender;


create unique clustered index idx1 on
vw_employee_details(gender);



select * from employee_det;

update employee_det set salary=null where gender='Female';


ALTER view vw_employee_details 
with schemabinding
as
select 
e.gender,sum(isnull(salary,0)) as sal,COUNT_BIG(*) as num_of_emp
from dbo.employee_det e
inner join dbo.department d
on e.department_id=d.id
group by e.gender;


create unique clustered index idx1 on
vw_employee_details(gender);



-- > VIEWS Limitations
/*
a) We cannot pass parameter to view. Inline table valued function is replacement for parameterized view.
b) Rules and Defaults cannot be associated with view.
c) ORDER BY is not valid in view unless TOP or FOR XML is also specified.
d) Views and functions cannot be based on temporary table.
*/


-- Error raised
create view view_with_order_by as 
select * from employee_det order by gender;
-- The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.