-- Description: Function
-- Author: Sony Shrestha
-- Date: 2021-08-02

-- All parameters in fuction are in parameter. We cannot specify in, out or inout.
-- DETERMINISTIC always returns same result for same input parameter. NON DETERMINISTIC returns different result for same input paramter.
/*
-- > Syntax
DELIMITER $$
CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
 -- statements
END $$
DELIMITER ;
*/

DELIMITER //
CREATE FUNCTION has_acc_open_date(acc_open_date date)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE return_value varchar(100);
	IF acc_open_date is null then 
		SET return_value= 'no';
    ELSE
		SET return_value= 'yes';
    END IF;
    RETURN return_value;
END //
DELIMITER ;

SELECT account_number,acc_closed_date,has_acc_open_date(acc_closed_date) from dax_raw.rw_account_master
LIMIT 10;


-- View all functions
show function status where db='dax_history';
show procedure status; -- to list all procedures