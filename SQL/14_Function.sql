-- Description: UserDefinedFunction
/*
Important Concepts related to Function
a) Deterministic Function: Returns same result set any time they are called with the specific set of input values and given same state of database.
	Eg: SUM(), COUNT(), RAND(seed_value)
b) Non-deterministic Function: returns different result each time they are called with the specific set of input values and given same state of database.
	Eg: RAND()
*/



/*
3 types of user defined function
a) Scalar Function
b) Inline table-valued function
c) Multi-statement table-valued function
*/

/*
Stored Procedure and Function can both accept paramater and return a value.
But,
We cannot use Stored Procedure in SELECT and WHERE clause.
*/


-- > Scalar Function
-- It may or may not have parameter, but always return a single(scalar) value
CREATE FUNCTION get_level7_desc(@level7_id int)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @return_value varchar(100);
	set @return_value=(SELECT TOP 1 level7_desc FROM [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk]
	WHERE level7_id=@level7_id);
	return @return_value;
END


ALTER FUNCTION get_level7_desc(@level7_id int)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @return_value varchar(100);
	set @return_value=(SELECT TOP 1 level7_desc FROM [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk]
	WHERE level7_id=@level7_id);
	return @return_value;
END


select level7_id,dbo.get_level7_desc(level7_id) from [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk];


-- Get text of function
sp_helptext get_level7_desc

-- Get information about function and parameters being used 
sp_help get_level7_desc

-- Get information about function and parameters being used 
sp_depends get_level7_desc





-- > Inline table valued functions
-- returns a table
CREATE FUNCTION get_level7_desc(@level7_id int)
RETURNS TABLE
AS
	RETURN (SELECT TOP 1 level7_desc FROM [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk] WHERE level7_id=@level7_id);

SELECT * FROM get_level7_desc(1122);


/*
Difference between Scalar and Inline Table valued function
a) Scalar function returns a scalar value. Inline Table valued function returns table.
b) Scalar function encloses body within BEGIN and END. There is no BEGIN and END within Inline table valued function.
c) The Structure of table that gets returned is determined by SELECT statement with function.
*/

-- Inline table valued function can be used in select statement. It can also be used in join with other tables.
-- Inline table valued function can be used to achieve functionality of Parameterized View.



--> Multi-statement table valued function
CREATE FUNCTION get_mstvf_level7_desc(@level7_id int)
RETURNS @table TABLE(level7_desc varchar(100))
AS
BEGIN
	INSERT INTO @table
	SELECT TOP 1 level7_desc FROM [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk] WHERE level7_id=@level7_id;
	RETURN
END
SELECT * FROM get_mstvf_level7_desc(1291);

/*
Difference between inline-table valued function and multi-statement table valued function
Inline-table valued function						Multi-statement table valued function
a) We cannot specify structure of table
that gets returned
b) cannot have BEGIN and END clause
c) Better for performance as it is treated like		c) Less better as it is treated like stored procedure
view.
d) It is possible to update underlying table		d) It is not possible to update underlying table
using inline table valued function
*/


ALTER FUNCTION get_level7_desc()
RETURNS TABLE
AS
	RETURN (SELECT * FROM [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk]);

SELECT * FROM get_level7_desc();

UPDATE get_level7_desc() SET level3_desc='not defined' where level3_id=9999; -- Updated



ALTER FUNCTION get_mstvf_level7_desc()
RETURNS @table TABLE(level3_id int,level3_desc varchar(100))
AS
BEGIN
	INSERT INTO @table
	SELECT level3_id,level3_desc FROM [RP_ESEWA_020].[RP_ESEWA_020].[rp_esewa_user_domainwise_bk];
	RETURN
END
SELECT * FROM get_mstvf_level7_desc();

UPDATE get_mstvf_level7_desc() SET level3_desc='undefined' where level3_id=9999; -- Object 'get_mstvf_level7_desc' cannot be modified.






------------------------> WITH ENCRPTION
CREATE FUNCTION get_emp(@id int)
RETURNS nvarchar(100)
BEGIN
	RETURN (SELECT name from employee where id=@id)
END


select dbo.get_emp(2);

-- To view the defination of function, we can use sp_helptext
sp_helptext get_emp;

-- To encrpyt this text we can use WITH ENCRYPTION while creating function
ALTER FUNCTION get_emp(@id int)
RETURNS nvarchar(100)
WITH ENCRYPTION
BEGIN
	RETURN (SELECT name from employee where id=@id)
END


-- Now when we try to view function defination, we will message stating that text for object is encrypted
sp_helptext get_emp;





----> WITH SCHEMABINDING 
/* 
Suppose, we have a function which is referencing to a table. 
In case we delete this table and try to call function, we will get error messgae stating that table is not found.
With SCHEMABINDING, we will be able to prevent dropping referenced table.
*/


ALTER FUNCTION get_emp(@id int)
RETURNS nvarchar(100)
WITH ENCRYPTION
BEGIN
	RETURN (SELECT name from employee1 where id=@id)
END

drop table dbo.employee1;

select dbo.get_emp(1);




ALTER FUNCTION get_emp(@id int)
RETURNS nvarchar(100)
WITH SCHEMABINDING, ENCRYPTION
BEGIN
	RETURN (SELECT name from dbo.employee where id=@id)
END

drop table dbo.employee; -- Cannot drop the table 'dbo.employee1', because it does not exist or you do not have permission.

select dbo.get_emp(1);


-- Note: When we use WITH SCHEMABINDING in function, body should contain names in two-part format
/*
ALTER FUNCTION get_emp(@id int)
RETURNS nvarchar(100)
WITH SCHEMABINDING
BEGIN
	RETURN (SELECT name from employee where id=@id) -- This will raise error. To resolve, we should use dbo.employee
END
*/
