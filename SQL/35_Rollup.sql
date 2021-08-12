-- RollupCube
/*
Cube generates a result set that shows aggregates for all cobinations of values in the selected columns
Rollup gneerates a result set that shows aggregates for a hierarchy of values in selccted columns
Both generates grand total as well

rollup(continent,country,city)
continent,country,city
continent,country
continent
()

cube(continent,country,city)
continent,country,city
continent,country
continent,city
continent
country,city
country
city
()
*/


create table sales_details(
continent varchar(100),
country varchar(100),
city varchar(100),
sales_amount int);

insert into sales_details values
('Asia','India','Vijayawada',10),
('Asia','India','Chennai',10),
('Asia','Japan','Tokyo',10),
('Asia','Japan','Hiroshima',10),
('Europe','UK','London',10),
('Europe','UK','Manchester',10),
('Europe','France','Paris',10),
('Europe','France','Cannes',10);

select continent,country,city from sales_details;

select continent,country,city,sum(sales_amount) as sales_details from 
sales_details
group by rollup(continent,country,city);


select continent,country,city,sum(sales_amount) as sales_details from 
sales_details
group by cube(continent,country,city);


-- Other ways to achieve this
select sales_agent,sum(sales_account) as sales_account_sum from 
sales group by 
GROUPING SETS
(
	(sales_agent),
	()
);



select sales_agent,sum(sales_account) as sales_account_sum from 
sales group by sales_agent
union all
select null,sum(sales_account) as sales_account_sum from 
sales;