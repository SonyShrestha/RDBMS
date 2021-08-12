-- Dead lock
-- It occurs when one or more transactions are infinitely waiting for one another to give up locks
-- When deadlocks occur, SQL Server will choose one of the processes as 
-- deadlock victim and rollback that process, so the other process can move forward

-- transaction 1

CREATE TABLE T1(id int,
name varchar(100));

insert into T1 values(1,'Sony'),(2,'B'),(3,'C'),(4,'D'),(5,'E');


CREATE TABLE T2(id int,
name varchar(100));

insert into T2 values(1,'Sony'),(2,'B'),(3,'C'),(4,'D'),(5,'E');

BEGIN TRANSACTION
update T1 SET name='TRANSACTION1' where id=1;

update T2 SET name='TRANSACTION1' where id=1;
commit transaction

select * from T1;
select * from T2;




-- transaction 2
BEGIN TRANSACTION
update T2 SET name='TRANSACTION2' where id=1;

update T1 SET name='TRANSACTION2' where id=1;


/*
How is deadlock detected?
There is thread called lock monitor thread that will run every 5 seconds by default to detect
if there are any deadlocks.

What happens when a deadlock is detected?
One os the transaction is selected ad deadlock viction.
Deadlock victims transaction is then rolled back and returns 1205 error to the application.
Rolling back the transaction of deadlock victim releases all locks held by that transaction.
This allows the other transactions to become unblocked and move forward.



DEADLOCK_PRIORITY
By default, SQL Server chooses a transaction as the deadlock victim that is least expensive to rollback.
However, we can specify priority of sessions in a deadlock situation using SET DEADLOCK_PRIORITY statement
Session with lowest priority is choosen as the deadlock victim.

DEADLOCK_PRIORITY
a) Default is NORMAL
b) can be low, normal and high
can be set to an integer value in range of -10 to 10
low= -5
normal= 0
high= 5



What is deadlock victim selection criteria
a) If the DEADLOCK_PRIORITY is different, the session with the lowest priority is selected as victim.
b) If both the sessions have the same priority, the transaction that is least expensive to rollback is selected as the victim.
c) If both the sessions have same deadlock priority and the same cost, a victim is choosen randomly.

*/


-- TRANSACTION 1
BEGIN TRANSACTION
update T2 SET name='TRANSACTION1' where id IN (1,2,3,4,5);

update T1 SET name='TRANSACTION1' where id=1;
commit transaction

select * from T1;
select * from T2;



-- TRANSACTION 2
BEGIN TRANSACTION
update T1 SET name='TRANSACTION1' where id=1;

update T2 SET name='TRANSACTION1' where id IN (1,2,3,4,5);
commit transaction

select * from T1;
select * from T2;




SET DEADLOCK_PRIORITY HIGH;

/*
Logging Deadlock in SQL Server
We can track queries that are causing deadlocks.
One way is to use trace flag 1222 to write the deadlock information to SQL Server error log

*/


-- Set SQL Server trace flag 1222
DBCC Traceon(1222,-1);

-- Check the status of trace flag
DBCC TraceStatus(1222,-1);

-- Turn off trace flag
DBCC Traceoff(1222,-1);


-- To read error log
execute sp_readerrorlog

-- Note: -1 parameter indicates that the trace flag must be set at the global level. If we omit -1 parameter the trace flag will be set only at the session level
