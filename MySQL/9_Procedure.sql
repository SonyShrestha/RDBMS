-- Description: Procedure
-- Author: Sony Shrestha
-- Date: 2021-08-01


-- Create Procedure without input and output parameter
DROP PROCEDURE IF EXISTS QA.get_account;
DELIMITER //
CREATE PROCEDURE QA.get_account()
BEGIN
	SELECT * FROM dax_raw.rw_account_master limit 10;
END //
DELIMITER ;


CALL QA.get_account();



-- Create Procedure with input parameter
DROP PROCEDURE IF EXISTS QA.get_account;
DELIMITER //
CREATE PROCEDURE QA.get_account(in acc_name varchar(100))
BEGIN
	SELECT * FROM dax_raw.fc_account_master where account_name=acc_name limit 10;
END //
DELIMITER ;


CALL QA.get_account('YOGENDRA PRASAD CHAULAGAIN');



-- Create Procedure with output parameter
DROP PROCEDURE IF EXISTS QA.get_account;
DELIMITER //
CREATE PROCEDURE QA.get_account(out count_ int)
BEGIN
	SELECT count(1) into count_ FROM dax_raw.rw_account_master;
END //
DELIMITER ;


CALL QA.get_account(@count__);
select @count__;




-- Create Procedure with input and output parameter
DROP PROCEDURE IF EXISTS QA.get_account;
DELIMITER //
CREATE PROCEDURE QA.get_account(out count_ int,in product_cat varchar(100))
BEGIN
	SELECT count(1) into count_ FROM dax_raw.rw_account_master where product_category=product_cat;
END //
DELIMITER ;


CALL QA.get_account(@count__,'SBA');
select @count__;




-- To alter stored procedure
-- Drop sp if exists then recreate it




-- To drop sp
DROP PROCEDURE IF EXISTS sp_name;



-- Dynamic Stored Procedure
-- It is used to write SQL Statements dynamically at run time.
DROP PROCEDURE IF EXISTS QA.get_account;
DELIMITER //
CREATE PROCEDURE QA.get_account(in cond varchar(100))
BEGIN
	SET @query=(select concat('SELECT * FROM dax_raw.rw_account_master where ',cond,' LIMIT 10;'));
    PREPARE stmt from @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;


CALL QA.get_account(' product_category="SBA" ');




-- Advantages of Stored Procedure
/*
a) Execution plan retention and reusability
b) Code reusability
*/
