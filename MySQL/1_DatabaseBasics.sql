-- Author: Sony Shrestha
-- Description: Database Basics
-- Date: 2021-07-30

-- Create Database
CREATE DATABASE sample_db;


-- Rename Database 
/*
There is no direct way to rename database in MySQL.
To rename database 
CREATE DATABASE new_db;
RENAME TABLE old_db.table_name to new_db.table_name;
*/
CREATE DATABASE new_db;
RENAME TABLE old_db.table_name to new_db.table_name;


-- Drop Database
/*
We cannot drop database only if some queries are being executed in tables inside that database.
*/
DROP DATABASE sample_db;

-- Note: System Databases cannot be dropped.


