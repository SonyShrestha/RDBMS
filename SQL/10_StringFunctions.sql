-- Description: String fucntion
-- Author: Sony Shrestha
-- Date: 2021-08-02

SELECT ASCII('AB'); -- Ascii code of corresponding first character of string
SELECT CHAR(65); -- Character corresponding to given ASCII code
SELECT CHARINDEX('hi','hellohi'); -- Returns index in which expression is found in given string
SELECT SOUNDEX('hello'); -- Returns four character SOUNDEX code
SELECT DIFFERENCE('hello','hellow'); -- Returns difference of SOUNDEX value of two strings from 0 to 4, 0 is weak similarity, 4 is strong similarity
SELECT LEFT('HELLOHI',2); -- Returns n number of characters from left of string
SELECT RIGHT('HELLOHI',2); -- Returns n number of characters from left of string
SELECT LEN('HELLOHI'); -- Returns length of string
SELECT LOWER('HELLOHI'); -- Returns string in lower case
SELECT UPPER('HELLOHI'); -- Returns String in upper case
SELECT LTRIM('     HELLO       '); -- left trim
SELECT RTRIM('     HELLO       '); -- right trim
SELECT TRIM('     HELLO       '); -- left and right trim
SELECT NCHAR(65); -- Unicode character corresponding to given integer code
SELECT REVERSE('HELLO'); -- Reverse given string
SELECT PATINDEX('%@gmail%','sony.sth8@gmail.com'); -- Returns index of first occurence of given pattern in given string -- With CHARINDEX, we cannot use wildcard.... With PATINDEX, we can use wil card
SELECT SUBSTRING('SONYSHRESTHA',2,3); -- Get part of string from given string
SELECT REPLICATE('SONYSHRESTHA',2); -- Replicate string specified number of times
SELECT REPLACE('SONYSHRESTHA','ONY','ony'); -- Replace a expression with another expression in given string 
SELECT STUFF('SONYSHRESTHA',2,5,'hellohi'); -- Deletes a specified length of characters and inserts another set of characters at specified starting position
SELECT SPACE(5); -- Returns specified number of spaces


-- Get number of email ids in each domain category
create table employee_email(email varchar(100));
insert into employee_email values('sony.sth8@gmail.com'),('pop.sth8@gmail.com'),('sony.sth8@extensodata.com'),('stha.sth8@gmail.com');

select 
SUBSTRING(email,charindex('@',email)+1,len(email)-charindex('@',email)+1) as domain_name,count(1) as domain_count
from employee_email
group by SUBSTRING(email,charindex('@',email)+1,len(email)-charindex('@',email)+1);