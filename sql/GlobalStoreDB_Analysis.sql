-- ============================================================
-- PROJECT   : Global Superstore Sales Analysis
-- DATABASE  : GlobalStoreDB
-- TOOL      : SQL Server
-- AUTHOR    : [Your Name]
-- DATE      : 2025
-- DESCRIPTION: End-to-end SQL analysis of Global Superstore data
--              covering sales, profit, shipping, and loss detection.
-- ============================================================


-- ============================================================
-- SECTION 1: DATABASE SETUP
-- ============================================================

-- Step 1: Create and select the database
CREATE DATABASE GlobalStoreDB;
USE GlobalStoreDB;


-- ============================================================
-- SECTION 2: TABLE CREATION
-- ============================================================

-- Step 2: Create the main Orders table with all required columns
--         Includes derived columns: OrderYear, OrderMonth,
--         ShippingDays, ProfitMargin, and IsLoss flag
CREATE TABLE Orders (
    OrderID       VARCHAR(20),
    OrderDate     DATE,
    ShipDate      DATE,
    ShipMode      VARCHAR(20),
    CustomerName  VARCHAR(50),
    Segment       VARCHAR(20),
    City          VARCHAR(50),
    State         VARCHAR(50),
    Country       VARCHAR(50),
    Market        VARCHAR(20),
    Region        VARCHAR(30),
    Category      VARCHAR(30),
    SubCategory   VARCHAR(30),
    ProductName   VARCHAR(200),
    Sales         FLOAT,
    Quantity      INT,
    Discount      FLOAT,
    Profit        FLOAT,
    ShippingCost  FLOAT,
    OrderPriority VARCHAR(20),
    OrderYear     INT,           -- Derived: Year extracted from OrderDate
    OrderMonth    INT,           -- Derived: Month extracted from OrderDate
    ShippingDays  INT,           -- Derived: ShipDate - OrderDate
    ProfitMargin  FLOAT,         -- Derived: (Profit / Sales) * 100
    IsLoss        INT            -- Flag: 1 if Profit < 0, else 0
);


-- ============================================================
-- SECTION 3: DATA VERIFICATION
-- ============================================================

-- Step 3a: Check total number of rows loaded into the table
SELECT COUNT(*) AS Total_Rows FROM Orders;

-- Step 3b: Preview the first 5 records to verify data import
SELECT TOP 5 * FROM Orders;


-- ============================================================
-- SECTION 4: BUSINESS ANALYSIS QUERIES
-- ============================================================

-- ------------------------------------------------------------
-- 4.1 Overall Business Summary
--     Key metrics: total sales, profit, orders, and loss rate
-- ------------------------------------------------------------
SELECT 
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    ROUND(SUM(Profit), 2)  AS Total_Profit,
    COUNT(*)               AS Total_Orders,
    ROUND(
        SUM(CASE WHEN IsLoss = 1 THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 
        2
    )                      AS Loss_Percentage
FROM Orders;


-- ------------------------------------------------------------
-- 4.2 Category-wise Performance
--     Identifies which product category drives most sales/profit
-- ------------------------------------------------------------
SELECT 
    Category,
    ROUND(SUM(Sales), 2)        AS Total_Sales,
    ROUND(SUM(Profit), 2)       AS Total_Profit,
    COUNT(*)                    AS Total_Orders,
    ROUND(AVG(ProfitMargin), 2) AS Avg_Margin
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- ------------------------------------------------------------
-- 4.3 Top 10 Most Profitable Countries
--     Reveals which markets generate the highest profit
-- ------------------------------------------------------------
SELECT TOP 10
    Country,
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*)              AS Total_Orders
FROM Orders
GROUP BY Country
ORDER BY Total_Profit DESC;


-- ------------------------------------------------------------
-- 4.4 Top 10 Loss-Making Countries
--     Highlights underperforming markets with negative profit
-- ------------------------------------------------------------
SELECT TOP 10
    Country,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*)              AS Total_Orders
FROM Orders
GROUP BY Country
ORDER BY Total_Profit ASC;


-- ------------------------------------------------------------
-- 4.5 Shipping Mode Analysis
--     Compares shipping modes by speed, cost, and profitability
-- ------------------------------------------------------------
SELECT 
    ShipMode,
    COUNT(*)                      AS Total_Orders,
    ROUND(AVG(ShippingDays), 1)   AS Avg_Shipping_Days,
    ROUND(AVG(ShippingCost), 2)   AS Avg_Shipping_Cost,
    ROUND(SUM(Profit), 2)         AS Total_Profit
FROM Orders
GROUP BY ShipMode
ORDER BY Avg_Shipping_Days ASC;


-- ------------------------------------------------------------
-- 4.6 Loss-Making Sub-Categories
--     Finds which sub-categories are responsible for losses,
--     and how average discount contributes to those losses
-- ------------------------------------------------------------
SELECT TOP 10
    SubCategory,
    ROUND(SUM(Profit), 2)   AS Total_Profit,
    ROUND(AVG(Discount), 3) AS Avg_Discount,
    COUNT(*)                AS Total_Orders
FROM Orders
WHERE IsLoss = 1
GROUP BY SubCategory
ORDER BY Total_Profit ASC;


-- ============================================================
-- SECTION 5: KEY BUSINESS INSIGHTS
-- ============================================================
-- 1. Technology is the top revenue category ($4.74M)
-- 2. Furniture has highest discount (16.8%) — lowest profit
-- 3. Central region leads in profit ($311K)
-- 4. Southeast Asia has 27.2% discount — only $17K profit!
-- 5. Turkey is biggest loss market (-$98K)
-- 6. Tables sub-category has 29% discount — in loss!
-- 7. 24.46% orders are loss-making — 1 in 4 orders!
-- 8. Standard Class shipping — most popular (60% orders)
-- ============================================================


-- ============================================================
-- END OF SCRIPT
-- ============================================================
