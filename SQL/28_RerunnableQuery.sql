-- Rerunnable SQL Script
-- It is a script, when run more than once, will not throw errors
if not exists(select * from INFORMATION_SCHEMA.tables where table_name='emp')
begin
	CREATE TABLE emp(id int)
end
else
begin
	print 'table already exists'
end
-- In MySQL, we can use create table if not exists  emp(id int);


-- SQL server built in function OBJECT_ID() can also be used to check for the existence
select OBJECT_ID('emp'); -- Some integer  999674609

select OBJECT_ID('emp1'); -- NULL


-- SQL server built in function COL_LENGTH() can also be used to check for column
select COL_LENGTH('emp','name'); -- NULL

select COL_LENGTH('emp','id'); -- Some integer 4