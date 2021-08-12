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
TRUNCATE employee_detail;

set sql_safe_updates=0;
START TRANSACTION;
UPDATE employee_detail SET name='sony' where id=1;
COMMIT;
ROLLBACK;



/*
ACID Properties of Database 
a) Atomicity: Either whole transaction will be successful or will not occur at all.

b) Consistency: The database should be consistent before and after transaction
Eg: Acc of A,B,C if money is being transferred from account A to account B,
money should be debited from A and credited to B

c) Isolation: Multiple transactions occur without interference.
Suppose, A wants to update a row, B also wants to update same row.
This should not happen.

d) Durability: Changes of successful transaction occurs even if the system failure occurs.
*/



