-- DateTime

-- > DATATYPES IN DATETIME
-- datetime: YYYY-MM-DD hh:mm:ss.nnn
-- datetime2: YYYY-MM-DD hh:mm:ss.nnnnnnn
-- smalldatetime: YYYY-MM-DD hh:mm:ss
-- date: YYYY-MM-DD
-- time: hh:mm:ss.nnnnnnn
-- datetimeoffset: YYYY-MM-DD hh:mm:ss.nnnnnnn [+|-] hh:mm

create table date_time_demo
(
datetime_ datetime,
datetime2_ datetime2,
date_ date,
time_  time,
smalldatetime_ smalldatetime,
datetimeoffset_ datetimeoffset
);

INSERT INTO date_time_demo VALUES(GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE());

SELECT * FROM  date_time_demo;

SELECT GETDATE();
SELECT CURRENT_TIMESTAMP;
SELECT SYSDATETIME(); -- More fractional seconds precision
SELECT SYSDATETIMEOFFSET(); -- More fractional seconds precision + Time zone effect
SELECT GETUTCDATE(); -- UTC Date Time
SELECT SYSUTCDATETIME(); -- UTC Date Time with more fractional seconds precision


-- Date Time functions
SELECT ISDATE(GETDATE()),ISDATE('HELL0'); -- Determines whether input expression is valida date
-- Note: For datetime2 datatype, it returns 0.

SELECT YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE()); -- Return year, month and day of given date

SELECT 
DATENAME(YEAR,GETDATE()),
DATENAME(MONTH,GETDATE()),
DATENAME(DAY,GETDATE()),
DATENAME(WEEK,GETDATE()),
DATENAME(WEEKDAY,GETDATE()); -- Returns string that represents part of given date


SELECT 
DATEPART(YEAR,GETDATE()),
DATEPART(MONTH,GETDATE()),
DATEPART(DAY,GETDATE()),
DATEPART(WEEK,GETDATE()),
DATEPART(WEEKDAY,GETDATE()); -- Returns integer that represents part of given date


-- Returns new date after adding specified interval in given date
select DATEADD(DAY,2,'2020-01-01');
select DATEADD(MONTH,2,'2020-01-01');
select DATEADD(YEAR,2,'2020-01-01');


-- 
select DATEDIFF(DAY,'2020-01-01','2021-01-01');
select DATEDIFF(MONTH,'2020-01-01','2021-01-01');
select DATEDIFF(YEAR,'2020-01-01','2021-01-01');



-- Get age from given date_of_birth
DECLARE @dob date,@year int,@month int,@day int, @temp_date date, @temp_date2 date;
SET @dob ='2021-03-31';
SELECT @year=(select DATEDIFF(year,@dob,GETDATE())-case when month(@dob)>month(getdate()) or (month(@dob)=month(getdate()) and day(@dob)>day(getdate())) then 1 else 0 end);
SELECT @year;
SELECT @temp_date=(select DATEADD(YEAR,@year,@dob))
SELECT @month=(select DATEDIFF(month,@temp_date,GETDATE())-case when day(@dob)>day(getdate()) then 1 else 0 end)
SELECT @month;
SELECT @temp_date2=(select DATEADD(MONTH, @month,@temp_date))
SELECT @day=(select DATEDIFF(day,@temp_date2,GETDATE()))
SELECT @year, @month,@day;

