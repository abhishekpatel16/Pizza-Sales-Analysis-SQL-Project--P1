# Pizza-Sales-Analysis-SQL-Project


## Project Overview

**Project Title**: Pizza Sales Analysis  

**Database**: `pizza_db`


### KPI's Requirement

-- 1. Total Revenue

-- 2. Average Order Value

-- 3. Total Pizzas Sold

-- 4. Total Orders

-- 5. Average Pizzas Per Order



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

-- 3. Percentage of Sales by Pizza Category

-- 4. Percentage of Sales by Pizza Size

-- 5. Total Pizzas Sold by Pizza Category

-- 6. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

-- 7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders



1. **Daily Trend for Total Orders**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

2. **Hourly Trend for Total Orders**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

3. **Percentage of Sales by Pizza Category**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

4. **Percentage of Sales by Pizza Size**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

5. **Total Pizzas Sold by Pizza Category**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

6. **Top 5 Best Sellers by Revenue, Total Quantity and Total Orders**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

7. **Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```




