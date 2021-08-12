-- Description: Transactions
-- Author: Sony Shrestha
-- Date: 2021-08-05

/*
Transactions
A transaction is a group of commands that change the data stored in a database.
A trasaction is treated as a single unit.
Transaction ensures that either all of the commands succeed or none of them.
If any one of the command fail, all the commands fail and any data that was modified in the database is rolled back.

Transaction processing follows following steps:
a) begin a transaction
b) execute database commands
c) check for errors
	If error occurred
		rollback the transaction
	else
		commit the transaction
*/

-- Here, either all insertion will happen or no insertion will occur
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO employee(emp_name) VALUES('c')
		INSERT INTO employee_detail VALUES(1,'c',4)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH


BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO employee(emp_name) VALUES('c')
		INSERT INTO employee_detail VALUES('c',4)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH




begin transaction
INSERT INTO employee_detail VALUES(1,'c',4)

commit transaction

ROLLBACK TRANSACTION






/*
ACID Properties of Database 
a) Atomicity: Either whole transaction will be successful or will not occur at all.

b) Consistency: The database should be consistent before and after transaction
Eg: Acc of A,B,C if money is being trasferred from account A to account B,
money should be debited from A and credited to B

c) Isolation: Multiple transactions occur without interference.
Suppose, A wants to update a row, B also wants to update same row.
This should not happen.

d) Durability: Changes of successful transaction occurs even if the system failure occurs.
*/

