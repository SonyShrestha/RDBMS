-- Description: GROUPING  SETS
select * from sales;


select sales_agent,sales_country,sum(sales_account) as sales_account_sum from 
sales group by 
GROUPING SETS
(
	(sales_agent,sales_country),
	(sales_agent),
	(sales_country),
	()
);

-- It is used to perform group by operation based on multiple fields at same time



