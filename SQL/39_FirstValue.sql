-- first_value

-- returns first value from given partition(group)
SELECT account_number,tran_date,lcy_amount,
first_value(lcy_amount) over(order by tran_date) as balance_before_1_day
FROM dax_raw.fc_balance_summary 
where account_number='b58f0552fcaf72601839b5985a680245586d4d53';