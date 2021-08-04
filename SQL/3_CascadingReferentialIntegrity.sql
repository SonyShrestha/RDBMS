-- Description: Cascading Referential Integrity

/*
Cascading Referential Integrity constraint 
allows to define the action to be taken when a user attempts to delete or update a key to which existing foreign key references to 
By default, we will get error messga eon such updates or deletion
*/

/*
a) NO ACTION
When a user tries to delete/update the row to which foreign key references to,
an error is raised.

b) CASCADE
When a user tries to delete/update the row to which foreign key references to,
all rows containing those foreign keys will also be deleted/updated.

c) SET NULL
When a user tries to delete/update the row to which foreign key references to,
all rows containing those foreign keys are set to NULL.

d) SET DEFAULT
When a user tries to delete/update the row to which foreign key references to,
all rows containing those foreign keys are set to DEFAULT values.
*/



drop table manager;
drop table employee;

CREATE TABLE manager
( 
id int not null primary key,
name varchar(100)
);

SET IDENTITY_INSERT  manager on;
insert into manager(id,name) values(1,'M1'),(2,'M2'),(3,'M3');


select * from manager;


DROP TABLE employee;
CREATE TABLE employee
( 
id int,
name varchar(100),
manager_id int,
foreign key (manager_id) references manager(id) on update cascade on delete cascade
);


CREATE TABLE employee
( 
id int,
name varchar(100),
manager_id int,
foreign key (manager_id) references manager(id) on update no action on delete no action
);



CREATE TABLE employee
( 
id int,
name varchar(100),
manager_id int default 3,
foreign key (manager_id) references manager(id) on update set null on delete set null
);


CREATE TABLE employee
( 
id int,
name varchar(100),
manager_id int default 3,
foreign key (manager_id) references manager(id) on update set default on delete set default
);

insert into employee(id,name,manager_id) values(1,'E1',2),(2,'E2',2),(3,'E3',3);



SET IDENTITY_INSERT  employee off;

DELETE FROM manager WHERE id=2;

select * from employee;


update manager set id=4 where id=1;


-- Add constraint into existing table
ALTER TABLE employee 
ADD CONSTRAINT fk1 FOREIGN KEY(manager_id) REFERENCES manager(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Note:
/*
We cannot insert value of field if that field is identity field.
To insert value for identity field, we have to ON IDENTITY_INSERT
SET IDENTITY_INSERT table1 ON;

To insert value for identity field on second table, we have to off identity_insert on first table then on identity_insert on second table
SET IDENTITY_INSERT table1 OFF;
SET IDENTITY_INSERT table2 ON;
*/