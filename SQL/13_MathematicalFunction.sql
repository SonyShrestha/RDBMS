-- Description: Mathematical Function

SELECT ABS(-10); -- Find absolute value
SELECT CEILING(10.9); -- Returns integer greater than or equal to given value
SELECT FLOOR(10.9); -- Returns integer less than or equal to given value
SELECT POWER(2,3);
SELECT SQUARE(2); -- Square of given number
SELECT SQRT(2); -- Square root of given number
SELECT RAND(); -- Returns random number between 0 and 1
SELECT RAND(1); -- Rand function with same seed value will always return same decimal value

-- ROUND(numberic_expression,length,function): third parameter indicates rounding or truncation operation
-- 0 indicates rounding, non zero indicates truncation
SELECT ROUND(10.98987,2); -- Round up number to two decimal places
SELECT ROUND(10.98987,2,0);
SELECT ROUND(10.98987,2,-1);
SELECT ROUND(10.98987,2,1);

SELECT ROUND(10998.98987,-2); -- Round last two digits before decimal place
