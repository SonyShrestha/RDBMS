-- EXCEPT
-- It returns unique rows from Left Select query that not in Right Select Query
select * from T1;

select * from T2;


select * from T1
except
select * from T2;

/*
EXCEPT vs NOT IN
EXCEPT returns only distinct rows.
NOT IN does not filter distinct rows.

EXCEPT operator expects same number of columns in both the queries.
NOT IN compares a single column from the outer query with a single column from the sub-query.







-- > INTERSECT
-- Retrieves common records from bothe left and right query of intersect operator
-- The number and order of columns must be same in both queries
-- The data type must be same or at least compatible

*/


select * from T1
intersect
select * from T2;


/*
INTERSECT returns distinct values
INNERJOIN does not filter duplicates

if we join two tables based on null field, inner join will not include those rows in the result set
intersect treats two nulls as a same value and returns all matching rows.
-- join tabes based on nullable field



-- UNION- returns unique rows from bothe left and right query
-- UNION ALL- returns all rows from both left and right query
-- intersect- returns matching unique rows between left and right query
-- except- return unique rows from left query that are not in right query result
*/
