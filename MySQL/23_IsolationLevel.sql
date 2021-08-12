-- Description: IsolationLevel
-- Author: Sony Shrestha
-- Date: 2021-08-05


-- READ-UNCOMMITTED
show variables like '%iso%';
set GLOBAL transaction_isolation='READ-UNCOMMITTED';

select * from employee_detail;

START transaction;
UPDATE employee_detail SET name='Sony Shrestha1' where id=1; -- 
select * from employee_detail; -- User B will se modified data
ROLLBACK;
commit;


-- READ-COMMITTED
set GLOBAL transaction_isolation='READ-COMMITTED';
show variables like '%iso%';

select * from employee_detail;

START transaction;
UPDATE employee_detail SET name='Sony Shrestha2' where id=1; -- 
select * from employee_detail; -- User B will se modified data
ROLLBACK;
commit;






/*
a) Dirty Read
Suppose, User A is updating a table, User B is retriving data from same table, User B is able to read uncommitted data.

b) Non-Repeatable Read
User A retrieved data, User B updated data. User A retrieved data. Here, User A will view two different data before and after.

c) Phantom Read
User A retrived data, User B inserted data. User A retrienved data. Here, User A will view two different number of results before and after.


Isolation Level		DirtyRead		Non-repeatableRead		PhantomRead
READ-UNCOMMITTED	May Occur		May Occur				May Occur
READ-COMMITTED		Don't Occur		May Occur				May Occur
REPEATABLE-READ		Don't Occur		Don't Occur				May Occur
SERIALIZABLE		Don't Occur		Don't Occur				Don't Occur

*/



