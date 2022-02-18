drop table if exists Queries;
drop table if exists test;
create table Queries(id int,query varchar(300),active_flag int);
insert into Queries values (1,'create table test.test(id int);',1);
insert into Queries values (2,'insert into test.test values(1),(2);',1);
delimiter $
create procedure p1()
begin 
set @counter=1;
set @max_count=(select count(1) from Queries);
while @counter <= @max_count do
    SELECT query into @query FROM Queries where id=@counter;
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    -- select * from test;
    DEALLOCATE PREPARE stmt;
    set @counter=@counter+1;
  end while;
end $
delimiter ;

call p1();

select * from test;
