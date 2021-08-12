-- Description: Error Handling in MySQL Stored Procedure
-- Author: Sony Shrestha
-- Description: 2021-08-05

-- To declare handler
-- DECLARE action HANDLER FOR condition_value statement;
/*
action- CONTINUE/EXIT
	If CONTINUE, when an error arises other statements in procedure will continue to execute
	If EXIT, when an error arises other statements in procedure will not continue to execute and exit at that point itself

condition_value
The  condition_value specifies a particular condition or a class of conditions that activate the handler. 
The  condition_value accepts one of the following values:
	A MySQL error code.
	A standard SQLSTATE value. Or it can be an SQLWARNING , NOTFOUND or SQLEXCEPTION condition, which is shorthand for the class of SQLSTATE values.

statement
The statement could be a simple statement or a compound statement enclosing by the BEGIN and END keywords.
*/

/*
Examples
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
END;


DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET RowNotFound = 1;


DECLARE CONTINUE HANDLER FOR 1062
SELECT 'Error, duplicate key occurred';
*/

-- Difference between CONTINUE AND EXIT
-- CONTINUE
DROP PROCEDURE IF EXISTS error_test;
delimiter //
CREATE PROCEDURE error_test()
begin
	DECLARE CONTINUE HANDLER FOR 1062 SELECT 'Error, duplicate key occurred';
    INSERT INTO sample_db.employee VALUES(7,'ES',2);
    SELECT 'HELLO';
end //
delimiter ;

CALL error_test();
-- SELECT 'HELLO'; will execute

delimiter //
CREATE PROCEDURE error_test()
begin
	DECLARE EXIT HANDLER FOR 1062 SELECT 'Error, duplicate key occurred';
    INSERT INTO sample_db.employee VALUES(7,'ES',2);
    SELECT 'HELLO';
end //
delimiter ;

CALL error_test();
-- SELECT 'HELLO'; will not execute
