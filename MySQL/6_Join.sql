-- Description: Join 

-- Note: SQL supports full outer join. MySQL does not support FULL OUTER JOIN
create table manager 
(
id int,
name varchar(100)
);

insert into manager(id,name) values(1,'Sony'),(2,'Shrestha'),(3,'Pragya'),(4,'Prasanna');

create table employee 
(
id int,
name varchar(100),
manager_id int
);

insert into employee(id,name,manager_id) values(1,'E1',1),(2,'E2',2),(3,'E5',5),(4,'E5',6);


-- Inner Join
-- It returns all matching rows between left and right tables.
select * from manager a
inner join employee b
on a.id=b.manager_id;

-- Left Join
-- It returns all matching rows between left and right tables and non-matching row of left table.
select * from manager a
left join employee b
on a.id=b.manager_id;


-- Right Join
-- It returns all matching rows between left and right tables and non-matching row of right table.
select * from manager a
right join employee b
on a.id=b.manager_id;


-- FULL OUTER Join: Mysql does not suport full outer join directly. but we can use left and right join to acheive functionality of full outer join
-- It returns all matching rows between left and right tables and non-matching row of both tables.
select * from manager a
LEFT join employee b
on a.id=b.manager_id
UNION 
select * from manager a
RIGHT join employee b
on a.id=b.manager_id where a.id is null;



-- cross join 
-- CROSS JOIN produces cartesian product of tables involved in join. Is should not have on clause
select count(1) from manager; -- 4

select count(1) from employee; -- 4

select * from manager a
cross join employee b; -- 16




-- self join 
-- Join with same table
select e.id as employee_id,e.name as employee_name, m.manager_id as manager_id, m.name as manager_name
from employee e
inner join employee m
on e.manager_id=m.id;