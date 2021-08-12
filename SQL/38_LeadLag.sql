-- Lead and Lag
-- Lead is used to access next row data along with current row data 
-- Lag is used to access previous row data along with current row data

-- LEAD(col,offset,default_value) over(order by col1,col2)
-- LAG(col,offset,default_value) over(order by col1,col2)

-- If default is not specified, NULL is returned


-- lag
SELECT account_number,tran_date,lcy_amount,
lag(lcy_amount,1,0) over(order by tran_date) as balance_before_1_day
FROM fc_balance_summary where account_number='b58f0552fcaf72601839b5985a680245586d4d53';


-- lead
SELECT account_number,tran_date,lcy_amount,
lead(lcy_amount,1,0) over(order by tran_date) as balance_before_1_day
FROM fc_balance_summary where account_number='b58f0552fcaf72601839b5985a680245586d4d53';