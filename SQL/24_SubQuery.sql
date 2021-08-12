-- Description: Sub-query
-- Query insert a query is called sub- query
-- Sub-query can be in WHERE clause or SELECT statement

create table employee_details(id int,
name varchar(100),
manager_id int);

insert into employee_details values(1,'A',1),(2,'B',2),(3,'C',3);

select * from employee_details;

create table manager(id int,
name varchar(100));

insert into manager values(1,'A'),(2,'B');

select * from manager;

-- Subquery in WHERE clause
select * from employee_details where manager_id in (select distinct id from manager);


-- Subquery in SELECT statement
select *,
(select count(1) from employee_details where manager_id=manager.id) 
from manager;

-- Note: Subqueries can be replaced with JOIN statements