-- Description: CAST and CONVERT Function
-- Used to convert one data type to another 

SELECT CAST('2021-01-01' as DATE);
SELECT CAST(10.12 as INT);



SELECT CONVERT(NVARCHAR,'2021-01-01 13:01:02',103); 
-- To control format in which date should be displayed, we use convert, style determines the date format


-- CAST is ANSI Standard while CONVERT is specific to SQL server. If portability is concern, we can use CAST
-- Use CONVERT only if we want functionality of style