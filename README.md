# Pizza-Sales-Analysis-SQL-Project--P1


## Project Overview

**Project Title**: Pizza Sales Analysis  

**Database**: `pizza_db`


### KPI's Requirement


1. **Total Revenue**:
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
```

2. **Average Order Value**:
```sql
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales
```

3. **Total Pizzas Sold**:
```sql
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
```

4. **Total Orders**:
```sql
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
```

5. **Average Pizzas Per Order**:
```sql
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_Per_Order FROM pizza_sales
```










