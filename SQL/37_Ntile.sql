-- ntile 

/*
Distributes the rows into a specified number of groups 
ORDER by clause is required
PARTITIONA BY is optional
If number of rows is not divisible by number of groups, you may have groups of two different sizes.
Larger groups come before smaller group

NTILE(2) of 10 rows divides the rows in 2 groups(5 in each groups)
NTILE(3) of 10 rows divides the rows in 3 groups(4 in first group, 3 in 2nd and 3rd)

*/


select * from sales_details;



select *,ntile(3) over(order by sales_amount) from sales_details;




