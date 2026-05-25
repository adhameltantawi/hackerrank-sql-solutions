-- Calculate the moving average of Sales for each Product over time

SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER (PARTITION BY ProductID) AS AvgByProduct,
    AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS MovingAvg
FROM Sales.Orders;


-- Calculate the moving average of Sales for each Product over time,
-- including only the next order

SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER (
        PARTITION BY ProductID
        ORDER BY OrderDate
        ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING
    ) AS RollingAvg
FROM Sales.Orders;


-- Find the Percentage Contribution of Each Product's Sales to the Total Sales

SELECT
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER () AS TotalSales,
    ROUND(
        CAST(Sales AS FLOAT) / SUM(Sales) OVER () * 100, 2
    ) AS PercentageOfTotal
FROM Sales.Orders;


-- Find the Average Sales Across All Orders
-- Find the Average Sales for Each Product

SELECT
    OrderID,
    OrderDate,
    Sales,
    ProductID,
    AVG(Sales) OVER () AS AvgSales,
    AVG(Sales) OVER (PARTITION BY ProductID) AS AvgSalesByProduct
FROM Sales.Orders;


-- Find the deviation of each Sale from the minimum and maximum Sales

SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
    MAX(Sales) OVER () AS HighestSales,
    MIN(Sales) OVER () AS LowestSales,
    Sales - MIN(Sales) OVER () AS DeviationFromMin,
    MAX(Sales) OVER () - Sales AS DeviationFromMax
FROM Sales.Orders;


-- Find the lowest and highest sales for each product

SELECT
    OrderID,
    ProductID,
    Sales,
    FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales DESC) HighestSales,
    LAST_VALUE (Sales) OVER (PARTITION BY ProductID ORDER BY Sales DESC
    ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) LowestSales
FROM Sales.Orders;

----------------------------------------------

SELECT
    OrderID,
    ProductID,
    Sales,
    FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales DESC) HighestSales,
    FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales ASC ) LowestSales
FROM Sales.Orders;

----------------------------------------------

SELECT
    OrderID,
    ProductID,
    Sales,
    MAX(Sales) OVER (PARTITION BY ProductID) HighestSales,
    MIN(Sales) OVER (PARTITION BY ProductID) LowestSales
FROM Sales.Orders;


-- Find the difference in sales between the current and the lowest sales

SELECT
    OrderID,
    ProductID,
    Sales,
    MAX(Sales) OVER (PARTITION BY ProductID) HighestSales,
    MIN(Sales) OVER (PARTITION BY ProductID) LowestSales,
    Sales - MIN(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) AS SalesDiff
FROM Sales.Orders;


-- Find the Total Number of Orders and the Total Number of Orders for Each Customer

SELECT
    OrderID,
    OrderDate,
    CustomerID,
    COUNT(*) OVER() AS TotalOrders,
    COUNT(*) OVER(PARTITION BY CustomerID) AS OrdersByCustomers
FROM Sales.Orders;


-- Find all orders where Sales exceed the average Sales across all orders

SELECT
    *
FROM (
    SELECT
        OrderID,
        ProductID,
        Sales,
        AVG(Sales) OVER () AS Avg_Sales
    FROM Sales.Orders
) t
WHERE Sales > Avg_Sales;


-- Analyze the month-over-month performance by finding the percentage change
-- in sales between the current and previous months

SELECT
    *,
    ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS float) / PreviousMonthSales * 100 , 2) AS MoM_Change
FROM(
    SELECT
        MONTH(OrderDate) OrderMonth,
        SUM(Sales) CurrentMonthSales,
        LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
    FROM Sales.Orders
    GROUP BY MONTH(OrderDate)
)t
