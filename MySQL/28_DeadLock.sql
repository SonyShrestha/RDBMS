-- Description: Dead Lock
/*
MySQL has two deadlock handling methods:

Wait until the timeout (InnoDB ﹐ lock ﹐ wait ﹐ timeout = 50s).
Initiate deadlock detection, actively roll back one transaction, 
and let other transactions continue to execute (InnoDB? Deadlock? Detect = on).
*/


show variables like '%innodb_lock_wait_timeout%';


show variables like '%deadlock%'; -- innodb_deadlock_detect


-- Note: InnoDB uses the number of rows a transaction has inserted, updated, or deleted, as the 'size' measure of a transaction, and rolls back the smaller one.
