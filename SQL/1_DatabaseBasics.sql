-- Description: Database Basics

-- Create Database
CREATE DATABASE sample_db;

-- Rename Database 
ALTER DATABASE sample_db MODIFY name= sample_database;

-- sp_renameDB is system defined stored procedure that is used to rename database
sp_renameDB 'sample_database', 'sample_db';


/*
When a database is created, two files are created
a) .mdf file --> It is called master data file. It contains actual data.
b) .ldf file --> It is called log data file. This is used to recover database.
*/

-- Drop Database
DROP DATABASE sample_db;


/*
A user cannot drop database if it currently being used by another user.
SO, in other to drop the database, we need to put database in single user mode.
*/


ALTER DATABASE sample_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;


-- Note: System Databases cannot be dropped.




