-- Description: Views, Derived Table and CTE
-- Author: Sony Shrestha
-- Date: 2021-08-05


/*
Views
Views get stored in database.
They are available to other queries and stored procedures.
If views are to be used only at a specific place, there are other options such as derived table and CTE.

*/


-- Derived Table
-- Derived Tables are available only to the parent query
select * from (
	select name,count(1) as count_name from employee group by name
) e1 where count_name>1;



-- CTE (Common Table Expression)
/* 
CTE can be defined as temporary result set that is referenced
within the execution scope of a SELECT, INSERT, UPDATE, DELETE or CREATE VIEW 
that immediately follows the CTE
*/

WITH cte(_name_,_count_name_)
as
(
select name,count(1) as count_name from employee group by name
)
select * from cte where _count_name_>1;


/*
CTE can be divided into 
a) Non-Recursive CTE
b) Recursive CTE

Recursive CTE's are called until query condition is satisfied.
*/


DECLARE @row_no int=1;

with cte as
(
select @row_no as row_no
union all
select row_no+1 from cte where row_no<10
)
select * from cte






create table employee_detail(
id int not null,
name varchar(100),
manager_id int);

truncate table employee_detail;
insert into employee_detail 
values(1,'A',null),(2,'B',null),(3,'C',1),(4,'D',1),(5,'E',2),(6,'F',2),
(7,'G',5),(8,'H',6);



WITH  cte 
as
(
select *,1 as level from employee_detail where manager_id is null
UNION ALL
select a.*,level+1 as level from employee_detail a
inner join cte b 
on a.manager_id=b.id
)
select * from cte;



/*
This will form infinite recursion. Why?
truncate table employee_detail;
insert into employee_detail 
values(1,'A',1),(2,'B',2),(3,'C',1),(4,'D',1),(5,'E',2),(6,'F',2),
(7,'G',5),(8,'H',6);

show variables like '%cte_max_recursion_depth%';


WITH  cte 
as
(
select *,1 as level from employee_detail where id=manager_id
UNION ALL
select a.*,level+1 as level from employee_detail a
inner join cte b 
on a.manager_id=b.id
)
select * from cte;
*/




-- UPDATE CTE
-- If CTE is created on one table, it is possible to update CTE which will update underlying base table
-- If a CTE is based on more tables, then it is possible to update if update affects only one base table
-- If a CTE is based on more tables, then it is not possible to update if update affects multiple table
WITH cte
as
(
select * from employee 
)
UPDATE cte set name='Sony' where id=1;


select * from employee;



-- INSERT CTE
WITH cte
as
(
select * from employee 
)
insert into cte(emp_name) values('Sony');


select * from employee;





-- DELETE CTE
WITH cte
as
(
select * from employee 
)
delete from cte where id=1;


select * from employee;


