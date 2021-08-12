-- Description: Clear query and execution plan cache
-- Author: Sony Shrestha
-- Date: 2021-08-05

SELECT * FROM INFORMATION_SCHEMA.TABLES;

select * from INFORMATION_SCHEMA.COLUMNS;



checkpoint
GO

DBCC DROPCLEANBUFFERS -- Clear query cache
GO


DBCC FREEPROCCACHE -- Clears execution plan cache
GO