
select * from pizza_sales

-- KPI's Requirement
-- 1. Total Revenue
-- 2. Average Order Value
-- 3. Total Pizzas Sold
-- 4. Total Orders
-- 5. Average Pizzas Per Order


-- 1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

-- 2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

-- 5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_Per_Order FROM pizza_sales

-- Charts Requirement
-- 1. Daily Trend for Total Orders
-- 2. Hourly Trend for Total Orders
-- 3. Monthly Trend for Total Orders
-- 4. Percentage of Sales by Pizza Category
-- 5. Percentage of Sales by Pizza Size
-- 6. Total Pizzas Sold by Pizza Category
-- 7. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
-- 8. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

-- 1. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS Order_Day, 
COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- 2. Hourly Trend for Total Orders
SELECT DATEPART(HOUR, order_time) AS Order_Hours, 
COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

-- 3. Monthly Trend for Total Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name, 
COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)


-- 4. Percentage of Sales by Pizza Category
SELECT pizza_category, 
SUM(total_price) AS Total_Sales,
SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS PCT_Total_Sales
FROM pizza_sales 
GROUP BY pizza_category

-- Jan Month
SELECT pizza_category, 
SUM(total_price) AS Total_Sales,
SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT_Total_Sales
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

-- 5. Percentage of Sales by Pizza Size
SELECT pizza_size, 
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT_Total_Sales
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT_Total_Sales DESC

-- First Quarter
SELECT pizza_size, 
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART (QUARTER, order_date) =1) 
AS DECIMAL(10,2)) AS PCT_Total_Sales
FROM pizza_sales 
WHERE DATEPART (QUARTER, order_date) =1 
GROUP BY pizza_size
ORDER BY PCT_Total_Sales DESC



-- 6. Total Pizzas Sold by Pizza Category
SELECT pizza_category,
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category


-- 7. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT TOP 5 pizza_name, 
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

-- 8. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT TOP 5 pizza_name, 
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC