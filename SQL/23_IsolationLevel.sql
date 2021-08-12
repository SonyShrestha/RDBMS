-- Description: Isolationlevel

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;



select * from employee_detail;

begin transaction
UPDATE employee_detail SET name='Sony' where id=1;

commit transaction



/*
a) Dirty Read
Suppose, User A is updating a table, User B is retriving data from same table, User B is able to read uncommitted data.

b) Non-Repeatable Read
User A retrieved data, User B updated data. User A retrieved data. Here, User A will view two different data before and after.

c) Phantom Read
User A retrived data, User B inserted data. User A retrienved data. Here, User A will view two different number of results before and after.


Isolation Level		DirtyRead		Non-repeatableRead		PhantomRead
READ UNCOMMITTED	May Occur		May Occur				May Occur
READ COMMITTED		Don't Occur		May Occur				May Occur
REPEATABLE READ		Don't Occur		Don't Occur				May Occur
SERIALIZABLE		Don't Occur		Don't Occur				Don't Occur

*/

/*
Dirty Read happens when a user is permitted to read data that has been modified by another used but not yet committed.

Lost Update Problem happens when 2 transactions read and update the same data
T1- read availabale item=10 sell 1 update item_in_stock=9 
T2- read availabale item=10 sell 2 update item_in_stock=8
occurs in read uncommitted and read committed isolation level
Here, one transaction overwrites update of another transaction

Non-repeatable read happens when one transaction reads the same data twice and another transaction updates that data in between first and second read of transaction one.


Phantom read happens when one transaction executes a query twice and it gets a different
number of rows in the result set each time.
This happens when a second transaction inserts a new row that matches the WHERE clause of the query executed by the first transaction.


*/

-- Repeatable read does not allow updating record by second transation of first transaction is reading that table
-- Serializable will place a range lock on the rows between x and z, which prevents any other transaction from inserting new row within that range


/*
Repeatable read prevents only non-repeatable read.
Repeatable read isolation level ensure that the data that one transaction has read, will be prevented fromm being updated or deleted 
by any other transaction, but it does not prevent new rows from being inserted by other transactions resulting in phantom read concurrency problem.


Serializable prevents both repeatable read and phantom read problems
Seriablizable isolation level ensures that the data that one transaction has read, will be prevented 
from being updated or deleted by any other transaction.
It also prevents new rows from  being inserted by other transactions, so this isolation level prevents both non-repeatable read and phantom read problems.
*/


/*
Snapshot Isolation
Serializable isolation level is implemented by acquiring locks which means resources are locked for the
duration.

Snapshot isolation level does not acuire locks, it maintains versionaing in temdp.
t1 trying to update a record, t2 trying to view same record. t2 is blocked (IN SERIALIZABLE)
t2 can view previous record(in snapshot)

in snapshot, second transaction can perform read when another transaction is updaing same record

in snapshot,
second transaction cannot update when first transaction is updating same record.

*/


ALTER DATABASE master SET ALLOW_SNAPSHOT_ISOLATION ON;

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;

/* 
READ COMMITTED SNAPSHOT ISOLATION LEVEL

in snapshot, second transaction can perform read when another transaction is updating same record

*/


ALTER DATABASE master SET READ_COMMITTED_SNAPSHOT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

/*
Difference between read committed snapshot isolation and snapshot isolation

read committed snapshot isolation		snapshot isolation
no update conflicts						vulnerable to update conflicts
provides statement level read			provides transaction level read		
consistency								consistency

*/
