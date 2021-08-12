-- over
-- OVER clause combined with PARTITION BY is used to break up data into partitions
-- function() over(partition by col1,col2...)
/*
COUNT(1) OVER(PARTITION BY Gender) will partition data by gender i.e. Male and Female
and then count() function is applied over each partition

Can be used with:
COUNT()
AVG()
SUM()
MIN()
MAX()
ROW_NUMBER()
RANK()
DENSE_RANK(),etc


Same functionality can be achieved with the halp of GROUP BY 
OVER is used when we want non aggregated values along with aggregated values, we use over clause
 */


 -- ROW_NUMBER()
 -- returns sequential number of a row starting at 1, when data is partitioned, row number is reset to 1 when partition changes
 ROW_NUMBER() OVER(PARTITION BY col1,col2 order by col1)

 -- Use delete all duplicates except 1 


 -- RANK() it will skip rank if there is a tie 
 -- DENSE_RANK() will not skip rank 

 RANK() returns 1 1 3 4 5 
 DENSE_RANK() returns 1 1 2 3 4


 /*
 ROW_NUMBER, RANK AND DENSE_RANK
 ROW_NUMBER
 Returns an increasing unique number for each row starting at 1
 even if there are duplicates


 RANK
 return increasing unique number for each row starting at 1
 where there are duplicates same rank is assigned to all the duplicate rows but the next row 
 after duplicate rows will have the rank it would have been assigned if there had been no dulpicates.
 So rank function skips rankings if there are duplicates


 DENSE_RANK 

  return increasing unique number for each row starting at 1
 where there are duplicates same rank is assigned to all the duplicate rows
 but the next row WILL NOT SKIP ANY RANK.
 This means next row after the duplicate rows will have the next rank in the sequence.
 */




