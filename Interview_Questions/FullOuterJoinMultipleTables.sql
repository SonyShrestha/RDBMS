set @cnt=0;
SELECT (@cnt:=@cnt + 1) as id  ,description,label,Prabhu_09_13__31_32_monitor,Prabhu_09_13__31_32_FD_monitor,
Prabhu_09_15__31_32_33_34__FD_monitor,Prabhu_09_15__31_32_33_34_monitor
 from (
select 
coalesce(a.description,b.description,c.description,d.description) as description, 
coalesce(a.label,b.label,c.label,d.label) as label,
a.this_run AS `Prabhu_09_13__31_32_monitor`,
b.this_run AS `Prabhu_09_13__31_32_FD_monitor`,
c.this_run AS `Prabhu_09_15__31_32_33_34__FD_monitor`,
d.this_run AS `Prabhu_09_15__31_32_33_34_monitor`
FROM `Prabhu_09_13__31_32_monitor`.`fc_data_analysis_processing` a
LEFT JOIN `Prabhu_09_13__31_32_FD_monitor`.`fc_data_analysis_processing` b
ON a.description=b.description
AND IFNULL(a.label,0)=IFNULL(b.label,0)
LEFT JOIN `Prabhu_09_15__31_32_33_34__FD_monitor`.`fc_data_analysis_processing` c
ON a.description=c.description
AND IFNULL(a.label,0)=IFNULL(c.label,0)
LEFT JOIN `Prabhu_09_15__31_32_33_34_monitor`.`fc_data_analysis_processing` d
ON a.description=d.description
AND IFNULL(a.label,0)=IFNULL(d.label,0)


UNION 

SELECT 

coalesce(a.description,b.description,c.description,d.description) as description, 
coalesce(a.label,b.label,c.label,d.label) as label,
a.this_run AS `Prabhu_09_13__31_32_monitor`,
b.this_run AS `Prabhu_09_13__31_32_FD_monitor`,
c.this_run AS `Prabhu_09_15__31_32_33_34__FD_monitor`,
d.this_run AS `Prabhu_09_15__31_32_33_34_monitor`
FROM `Prabhu_09_13__31_32_FD_monitor`.`fc_data_analysis_processing` b 
LEFT JOIN `Prabhu_09_13__31_32_monitor`.`fc_data_analysis_processing` a
ON b.description=a.description
AND IFNULL(b.label,0)=IFNULL(a.label,0)
LEFT JOIN `Prabhu_09_15__31_32_33_34__FD_monitor`.`fc_data_analysis_processing` c
ON b.description=c.description
AND IFNULL(b.label,0)=IFNULL(c.label,0)
LEFT JOIN `Prabhu_09_15__31_32_33_34_monitor`.`fc_data_analysis_processing` d
ON b.description=d.description
AND IFNULL(b.label,0)=IFNULL(d.label,0)


UNION 

SELECT 

coalesce(a.description,b.description,c.description,d.description) as description, 
coalesce(a.label,b.label,c.label,d.label) as label,
a.this_run AS `Prabhu_09_13__31_32_monitor`,
b.this_run AS `Prabhu_09_13__31_32_FD_monitor`,
c.this_run AS `Prabhu_09_15__31_32_33_34__FD_monitor`,
d.this_run AS `Prabhu_09_15__31_32_33_34_monitor`
FROM `Prabhu_09_15__31_32_33_34__FD_monitor`.`fc_data_analysis_processing` c
LEFT JOIN `Prabhu_09_13__31_32_monitor`.`fc_data_analysis_processing` a
ON c.description=a.description
AND IFNULL(c.label,0)=IFNULL(a.label,0)
LEFT JOIN `Prabhu_09_13__31_32_FD_monitor`.`fc_data_analysis_processing` b
ON c.description=b.description
AND IFNULL(c.label,0)=IFNULL(b.label,0)
LEFT JOIN `Prabhu_09_15__31_32_33_34_monitor`.`fc_data_analysis_processing` d
ON c.description=d.description
AND IFNULL(c.label,0)=IFNULL(d.label,0)



UNION 

SELECT 

coalesce(a.description,b.description,c.description,d.description) as description, 
coalesce(a.label,b.label,c.label,d.label) as label,
a.this_run AS `Prabhu_09_13__31_32_monitor`,
b.this_run AS `Prabhu_09_13__31_32_FD_monitor`,
c.this_run AS `Prabhu_09_15__31_32_33_34__FD_monitor`,
d.this_run AS `Prabhu_09_15__31_32_33_34_monitor`
FROM `Prabhu_09_15__31_32_33_34_monitor`.`fc_data_analysis_processing` d
LEFT JOIN `Prabhu_09_13__31_32_monitor`.`fc_data_analysis_processing` a
ON d.description=a.description
AND IFNULL(d.label,0)=IFNULL(a.label,0)
LEFT JOIN `Prabhu_09_13__31_32_FD_monitor`.`fc_data_analysis_processing` b
ON d.description=b.description
AND IFNULL(d.label,0)=IFNULL(b.label,0)
LEFT JOIN `Prabhu_09_15__31_32_33_34__FD_monitor`.`fc_data_analysis_processing` c
ON d.description=c.description
AND IFNULL(d.label,0)=IFNULL(c.label,0)
) a1
;