-- Description: Index

/*
Index 
It is used for fast data retrieval.
*/


-- Create index
CREATE INDEX manager_id_idx on employee(manager_id);


-- Drop index --> Need to specify table name and index name
DROP INDEX manager_id_idx on employee;

-- List all index of table
SHOW INDEX FROM sample_db.employee;
SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'sample_db';

/*
Clustered Index and Non-Clustered Index
-------------------------------------------------------------------------------------------------
You don't need to specify that an index is NONCLUSTERED in MySQL, it's implicit from the table design.
Only the PRIMARY KEY or the first non-NULL UNIQUE KEY can be the clustered index, 
and they will be the clustered index without you choosing.
All the other indexes in the table are implicitly non-clustered.
*/


-- Create composite index 
CREATE INDEX idx_name ON
table_name(col1 DESC, col2 ASC);



-- UNIQUE index
-- It enforces that field in which UNIQUE indexx is created cannot have non-unique value
-- Both clusterd and non clustered index can be unique

CREATE UNIQUE INDEX idx_name ON
table_name(col1 DESC, col2 ASC);





-- UNIQUE Constraint and UNIQUE Index
-- There is no major difference between them. We we add unique contraint, unique index gets created behind the scene.


create table employee_details
(
id int not null,
name varchar(100) unique
);


SHOW INDEX FROM sample_db.employee_details;
