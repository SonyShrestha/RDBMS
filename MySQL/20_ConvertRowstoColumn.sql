-- Convert rows to column in MySQL
-- Author: Sony Shrestha
-- Date: 2021-08-06

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


SELECT sales_agent,
SUM(CASE WHEN sales_country='US' THEN sales_account else 0 end) as us,
SUM(CASE WHEN sales_country='UK' THEN sales_account else 0 end) as uk,
SUM(CASE WHEN sales_country='India' THEN sales_account else 0 end) as india
FROM sales
GROUP BY sales_agent


