use master;

-- Create table to load data using python libraries sqlalchemy, pandas
create table dbo.df_orders
(
order_id int primary key,
order_date date,
ship_mode varchar(20),
segment varchar(20),
country varchar(20),
city varchar(20),
state varchar(20),
postal_code varchar(20),
region varchar(20),
category varchar(20),
sub_category varchar(20),
product_id varchar(50),
quantity int,
discount decimal(7,2),
sale_price decimal(7,2),
profit decimal(7,2)
);

-- Verify the loaded data
select * from df_orders;

--find top 10 highest reveue generating products 
select top 10 product_id,sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc;




--find top 5 highest selling products in each region
with cte as (
select region,product_id,sum(sale_price) as sales
from df_orders
group by region,product_id)
select * from (
select *
, row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5



--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
with cte as (
select year(order_date) as order_year,month(order_date) as order_month,
sum(sale_price) as sales
from df_orders
group by year(order_date),month(order_date)
--order by year(order_date),month(order_date)
	)
select order_month
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by order_month
order by order_month



--for each category which month had highest sales 
with cte as (
select category,format(order_date,'yyyyMM') as order_year_month
, sum(sale_price) as sales 
from df_orders
group by category,format(order_date,'yyyyMM')
--order by category,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a
where rn=1



--which sub category had highest growth by profit in 2023 compare to 2022
with cte as (
select sub_category,year(order_date) as order_year,
sum(sale_price) as sales
from df_orders
group by sub_category,year(order_date)
--order by year(order_date),month(order_date)
	)
, cte2 as (
select sub_category
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by sub_category
)
select top 1 *
,(sales_2023-sales_2022)
from  cte2
order by (sales_2023-sales_2022) desc

-- Find the Average Discount Given by Each Region
SELECT region, 
       AVG(discount) AS average_discount
FROM df_orders
GROUP BY region
ORDER BY average_discount DESC;

-- Calculate the Total Profit by Product Category
SELECT category, 
       SUM(profit) AS total_profit
FROM df_orders
GROUP BY category
ORDER BY total_profit DESC;

-- Find the Top 5 Products with the Highest Quantity Sold
SELECT TOP 5 product_id, 
       SUM(quantity) AS total_quantity_sold
FROM df_orders
GROUP BY product_id
ORDER BY total_quantity_sold DESC;

-- Find the Total Sales by Category and Ship Mode
SELECT category, ship_mode, 
       SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY category, ship_mode
ORDER BY category, total_sales DESC;


-- Identify the Top 3 Cities by Number of Orders in Each Region
WITH cte AS (
    SELECT region, city, 
           COUNT(order_id) AS number_of_orders
    FROM df_orders
    GROUP BY region, city
)
SELECT region, city, number_of_orders
FROM (
    SELECT region, city, number_of_orders,
           ROW_NUMBER() OVER(PARTITION BY region ORDER BY number_of_orders DESC) AS rn
    FROM cte
) ranked
WHERE rn <= 3;



--  Determine Which Products Have the Highest Profit Margins
SELECT product_id, 
       SUM(profit) / NULLIF(SUM(sale_price), 0) AS profit_margin
FROM df_orders
GROUP BY product_id
ORDER BY profit_margin DESC;


--  Identify the Most Popular Shipping Mode by Region
SELECT region, 
       ship_mode,
       COUNT(*) AS mode_count
FROM df_orders
GROUP BY region, ship_mode
ORDER BY region, mode_count DESC;

--  Determine the Average Profit Margin by Product Sub-Category
SELECT sub_category,
       AVG(profit / sale_price) AS average_profit_margin
FROM df_orders
WHERE sale_price > 0
GROUP BY sub_category
ORDER BY average_profit_margin DESC;

-- Find Monthly Sales Trend for Each Segment
SELECT segment,
       FORMAT(order_date, 'yyyy-MM') AS order_month,
       SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY segment, FORMAT(order_date, 'yyyy-MM')
ORDER BY segment, order_month;

-- Identify the Region with the Highest Average Order Value
SELECT region,
       AVG(sale_price) AS average_order_value
FROM df_orders
GROUP BY region
ORDER BY average_order_value DESC;

-- Calculate Year-Over-Year Growth in Sales
WITH yearly_sales AS (
    SELECT YEAR(order_date) AS order_year,
           SUM(sale_price) AS total_sales
    FROM df_orders
    GROUP BY YEAR(order_date)
)
SELECT order_year,
       total_sales,
       LAG(total_sales) OVER (ORDER BY order_year) AS previous_year_sales,
       ((total_sales - LAG(total_sales) OVER (ORDER BY order_year)) / 
        LAG(total_sales) OVER (ORDER BY order_year)) * 100 AS year_over_year_growth
FROM yearly_sales
ORDER BY order_year;


-- Calculate the Year-Over-Year Growth Rate for Each Sub-Category
WITH yearly_sales AS (
    SELECT sub_category, 
           YEAR(order_date) AS order_year, 
           SUM(sale_price) AS total_sales
    FROM df_orders
    GROUP BY sub_category, YEAR(order_date)
),
sales_with_growth AS (
    SELECT sub_category,
           order_year,
           total_sales,
           LAG(total_sales) OVER (PARTITION BY sub_category ORDER BY order_year) AS previous_year_sales,
           COALESCE(total_sales - LAG(total_sales) OVER (PARTITION BY sub_category ORDER BY order_year), 0) AS absolute_growth,
           COALESCE(
               (total_sales - LAG(total_sales) OVER (PARTITION BY sub_category ORDER BY order_year)) / 
               LAG(total_sales) OVER (PARTITION BY sub_category ORDER BY order_year) * 100, 
               0
           ) AS growth_rate
    FROM yearly_sales
)
SELECT sub_category,
       order_year,
       total_sales AS current_year_sales,
       previous_year_sales,
       absolute_growth,
       growth_rate
FROM sales_with_growth
WHERE order_year IN (2022, 2023)
ORDER BY sub_category, order_year;