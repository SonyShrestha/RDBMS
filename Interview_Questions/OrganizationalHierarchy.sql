create table hier(employee_id int,
employee_name varchar(100),
manager_id int);

insert into hier
values(1,'John',5),
(2,'Mark',8),
(3,'Steve',8),
(4,'Tom',3),
(5,'Lara',8),
(6,'Simon',2),
(7,'David',4),
(8,'Ben',null),
(9,'Stacy',2),
(10,'Sam',5);


with recursive cte as
(
select *,'no boss' as manager_name from hier where manager_id is null
union all
select h.*,c.employee_name as manager_name  from cte c
inner join hier h
on c.employee_id=h.manager_id
)
select * from cte;