-- Description: String fucntion
-- Author: Sony Shrestha
-- Date: 2021-08-02

SELECT ASCII('AB'); -- Ascii code of corresponding first character of string
SELECT CHAR(65); -- Character corresponding to given ASCII code
SELECT LOCATE('hi','hellohi'); -- Returns index in which expression is found in given string
SELECT SOUNDEX('hello'); -- Returns four character SOUNDEX code
SELECT LEFT('HELLOHI',2); -- Returns n number of characters from left of string
SELECT RIGHT('HELLOHI',2); -- Returns n number of characters from left of string
SELECT LENGTH('HELLOHI'); -- Returns length of string
SELECT LOWER('HELLOHI'); -- Returns string in lower case
SELECT UPPER('HELLOHI'); -- Returns String in upper case
SELECT LTRIM('     HELLO       '); -- left trim
SELECT RTRIM('     HELLO       '); -- right trim
SELECT TRIM('     HELLO       '); -- left and right trim
SELECT STRCMP('HIHELLO','HIHIHELLO'); -- 0 means matched, s1>s2 then 1, s2>s1 then -1
SELECT REVERSE('HELLO'); -- Reverse given string
SELECT SUBSTRING('SONYSHRESTHA',2,3); -- Get part of string from given string
SELECT REPEAT('SONYSHRESTHA',2); -- Replicate string specified number of times (SQL: REPLICATE)
SELECT REPLACE('SONYSHRESTHA','ONY','ony'); -- Replace a expression with another expression in given string 
SELECT SPACE(5); -- Returns specified number of spaces
SELECT SUBSTRING_INDEX("www.w3schools.com", "s.", 1); -- Return a substring of a string before a specified number of delimiter occurs


-- Get number of email ids in each domain category
create table employee_email(email varchar(100));
insert into employee_email values('sony.sth8@gmail.com'),('pop.sth8@gmail.com'),('sony.sth8@extensodata.com'),('stha.sth8@gmail.com');

select 
SUBSTRING(email,LOCATE('@',email)+1,length(email)-LOCATE('@',email)+1) as domain_name,count(1) as domain_count
from employee_email
group by SUBSTRING(email,LOCATE('@',email)+1,length(email)-LOCATE('@',email)+1);