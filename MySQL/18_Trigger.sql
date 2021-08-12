-- Description: Trigger
-- Author: Sony Shrestha
-- Date: 2021-08-05

-- Trigger is a special type of stored procedure that gets invoked automatically each time an event takes place like insert update or delete

-- Note: There is no old row in insert.
-- 		There is no new row in delete.

-- Trigger to keep record of every new insertion, update and deletion
create table log(id int not null primary key auto_increment,
old_account_number varchar(100),
new_account_number varchar(100),
action_taken varchar(100),
created_on datetime
);

-- BEFORE INSERT 
DELIMITER //
CREATE TRIGGER before_insert BEFORE INSERT ON kumari.cc_due_report FOR EACH ROW
BEGIN
	INSERT INTO kumari.log(new_account_number,action_taken,created_on)
	VALUES(new.auto_debit_account,'insert',now());	
END //
DELIMITER ;

-- AFTER INSERT 
DROP TRIGGER IF EXISTS after_insert;
DELIMITER //
CREATE TRIGGER after_insert BEFORE INSERT ON kumari.cc_due_report FOR EACH ROW
BEGIN
	INSERT INTO kumari.log(new_account_number,action_taken,created_on)
	VALUES(new.auto_debit_account,'after_insert',now());	
END //
DELIMITER ;


-- BEFORE UPDATE 
DROP TRIGGER IF EXISTS before_update;
DELIMITER //
CREATE TRIGGER before_update BEFORE UPDATE ON kumari.cc_due_report FOR EACH ROW
BEGIN
	INSERT INTO kumari.log(old_account_number,new_account_number,action_taken,created_on)
	VALUES(old.auto_debit_account,new.auto_debit_account,'before_update',now());	
END //
DELIMITER ;

-- AFTER INSERT 
DROP TRIGGER IF EXISTS after_update;
DELIMITER //
CREATE TRIGGER after_update BEFORE UPDATE ON kumari.cc_due_report FOR EACH ROW
BEGIN
	INSERT INTO kumari.log(old_account_number,new_account_number,action_taken,created_on)
	VALUES(old.auto_debit_account,new.auto_debit_account,'after_update',now());	
END //
DELIMITER ;

-- BEFORE DELETE 
DROP TRIGGER IF EXISTS before_delete;
DELIMITER //
CREATE TRIGGER before_delete BEFORE DELETE ON kumari.cc_due_report FOR EACH ROW
BEGIN
	INSERT INTO kumari.log(old_account_number,action_taken,created_on)
	VALUES(old.auto_debit_account,'before_delete',now());	
END //
DELIMITER ;

-- AFTER INSERT 
DROP TRIGGER IF EXISTS after_delete;
DELIMITER //
CREATE TRIGGER after_delete BEFORE DELETE ON kumari.cc_due_report FOR EACH ROW
BEGIN
	INSERT INTO kumari.log(old_account_number,action_taken,created_on)
	VALUES(old.auto_debit_account,'after_delete',now());	
END //
DELIMITER ;




-- SIGNAL SQLSTATE 
DROP TRIGGER IF EXISTS before_insert;
DELIMITER //
CREATE TRIGGER before_insert BEFORE INSERT ON kumari.cc_due_report FOR EACH ROW
BEGIN
	IF new.customer_code is NULL THEN 
		SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Customer Code cannot be null';  
    END IF;  
END //
DELIMITER ;

