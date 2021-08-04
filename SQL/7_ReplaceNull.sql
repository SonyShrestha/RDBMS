-- Replace NULL
/*
a) isnull: if first value is null, then it returns second value
b) coalesce: returns first not null value
c) case when
*/

-- ISNULL
SELECT isnull(m.name,'No manager') as value from employee e
full outer join manager m
on e.manager_id=m.id;

-- CASE
SELECT case when m.name is null then 'No manager' else m.name end as value from employee e
full outer join manager m
on e.manager_id=m.id;

-- COALESCE
SELECT m.name,e.name,COALESCE(m.name,e.name,'No manager') as value from employee e
full outer join manager m
on e.manager_id=m.id