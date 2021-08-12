-- Description: View
-- View is like a virtual table. It is nothing more than a saved SQL Query.

CREATE VIEW vw_cc_due_report AS
SELECT * FROM kumari.cc_due_report;

SELECT * FROM cc_due_report;
select * from vw_cc_due_report;

-- Updating, Deleting and Insertiing into View will Update, Delete and Insert records into underlying tables
UPDATE vw_cc_due_report set embossed_name='TEST' WHERE id=1;
DELETE FROM  vw_cc_due_report WHERE id=1;
INSERT into vw_cc_due_report(id,auto_debit_account,customer_code) VALUES(1,'test','test');


-- ALTER VIEW
ALTER VIEW vw_cc_due_report AS
SELECT auto_debit_account,customer_code FROM cc_due_report;

select * from vw_cc_due_report;



-- Drop View
DROP VIEW vw_cc_due_report;


/*
Advantages of View 
a) Reduce complexity of Database schema
b) Implement row and column level security (row level = expose only details of IT department, column level = expose only relevant tables)
c) Present aggregated data and hide detailed data
*/


-- We cannot create index on view in mysql.

-- In SQL View, ORDER BY clause cannot be specified unless TOP, OFFSET or FOR XML is also specified.
-- In MySQL View, we can specify order by clause.
create view test as 
select * from vw_cc_due_report
order by auto_debit_account;


-- Views cannot be created on temporary table 
create temporary table temp as
select * from vw_cc_due_report;


create view test2 as 
select * from temp
order by auto_debit_account;

