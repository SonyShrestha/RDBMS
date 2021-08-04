-- Description: SELCT Basics


-- Select limited number of rows
SELECT top 2 * FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] ;
SELECT top 2 level1_id FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] ;
SELECT top 1 percent level1_id FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] ;

-- like 
SELECT * FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] where level7_desc like 'Online%';
SELECT * FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] where level7_desc like '_n%';
SELECT * FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] where level7_desc like '[KN]%'; -- Not Supported in MYSQL
SELECT * FROM [RP_ESEWA_020].[rp_esewa_user_domainwise_bk] where level7_desc like '[^KN]%'; -- Not Supported in MYSQL

-- REGEXP
-- Not Supported in SQL


-- WHERE AND HAVING 
/*
a) WHERE can be used with SELECT, INSERT AND UPDATE statement.
HAVING can be used with SELECT statement only.

b) WHERE applies filter before aggregation.
HAVING pplies filter after aggregation.

c) Aggregate functions cannot be used in WHERE clause.
Aggregate functions can be used in HAVING clause. 
*/