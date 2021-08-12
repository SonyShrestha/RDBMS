-- Description: SELECT INTO

-- All fields
select * into t1_bkp from T1;

SELECT * FROM t1_bkp;
drop table t1_bkp;

-- Selected fields
select name into t1_bkp from T1;

SELECT * FROM t1_bkp;
drop table t1_bkp;



-- create table in new database
select name into sample_db.dbo.t1_bkp from T1;

SELECT * FROM sample_db.dbo.t1_bkp;


-- We cannot insert data into existing table using this statement
select name into sample_db.dbo.t1_bkp from T1;
-- for this we should use insert into
Insert into sample_db.dbo.t1_bkp
select name from T1;

