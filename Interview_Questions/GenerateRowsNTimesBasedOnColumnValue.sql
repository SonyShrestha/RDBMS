-- Repeat rows N times according to column value

-- Create table
create table item (
id int not null primary key auto_increment,
name varchar(100),
quantity int );

-- Insert into table
insert into item(name,quantity) values('SONY',3),('PRAGYA',2);
select * from item;

-- Generate rows N times based on column value
set @cnt:=0;
with recursive cte as (
select name,1 as item,@cnt+1 as counter from item -- where name='Sony'
union all
select a.name,1 as item, counter+1 as counter from cte a
inner join khwopa.item b
on a.name=b.name
where a.counter<b.quantity
-- having count(a.item)=b.quantity
)
select name,item from cte;




-- Generate rows N times based on column value
set @cnt:=0;
with recursive cte as (
select name,last_name,1 as item,@cnt+1 as counter from item -- where name='Sony'
union all
select a.name,a.last_name,1 as item, counter+1 as counter from cte a
inner join khwopa.item b
on a.name=b.name
and a.last_name=b.last_name
where a.counter<b.quantity
-- having count(a.item)=b.quantity
)
select name,last_name,item from cte;
