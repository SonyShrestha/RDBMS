-- Description: ListTables
/*
a) INFORMATION_SCHEM.TABLES INFORMATION_SCHEM.VIEWS INFORMATION_SCHEM.COLUMNS: List all table, columns and views of all databases
*/




-- > INFORMATION_SCHEMA
select * from INFORMATION_SCHEMA.TABLES; -- Views and tables are present in same table in mysql with table_type=BASE TABLE and VIEW

select * from INFORMATION_SCHEMA.COLUMNS;

select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE;