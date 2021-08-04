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
date_ date,
time_  time
);

INSERT INTO date_time_demo VALUES(NOW(),NOW(),NOW());

SELECT * FROM  date_time_demo;

SELECT NOW();
SELECT CURRENT_TIMESTAMP();
SELECT CURRENT_DATE(); 
SELECT CURRENT_TIME(); 


SELECT YEAR(CURRENT_DATE()),MONTH(CURRENT_DATE()),DAY(CURRENT_DATE()); -- Return year, month and day of given date
SELECT DAYOFWEEK(CURRENT_DATE());
SELECT DAYOFMONTH(CURRENT_DATE());

SELECT DATE_ADD(current_date(),INTERVAL 1 DAY);
SELECT DATE_SUB(current_date(),INTERVAL 1 DAY);
SELECT DATEDIFF(current_date(),'2021-01-01');

SELECT TIMESTAMPDIFF(MONTH,'2021-01-01',current_date());


SELECT STR_TO_DATE('2021-01-01','%Y-%m-%d');


-- Get age from given date_of_birth
drop procedure if exists get_age;

delimiter //
create procedure get_age(in dob date)
begin
set @dob=dob;
set @year=(select timestampdiff(year,@dob,current_date()));
-- select @year;
set @temp_date=(select date_add(@dob, interval @year year));
set @month=(select timestampdiff(month,@temp_date,current_date()));
-- select @month;
set @temp_date2=(select date_add(@temp_date, interval @month month));
set @day=(select timestampdiff(day,@temp_date2,current_date()));
select @year, @month,@day;
end //
delimiter ;

call get_age('1997-03-31');


