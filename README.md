# Pizza-Sales-Analysis-SQL-Project


## Project Overview

**Project Title**: Pizza Sales Analysis  

**Database**: `pizza_db`

**Tools Used**: MS SQL Server


## Project Structure

### Database Setup

- **Database Creation**: The project starts by creating a database named `pizza_db`.
- **Table Creation**: A table named `pizza_sales` is created to store the sales data. The table structure includes columns for pizza_id, order_id, pizza_name_id, quantity, order_date, order_time, unit_price, total_price, pizza_size, pizza_category and pizza_ingredients.


## Problem Statement

### KPI's Requirement
We need to analyze key indicators for our pizza sales data to gain insights into our business performance. Specifically, we want to calculate the following metrics:

-- 1. **Total Revenue**: The sum of the total price of all pizza orders.

-- 2. **Average Order Value**: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.

-- 3. **Total Pizzas Sold**: The sum of the quantities of all pizzas sold.

-- 4. **Total Orders**: The total number of orders placed.

-- 5. **Average Pizzas Per Order**: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

1. **Total Revenue**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```
![Total Revenue](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/KPI/1%20Total%20Revenue.png)

2. **Average Order Value**:
```sql
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales
```
![Average Order Value](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/KPI/2%20Avg%20Order%20Value.png)

3. **Total Pizzas Sold**:
```sql
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
```
![Total Pizzas Sold](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/KPI/3%20Total%20Pizza%20Sold.png)


4. **Total Orders**:
```sql
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
```
![Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/KPI/4%20Total%20Orders.png)

5. **Average Pizzas Per Order**:
```sql
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_Per_Order FROM pizza_sales
```
![Average Pizzas Per Order](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/KPI/5%20Average%20Pizzas%20Per%20Order.png)


### Charts Requirement

-- 1. Daily Trend for Total Orders

-- 2. Hourly Trend for Total Orders

-- 3. Monthly Trend for Total Orders

-- 4. Percentage of Sales by Pizza Category

-- 5. Percentage of Sales by Pizza Size

-- 6. Total Pizzas Sold by Pizza Category

-- 7. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

-- 8. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders


1. **Daily Trend for Total Orders**:
```sql
SELECT DATENAME(DW, order_date) AS Order_Day, 
COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
```
![Daily Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/1%20Daily%20Trend%20for%20Total%20Orders.png)

2. **Hourly Trend for Total Orders**:
```sql
SELECT DATEPART(HOUR, order_time) AS Order_Hours, 
COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
```
![Hourly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/2%20Hourly%20Trend%20for%20Total%20Orders.png)

3. **Monthly Trend for Total Orders**:
```sql
SELECT DATENAME(MONTH, order_date) AS Month_Name, 
COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/3%20Monthly%20Trend%20for%20Total%20Orders.png)

4. **Percentage of Sales by Pizza Category**:
```sql
SELECT pizza_category, 
SUM(total_price) AS Total_Sales,
SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS PCT_Total_Sales
FROM pizza_sales 
GROUP BY pizza_category
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/4%20Percentage%20of%20Sales%20by%20Pizza%20Category.png)

**Jan Month**:
```sql
SELECT pizza_category, 
SUM(total_price) AS Total_Sales,
SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT_Total_Sales
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/4%20Jan.png)

5. **Percentage of Sales by Pizza Size**:
```sql
SELECT pizza_size, 
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT_Total_Sales
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT_Total_Sales DESC
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/5%20Percentage%20of%20Sales%20by%20Pizza%20Size.png)

**First Quarter**:
```sql
SELECT pizza_size, 
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART (QUARTER, order_date) =1) 
AS DECIMAL(10,2)) AS PCT_Total_Sales
FROM pizza_sales 
WHERE DATEPART (QUARTER, order_date) =1 
GROUP BY pizza_size
ORDER BY PCT_Total_Sales DESC
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/5%20-First%20Quarter.png)

6. **Total Pizzas Sold by Pizza Category**:
```sql
SELECT pizza_category,
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/6%20Total%20Pizzas%20Sold%20by%20Pizza%20Category.png)

7. **Top 5 Best Sellers by Revenue, Total Quantity and Total Orders**:
```sql
SELECT TOP 5 pizza_name, 
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/7%20Top%205%20Best%20Sellers%20by%20Revenue%2C%20Total%20Quantity%20and%20Total%20Orders.png)

8. **Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders**:
```sql
SELECT TOP 5 pizza_name, 
SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
```
![Monthly Trend for Total Orders](https://github.com/abhishekpatel16/Pizza-Sales-Analysis-SQL-Project--P1/blob/main/Charts/8%20Bottom%205%20Best%20Sellers%20by%20Revenue%2C%20Total%20Quantity%20and%20Total%20Orders.png)
