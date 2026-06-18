# 🗄️ Week 3: SQL Data Analysis
### Decode Lab Data Analytics Internship

---

## 📌 Project Overview
This week I used SQL to extract insights from the 
e-commerce dataset by writing queries in SQL Server 
Management Studio (SSMS). This involved filtering, 
sorting, grouping and aggregating data to answer 
key business questions.

---

## 🎯 Goal
Use SQL queries to extract insights from the dataset.

---

## ✅ Key Requirements Completed
- [x] Wrote SELECT queries
- [x] Used WHERE, ORDER BY, GROUP BY
- [x] Performed basic aggregations (COUNT, SUM, AVG)
- [x] Detected outliers using CASE WHEN

---

## 🛠️ Tools Used
- SQL Server Management Studio (SSMS)
- Database: DecodeLab
- Table: sales_table

---

## 📝 Queries Written

### 1. SELECT & DISTINCT
```sql
-- View all data
SELECT TOP 10 * FROM sales_table;

-- View unique products
SELECT DISTINCT Product AS Product_Name
FROM sales_table;
```

### 2. Aggregations
```sql
-- Overall statistics
SELECT
    COUNT(*) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue,
    AVG(Revenue) AS Avg_Revenue,
    MIN(Revenue) AS Min_Revenue,
    MAX(Revenue) AS Max_Revenue
FROM sales_table;
```

### 3. WHERE Filters
```sql
-- Delivered orders only
SELECT * FROM sales_table
WHERE OrderStatus = 'Delivered';

-- High value orders
SELECT * FROM sales_table
WHERE Revenue > 2000;
```

### 4. ORDER BY
```sql
-- Sort by revenue highest to lowest
SELECT OrderID, Product, Revenue
FROM sales_table
ORDER BY Revenue DESC;
```

### 5. GROUP BY
```sql
-- Revenue by product
SELECT Product,
    COUNT(*) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue
FROM sales_table
GROUP BY Product
ORDER BY Total_Revenue DESC;
```

### 6. Outlier Detection
```sql
-- Flag outliers using CASE WHEN
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
    END;
```

---

## 📊 Key SQL Results

| Query | Result |
|---|---|
| Total Orders | 1,200 |
| Total Revenue | $1,264,762 |
| Avg Revenue | $1,054 |
| Top Product | Chair & Printer (~$195K) |
| Most Cancelled | 250 orders |
| Top Referral | Instagram (259) |
| Total Outliers | 8 orders |

---

## 💡 Key Learnings
- SQL is the most powerful tool for querying large datasets
- GROUP BY and aggregations replace PivotTables in Excel
- CASE WHEN is SQL's version of Excel's IF function
- Always use USE DecodeLab before running queries in SSMS

---

## 📸 SQL Screenshots
![Query Results](SQL_Screenshots.png)

---

## 📁 Files in This Folder
| File | Description |
|---|---|
| SQL_Queries.sql | All SQL queries written |
| SQL_Screenshots.png | Screenshots of query results |
| README.md | Project documentation |

---

## 📬 Connect with Me
- LinkedIn:https://www.linkedin.com/in/nana-gold-56b63b329/
- GitHub: github.com/nanajanaku
