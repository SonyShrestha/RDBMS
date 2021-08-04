-- Description: CAST and CONVERT Function

-- CAST is used to convert one data type to another 
SELECT CAST('2021-01-01' as DATE);
select CAST(1 as DECIMAL);

/*
-- Supported data type for casting
DATE	
DATETIME	
TIME	
CHAR	
DECIMAL	
SIGNED	
UNSIGNED	
BINARY
*/

-- CONVERT is used to convert one data type to another data type. It also allows us to convert character set of data to another character set.
select CONVERT(1 , DECIMAL);
select CONVERT('sony' using utf8);
