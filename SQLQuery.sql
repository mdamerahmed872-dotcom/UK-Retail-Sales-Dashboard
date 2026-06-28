USE retail_db;
SELECT TOP 10 *
FROM online_retail;
SELECT COUNT(*) AS total_rows
FROM online_retail;
SELECT TOP 10 *
FROM online_retail;
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'online_retail';
SELECT
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS MissingDescription,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS MissingUnitPrice
FROM online_retail;
SELECT InvoiceNo, StockCode, COUNT(*) AS DuplicateCount
FROM online_retail
GROUP BY InvoiceNo, StockCode
HAVING COUNT(*) > 1;
SELECT COUNT(*) AS TotalRows
FROM online_retail;
SELECT
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS MissingDescription,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS MissingUnitPrice
FROM online_retail;
SELECT *
INTO online_retail_backup
FROM online_retail;
DELETE
FROM online_retail
WHERE UnitPrice IS NULL;
DELETE
FROM online_retail
WHERE Description IS NULL;
SELECT InvoiceNo,
       StockCode,
       COUNT(*) AS DuplicateCount
FROM online_retail
GROUP BY InvoiceNo, StockCode
HAVING COUNT(*) > 1;
USE retail_db;
SELECT COUNT(*) AS RemainingRows
FROM online_retail;
SELECT COUNT(*) AS RemainingRows
FROM online_retail;
SELECT COUNT(*) AS MissingDescription
FROM online_retail
WHERE Description IS NULL;
SELECT COUNT(*) AS MissingUnitPrice
FROM online_retail
WHERE UnitPrice IS NULL;
DELETE FROM online_retail
WHERE UnitPrice IS NULL;
DELETE FROM online_retail
WHERE Description IS NULL;
SELECT COUNT(*) AS TotalRows
FROM online_retail;

SELECT
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS MissingDescription,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS MissingUnitPrice
FROM online_retail;
SELECT COUNT(*) AS RemainingRows
FROM online_retail;
ALTER TABLE online_retail
ADD Revenue AS (Quantity * UnitPrice);
SELECT TOP 10 InvoiceNo, Quantity, UnitPrice, Revenue
FROM online_retail;
ALTER TABLE online_retail
ADD Revenue AS (Quantity * UnitPrice);
SELECT
    SUM(Revenue) AS TotalRevenue
FROM online_retail;
SELECT
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM online_retail;
SELECT
    COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM online_retail
WHERE CustomerID IS NOT NULL;
SELECT
    COUNT(DISTINCT StockCode) AS TotalProducts
FROM online_retail;
SELECT
    YEAR(InvoiceDate) AS SalesYear,
    MONTH(InvoiceDate) AS SalesMonth,
    SUM(Revenue) AS MonthlyRevenue
FROM online_retail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY SalesYear, SalesMonth;
SELECT TOP 10
    Description,
    SUM(Quantity) AS TotalUnitsSold,
    SUM(Revenue) AS TotalRevenue
FROM online_retail
GROUP BY Description
ORDER BY TotalRevenue DESC;
SELECT TOP 10
    Description,
    SUM(Quantity) AS TotalUnitsSold,
    SUM(Revenue) AS TotalRevenue
FROM online_retail
WHERE Description NOT LIKE '%POSTAGE%'
GROUP BY Description
ORDER BY TotalRevenue DESC;
SELECT TOP 10
    Country,
    SUM(Revenue) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM online_retail
GROUP BY Country
ORDER BY TotalRevenue DESC;
SELECT TOP 10
    CustomerID,
    SUM(Revenue) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;
SELECT
    COUNT(*) AS ReturnedItems
FROM online_retail
WHERE Quantity < 0;
SELECT
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS AverageOrderValue
FROM online_retail;