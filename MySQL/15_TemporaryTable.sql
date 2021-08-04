-- Create Temporary Table 
CREATE TEMPORARY TABLE temp_table 
(
id int,
name varchar(100)
);

insert into temp_table(id,name) values (1,'Sony'),(2,'Shrestha');


-- Create temporary table from existing table 
CREATE TEMPORARY TABLE temp_table_from_existing_table 
AS
SELECT * FROM 6_21_master.fc_config;


-- Create temporary table like existing table 
CREATE TEMPORARY TABLE temp_table_like_existing_table LIKE  6_21_master.fc_config;


-- Meta data about temporary table is stored in INNODB_TEMP_TABLE_INFO table
SELECT * FROM INFORMATION_SCHEMA.INNODB_TEMP_TABLE_INFO;


/*
Temporary tables can be accessed within same connection only.
We cannot create temporary table with same name within same connection.
But, we can create temporary table with same name across different connections.
*/
