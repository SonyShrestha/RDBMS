-- Description: View
-- View is like a virtual table. It is nothing more than a saved SQL Query.

CREATE VIEW vw_employee AS
SELECT * FROM employee;

SELECT * FROM employee;
select * from vw_employee;

update vw_employee set name='Sony' where id=1;


-- To get view defination
sp_helptext vw_employee;


-- ALTER VIEW
ALTER VIEW vw_employee AS
SELECT id,name FROM employee;

select * from vw_employee;



-- Drop View
DROP VIEW vw_employee;


/*
Advantages of View 
a) 