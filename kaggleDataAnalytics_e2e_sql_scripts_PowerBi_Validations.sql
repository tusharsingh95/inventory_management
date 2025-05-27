-- Power Bi	QUESTIONS VALIDATIONS with SQL  scripts

-- 1. Total Sales
SELECT 
    SUM(sale_price) AS Total_Sales
FROM 
    dbo.df_orders;

-- 2. Total Quantity Sold
SELECT 
    SUM(quantity) AS Total_Quantity_Sold
FROM 
    dbo.df_orders;

-- 3. Total Orders
SELECT 
    COUNT(order_id) AS Total_Orders
FROM 
    dbo.df_orders;

-- 4. Total Profit
SELECT 
    SUM(profit) AS Total_Profit
FROM 
    dbo.df_orders;

-- 5. Total Discounts Given
SELECT 
    SUM(discount) AS Total_Discounts_Given
FROM 
    dbo.df_orders;

-- 6. Discounts Given by Category
SELECT 
    category,
    SUM(discount * quantity) AS Discounts_Given
FROM 
    dbo.df_orders
GROUP BY 
    category;

-- 7. Total Profit by Category
SELECT 
    category,
    SUM(profit) AS Total_Profit
FROM 
    dbo.df_orders
GROUP BY 
    category;

-- 8. Total Sales by Region
SELECT 
    region,
    SUM(sale_price * quantity) AS Total_Sales
FROM 
    dbo.df_orders
GROUP BY 
    region;

-- 9. Sales by Category and Sub-Category
SELECT 
    category,
    sub_category,
    SUM(sale_price) AS Sales
FROM 
    dbo.df_orders
GROUP BY 
    category, sub_category
	order by category, sub_category;

-- 10. Profit by Category and Sub-Category
SELECT 
    category,
    sub_category,
    SUM(profit) AS Profit
FROM 
    dbo.df_orders
GROUP BY 
    category, sub_category
	order by category, sub_category;

-- 11. Orders by Category and Sub-Category
SELECT 
    category,
    sub_category,
    COUNT(order_id) AS Orders
FROM 
    dbo.df_orders
GROUP BY 
    category, sub_category
	order by category, sub_category;


-- 12. Quantity by Category and Sub-Category
SELECT 
    category,
    sub_category,
    SUM(quantity) AS Quantity
FROM 
    dbo.df_orders
GROUP BY 
    category, sub_category
	order by category, sub_category;



