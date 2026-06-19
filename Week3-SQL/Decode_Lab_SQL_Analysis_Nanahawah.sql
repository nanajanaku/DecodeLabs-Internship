-- DECODE LAB SQL DATA ANALYSIS
-- Prepared by: Ajanaku Nanahawah
-- Date: June 2026
--View all data--
SELECT TOP 10 *
FROM sales_table
 ---View all unique products--
SELECT DISTINCT Product AS Product_Name
FROM sales_table
--View all unique order statuses--
SELECT DISTINCT Order_Status AS ORDER_STATUS
FROM sales_table
 --View all unique payment methods
SELECT DISTINCT Payment_Method AS PAYMENT_METHOD
FROM sales_table
 ---View all unique referral sources
SELECT DISTINCT Referral_Source AS REFERRAL_SOURCE
FROM sales_table
---Overall descriptive statistics---
SELECT
    COUNT(*) AS Total_Orders,
    
    AVG(Revenue) AS Avg_Revenue,
    MIN(Revenue) AS Min_Revenue,
    MAX(Revenue) AS Max_Revenue,

    AVG(Quantity) AS Avg_Quantity,
    MIN(Quantity) AS Min_Quantity,
    MAX(Quantity) AS Max_Quantity,

    AVG(Unit_Price) AS Avg_UnitPrice,
    MIN(Unit_Price) AS Min_UnitPrice,
    MAX(Unit_Price) AS Max_UnitPrice,

    AVG(Items_In_Cart) AS Avg_ItemsInCart,
    MIN(Items_In_Cart) AS Min_ItemsInCart,
    MAX(Items_In_Cart) AS Max_ItemsInCart
FROM sales_table
--Total revenue by product--
SELECT
Product,
COUNT(*) AS Total_Product,
SUM(Revenue) AS Total_Revenue,
AVG(Revenue) AS Avg_Revenue
FROM sales_table
GROUP BY Product
ORDER BY Total_Revenue desc
---count of orders by status--
SELECT
Order_Status,
COUNT(*) AS Total_Orders
FROM sales_table
GROUP BY Order_Status
ORDER BY Total_Orders desc
---Revenue by payment method--
SELECT
Payment_Method,
COUNT(*) AS Total_Orders,
SUM(Revenue) AS Total_Revenue,
AVG(Revenue) AS Avg_Revenue
FROM sales_table
GROUP BY Payment_Method
ORDER BY Total_Revenue
---Revenue by referral source--
SELECT
Referral_Source,
COUNT(*) AS Total_Orders,
SUM(Revenue) AS Total_Revenue,
AVG(Revenue) AS Avg_Revenue
FROM sales_table
GROUP BY Referral_Source
ORDER BY Total_Orders
---Revenue by coupon code---
SELECT
Coupon_Code,
COUNT(*) AS Total_Orders,
SUM(Revenue) AS Total_Revenue,
AVG(Revenue) AS Avg_Revenue
FROM sales_table
GROUP BY Coupon_Code
ORDER BY Total_Orders DESC
---OUTLIERS DETECTION---
SELECT
Order_Id,
Product,
Quantity,
Unit_Price,
Revenue,
CASE
WHEN Revenue>3330 THEN 'Outlier'
ELSE 'Normal'
END AS Outlier_flag
FROM sales_table
ORDER BY Revenue DESC
---Count total outliers---
SELECT
COUNT(*) AS Total_Outliers
FROM sales_table
WHERE Revenue>3330
---Show outliers details only---
SELECT
Order_Id,
Product,
Quantity,
Unit_Price,
Revenue
FROM sales_table
WHERE Revenue>3330
ORDER BY Revenue DESC
---Summary of outlier--
SELECT
    CASE
        WHEN Revenue > 3330 THEN 'Outlier'
        ELSE 'Normal'
    END AS Order_Type,
    COUNT(*) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue,
    AVG(Revenue) AS Avg_Revenue
FROM sales_table
GROUP BY
    CASE
        WHEN Revenue > 3330 THEN 'Outlier'
        ELSE 'Normal'
    END

