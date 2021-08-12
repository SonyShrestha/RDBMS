-- Description: Correlated Subquery

/*
Correlated Subquery
If a sub-query depends on outer query for its value, then such subquery is called correlated subquery.
Correlated Sub-query gets executed once for every row that is selected by the outer query.
*/

create table employee_details(id int,
name varchar(100),
manager_id int);

insert into employee_details values(1,'A',1),(2,'B',2),(3,'C',3);

select * from employee_details;

create table manager(id int,
name varchar(100));

insert into manager values(1,'A'),(2,'B');

select * from manager;

-- > This is not correlated subquery
-- Subquery in WHERE clause
select * from employee_details where manager_id in (select distinct id from manager);


-- > This is correlated subquery
-- Subquery in SELECT statement
select *,
(select count(1) from employee_details where manager_id=manager.id) 
from manager;

-- Note: Subqueries can be replaced with JOIN statements