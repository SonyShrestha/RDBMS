-- Description: ListTables
/*
a) sysobjects: List of all objects of current database
b) sys.object_name: List of all obejcts of current database
c) INFORMATION_SCHEM.TABLES INFORMATION_SCHEM.VIEWS INFORMATION_SCHEM.COLUMNS: List all table, columns and views of all databases
*/

-- > SYSOBJECTS
-- List all tables
SELECT * FROM SYSOBJECTS WHERE xtype='U';
/*
xtype
a) U-User table
b) V-View
c) P-Stored Procedure
d) TR-Trigger
*/


-- > sys.
-- List all tables
SELECT * FROM sys.tables;

-- List all views
SELECT * FROM sys.views;

-- List all stored procedures
SELECT * FROM sys.procedures;




-- List all triggers
SELECT * FROM sys.triggers;


--> INFORMATION_SCHEMA
select * from INFORMATION_SCHEMA.TABLES;
select * from INFORMATION_SCHEMA.views;

select * from INFORMATION_SCHEMA.COLUMNS;

select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE;

-- List all stored routines and procedures
SELECT * FROM INFORMATION_SCHEMA.routines;
