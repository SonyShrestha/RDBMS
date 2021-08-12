-- iif
-- returns one of two values depending on whether the boolean expression evaluates to true or false

-- IIF(boolean_expression, true_value,false_value)
select *,iif(country='india',1,0) as country_is_india from sales_details;
