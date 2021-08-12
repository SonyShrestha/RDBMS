SELECT * FROM INFORMATION_SCHEMA.TABLES;

select * from INFORMATION_SCHEMA.COLUMNS;


SELECT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sample_db'); -- Returns 1  if at least one entry is present

SELECT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sample1_db'); -- Returns 0 if no entry is present


-- View if query cache is enabled
SHOW VARIABLES LIKE 'have_query_cache';
SHOW STATUS LIKE 'Qcache%';

-- Reset query cache
RESET QUERY CACHE;
FLUSH QUERY CACHE;