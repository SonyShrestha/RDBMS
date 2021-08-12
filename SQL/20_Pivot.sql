-- Pivot in SQL Server
-- Author: Sony Shrestha
-- Date: 2021-08-06

-- Pivot operator is used to convert unique values from one column into multiple columns in the output

CREATE TABLE sales(
sales_agent varchar(100),
sales_country varchar(100),
sales_account int);

insert into sales values
('Tom','UK',200),
('John','US',180),
('John','UK',200),
('David','India',200),
('Tom','India',200),
('David','US',200),
('Tom','US',200),
('John','India',200),
('John','UK',200),
('David','UK',200),
('John','UK',200),
('John','UK',200),
('Tom','US',200),
('Tom','US',200),
('Tom','UK',200),
('John','India',200),
('David','India',200),
('David','India',200),
('Tom','UK',200),
('John','US',200),
('David','UK',200);


/*
Syntax for PIVOT Operator
SELECT <non-pivoted column>,<first pivoted column>,<second pivoted column> from
( 
	select query that produces data 
) as source_query
PIVOT
(
	<aggregate-function> FOR
	<field that contain values that will become column header>
	IN ([first pivot header],[second pivot header],[third pivot header])
) as pivot_table
<optional order by clause>;
*/


SELECT sales_agent,UK,US,India from 
(
	select * from sales
) as source_query
PIVOT 
(
	sum(sales_account) 
	FOR sales_country
	in ([US],[UK],[India])
) as derieved_table
order by sales_agent desc







