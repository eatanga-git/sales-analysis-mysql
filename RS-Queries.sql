CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE sales (
	Transaction_ID INT PRIMARY KEY auto_increment,
    date_ Date,
    Customer_ID VARCHAR(10),
    Gender ENUM('Male', 'Female'),
    Age INT,
    Product_Category VARCHAR(100),
    Quantity INT,
    Price_per_Unit DECIMAL(10,2),
    Total_Amount DECIMAL(10,2)
);


-- Total Revenue by Month
SELECT DATE_FORMAT(date_, '%Y-%m') AS month, SUM(Total_Amount) AS total_Revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Top 10 Selling Product Categories
SELECT Product_Category, SUM(Quantity) AS total_sold
FROM sales
GROUP BY Product_Category
ORDER BY total_sold DESC
LIMIT 10;

-- Customer Demographics Breakdown
SELECT Gender, AVG(Age) AS avg_age, COUNT(DISTINCT Customer_ID) AS total_customers, SUM(Total_Amount) AS total
FROM sales
GROUP BY Gender;

-- Average Order Value (AOV)
SELECT Customer_ID, ROUND(AVG(Price_per_unit), 2) as avg_order_value
FROM sales
GROUP BY Customer_ID 
ORDER BY avg_order_value DESC;
