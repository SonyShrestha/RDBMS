-- Description: Merge

/*
Is allows us to perform insert, update and delete in one statement.

With merge statement, we require two tables
a) Source table: contains changes that needs to be applied to target table
b) Target table: table that requires changes to be performed such as insert, update and delete
*/

CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
GO
    
CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)
GO
    
    
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts



/*
MERGE TargetProducts AS Target
USING SourceProducts	AS Source
ON Source.ProductID = Target.ProductID
    
-- For Inserts
WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName, Price) 
    VALUES (Source.ProductID,Source.ProductName, Source.Price)
    
-- For Updates
WHEN MATCHED THEN UPDATE SET
    Target.ProductName	= Source.ProductName,
    Target.Price		= Source.Price
    
-- For Deletes
WHEN NOT MATCHED BY Source THEN
    DELETE
*/

MERGE TargetProducts AS target
USING SourceProducts AS source 
on source.ProductID =target.ProductID 
WHEN NOT MATCHED BY target THEN INSERT 
	(ProductID,ProductName,Price) VALUES(source.ProductID,source.ProductName,source.Price)
WHEN MATCHED THEN UPDATE 
	SET target.ProductName=source.ProductName, target.Price=target.Price
when not matched by source then DELETE;
