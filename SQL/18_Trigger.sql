-- Description: Trigger
-- Author: Sony Shrestha
-- Date: 2021-08-05

/*
There are 3 types of triggers.
a) DML Trigger
b) DDL Trigger
c) Logon Trigger
*/

-- DML Triggers are fired automatically in response to DML events such as INSERT, UPDATE and DELETE
-- They can be classified into:
-- a) AFTER Trigger
-- b) INSTEAD OF Trigger


-- > AFTER TRIGGER
SELECT * FROM employee;

drop table if exists log;

create table log(
id int not null identity(1,1),
before_id int,
after_id int,
action_performed varchar(100));

CREATE TRIGGER after_insert 
ON employee FOR INSERT 
AS
BEGIN 
	DECLARE @id int;
	SELECT @id=id FROM inserted;
	insert into log(after_id,action_performed) VALUES( @id,'after_insert');
END


insert into employee values(7,'E7',1);

SELECT * FROM log;



CREATE TRIGGER after_delete
ON employee FOR DELETE 
AS
BEGIN 
	DECLARE @id int;
	SELECT @id=id FROM deleted;
	insert into log(after_id,action_performed) VALUES( @id,'after_delete');
END



delete from employee where id=7;

select * from log;





CREATE TRIGGER after_update
ON employee FOR UPDATE 
AS
BEGIN 
	DECLARE @before_id int;
	DECLARE @after_id int;
	SELECT @before_id=id FROM deleted;
	SELECT @after_id=id FROM inserted;
	insert into log(before_id,after_id,action_performed) VALUES(@before_id, @after_id,'after_update');
END



update employee set id=6 where id=5;

select * from log;




-- > INSTEAD OF TRIGGER
-- In case of SQL, trigger is executed instead of DML action being performed. i.e insert does not happen after this trigger being executed.
-- In case of MySQL, trigger is executed before DML action is performed. i.e. insert happens after this trigger is executed.
select * from employee;

truncate table log;

ALTER TRIGGER before_insert 
ON employee INSTEAD OF INSERT 
AS
BEGIN 
	DECLARE @id int;
	DECLARE @name varchar(100);
	DECLARE @manager_id int;
	SELECT @id=id FROM inserted;
	SELECT @name=name FROM inserted;
	SELECT @manager_id=manager_id FROM inserted;
	insert into log(after_id,action_performed) VALUES( @id,'before_insert');
	insert into employee values(@id,@name,@manager_id);
END

insert into employee values (7,'E7',1);

select * from log;

select * from employee;



ALTER TRIGGER before_insert 
ON employee INSTEAD OF INSERT 
AS
BEGIN 
	DECLARE @id int
	DECLARE @name varchar(100)
	DECLARE @manager_id int
	SELECT @id=id FROM inserted
	SELECT @name=name FROM inserted
	SELECT @manager_id=manager_id FROM inserted
	if (@id =0)
	BEGIN
		Raiserror ('Id cannot be zero',16,1)
		return
	END
	insert into employee values(@id,@name,@manager_id)
END;


INSERT INTO employee VALUES (0,'E0',1);






CREATE TRIGGER before_update 
ON employee INSTEAD OF UPDATE 
AS
BEGIN 
	DECLARE @id int
	DECLARE @name varchar(100)
	DECLARE @manager_id int
	SELECT @id=id FROM inserted
	SELECT @name=name FROM inserted
	SELECT @manager_id=manager_id FROM inserted
	IF UPDATE(id)
	BEGIN
		Raiserror ('Id cannot be updated',16,1)
		return
	END
	insert into employee values(@id,@name,@manager_id)
END;


UPDATE employee SET name='EE2' where id=2;


select * from employee;

UPDATE employee SET id=3 where name='E5';



-- Note: UPDATE(col_name) returns true if update operation is performed for field named col_name