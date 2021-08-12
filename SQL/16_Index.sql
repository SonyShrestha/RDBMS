-- Description: Index

/*
Index 
It is used for fast data retrieval.
*/


-- Create index
CREATE INDEX manager_id_idx on employee(manager_id);


-- Get list of all indexes in a table
sp_Helpindex employee


-- Drop index --> Need to specify table name and index name
DROP INDEX employee.manager_id_idx


/*
Clustered Index and Non-Clustered Index
-------------------------------------------------------------------------------------------------
a) Clustered Index determines physical order of data in a table.
A table can have only one clustered index.
Primary key creates unique clustered index.
It is faster than non-clustered index.

b) In Non-Clustered Index, data is stored in one place and index is stored in another place.
Index will have pointer to storage location of data.
A table can have more than one non-clustered index.
Additional storage space is required to store index seperately.
*/


-- Create clustered composite index 
CREATE CLUSTERED INDEX idx_name ON
table_name(col1 DESC, col2 ASC);


-- Create non-clustered index
CREATE NONCLUSTERED INDEX idx_name ON
table_name(col1);



-- UNIQUE index
-- It enforces that field in which UNIQUE indexx is created cannot have non-unique value
-- Both clusterd and non clustered index can be unique

CREATE UNIQUE CLUSTERED INDEX idx_name ON
table_name(col1 DESC, col2 ASC);

CREATE UNIQUE NONCLUSTERED INDEX idx_name ON
table_name(col1 DESC, col2 ASC);



-- UNIQUE Constraint and UNIQUE Index
-- There is no major difference between them. We we add unique contraint, unique index gets created behind the scene.


create table employee_details
(
id int not null,
name varchar(100) unique
);


sp_helpindex employee_details




/*
Advantages and Disadvantages of Index 
---------------------------------------------------------
Advantages
a) Used for faster data retrieval.

Disadvantages
a) INSERT, UPDATE and DELETE becomes slower.
b) Additional disk space required for non clustered index.
*/



-- Covering query
-- If all the columns requested in SELECT clause of query are present in index, there is no need to lookup in table again. 
-- The requested columns can simply be returned from index.
-- Such type of query is called covering query and such type of index is called covering index.

-- Clustered index will always cover a query.