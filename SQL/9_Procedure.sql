-- Description: Procedure
-- Author: Sony Shrestha
-- Date: 2021-08-01


-- It is recommended not to used sp_spname for User Defined Stored Procedure.
-- This is because System Defined User Procedure has this naming convention.


-- To ALTER Stored Procedure
-- ALTER PROCEDURE ..... (remaining statements same as that of create)


-- Drop procedure
DROP PROCEDURE proc_name;


-- Create Procedure without input and output parameter
DROP PROCEDURE IF EXISTS get_account;
CREATE PROCEDURE get_account
AS
BEGIN
	SELECT * FROM [sample_db].[dbo].[employee];
END 


get_account
Exec sample_db.dbo.get_account;
Execute sample_db.dbo.get_account;


-- Create Procedure with input parameter
ALTER PROCEDURE get_account(@acc_name varchar(100))
AS
BEGIN
	SELECT * FROM [sample_db].[dbo].[employee] where name=@acc_name;
END

get_account 'E1';
Exec get_account 'E2';
Execute get_account 'E2';
Execute get_account @acc_name='E2'; -- Call sp specifying input parameter provided


-- Create Procedure with encrytion 
ALTER PROCEDURE get_account(@acc_name varchar(100))
WITH ENCRYPTION
AS
BEGIN
	SELECT * FROM [sample_db].[dbo].[employee] where name=@acc_name;
END

sp_helptext get_account; -- The text for object 'get_account' is encrypted.


-- Create Procedure with output parameter
ALTER PROCEDURE get_account(@count int out)
AS
BEGIN
	SELECT @count=count(1)  FROM [sample_db].[dbo].[employee];
END

DECLARE @count_account int
Exec get_account @count_account out
select @count_account


-- Create Procedure with input and output parameter
ALTER PROCEDURE get_account(@emp varchar(100),@count int out)
AS
BEGIN
	SELECT @count=count(1)  FROM [sample_db].[dbo].[employee] where name=@emp;
END

DECLARE @count_account int
Exec get_account 'E1',@count_account out
select @count_account


-- To get information about object that can be table, view, stored procedure, trigger
-- For sp, stored procedure and parameters being used by that stored procedure
sp_help get_account

-- For table, table, columns, index and constraints being used by that table
sp_help employee

-- To get text of Stored Procedure, we have system stored procedure sp_helptext
sp_helptext get_account;

-- To view dependencies of stored procedure
sp_depends get_account;


-- Advantages of Stored Procedure
/*
a) Execution plan retention and reusability
b) Code reusability
*/
