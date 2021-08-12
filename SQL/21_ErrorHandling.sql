-- Description: Error Handling
-- Author: Sony Shrestha
-- Date: 2021-08-05


-- RAISERROR
-- RAISERROR('error_message', error_severity,error_state)
-- 16 in error_severity indicates general error that can be corrected by user

declare @id int=1;
if (@id=0)
	RAISERROR('id cannot be 0',16,1)
else 
	select @id;


declare @id int=0;
if (@id=0)
	RAISERROR('id cannot be 0',16,1)
else 
	select @id;



-- > @@error
-- It will return 0 if there was no error on execution of SQL query
INSERT INTO employee(emp_name) values ('a');
select @@ERROR;

-- It will return error code if there was error on execution of SQL query
INSERT INTO employee(id,emp_name) values (1,'a');
select @@ERROR;




-- Error handling with try catch
BEGIN TRY
	INSERT INTO employee(id,emp_name) values (1,'a');
END TRY
BEGIN CATCH
	select ERROR_NUMBER(),ERROR_LINE(),ERROR_MESSAGE(),ERROR_SEVERITY(),ERROR_STATE()
END CATCH