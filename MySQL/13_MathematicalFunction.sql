-- Description: Mathematical Function

SELECT ABS(-10); -- Find absolute value
SELECT CEILING(10.9);
SELECT CEIL(10.9); -- Returns integer greater than or equal to given value
SELECT FLOOR(10.9); -- Returns integer less than or equal to given value
SELECT POWER(2,3);
SELECT SQRT(2); -- Square root of given number
SELECT RAND(); -- Returns random number between 0 and 1
SELECT RAND(1); -- Rand function with same seed value will always return same decimal value

-- ROUND(numberic_expression,length)
SELECT ROUND(10.98987,2); -- Round up number to two decimal places

SELECT ROUND(10998.98987,-2); -- Round last two digits before decimal place
