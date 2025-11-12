SELECT *
FROM COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP;

----Exploring DATAAnalysis

--checking number of stores 
SELECT DISTINCT store_location
FROM COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP;

------Checking number of product category
SELECT DISTINCT product_category
FROM COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP;
--Checking number of product type

SELECT DISTINCT product_type
FROM COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP;
------Date functions 
-------checking the earliest transaction date 
SELECT min(transaction_date) AS first_oparating_date
FROM COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP;
---
SELECT max(transaction_date) AS lastest_oparating_date
FROM COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP;
----------------------------------------------

select transaction_date,
DAYNAME(transaction_date)AS day_name,
CASE 
WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
ELSE 'weekdays'a
END AS day_classification,
MONTHNAME(transaction_date) AS month_name,
transaction_time,
CASE 
WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN  'morning' 
WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN  'afternoon'
ELSE 'evening'
END  time_bucket,
HOUR(transaction_time) AS hour_of_day,
SUM(transaction_qty * unit_price) AS revenue
transaction_id,
transaction_qty,
store_id,
store_location,
product_id,
product_category,
product_type,
product_detail
from COFFE.SH0P_SALES.BRIGHT_COFFE_SHOP
GROUP BY ALL;
