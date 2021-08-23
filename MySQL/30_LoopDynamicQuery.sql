drop procedure if exists looping;
delimiter //
create procedure looping() 
begin
set @counter=1;

drop table IF EXISTS QA.query_list;
create table QA.query_list(id int not null primary key auto_increment,query varchar(1000));
insert into QA.query_list(query)
select
concat('select customer_code,account_number,',criteria_id,' as criteria_id from watchlist_facts.',table_name,' where ', group_concat(fact_name,sign,value separator ' and '),';') as query FROM watchlist_master.md_criteria_rule_mapping crm
inner join watchlist_master.md_criteria mc
on mc.id=crm.criteria_id
inner join watchlist_master.md_rule mr
on mr.id=crm.rule_id
inner join watchlist_master.md_category mcat
on mc.category_id = mcat.id
inner join watchlist_master.md_loan_type ml
on ml.id=mc.loan_type_id
where crm.active_flag=1 and mc.active_flag=1 and mr.active_flag=1 and mcat.active_flag=1 and ml.active_flag =1
group by(criteria_id);

SET @max_count=(select max(id) from QA.query_list);
while @counter<=@max_count do
set @query=(SELECT concat('insert into QA.`watchlist_customer_criteria_status`(customer_code,account_number,criteria_id) ', query) from QA.query_list where id=@counter);
PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET @counter = @counter + 1;
end while;
end //
delimiter ;

call looping();