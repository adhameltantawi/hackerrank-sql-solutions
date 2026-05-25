-- Rank customers based on their total amount of sales

SELECT
    *,
    RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM(
    SELECT
        CustomerID,
        SUM(Sales) TotalSales
    FROM SALES.Orders
    GROUP BY CustomerID)t


-- In order to analyze customer loyalty,
-- rank customers based on the average days between their orders

SELECT
    CustomerID,
    AVG(DaysUntilNextOrder) AvgDays,
    RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNextOrder),9999999)) RankAvg
FROM(
    SELECT
        OrderID,
        CustomerID,
        OrderDate CurrentOrder,
        LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate ) NextOrder,
        DATEDIFF(day, OrderDate , LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate )) DaysUntilNextOrder
    FROM Sales.Orders
)t
GROUP BY CustomerID


-- Find the Average Scores of Customers

SELECT
    CustomerID,
    LastName,
    Score,
    COALESCE(Score, 0) AS CustomerScore,
    AVG(Score) OVER () AS AvgScore,
    AVG(COALESCE(Score, 0)) OVER () AS AvgScoreWithoutNull
FROM Sales.Customers


-- Show all customer details and find the total orders for each customer.

SELECT
    C.*,
    O.TotalOrders
FROM Sales.Customers AS C
LEFT JOIN (
        SELECT
            CustomerID,
            COUNT(*) AS TotalOrders
        FROM Sales.Orders
        GROUP BY CustomerID) AS O
ON C.CustomerID = O.CustomerID


-- Show all customer details and find the total orders of each customer

SELECT
    *,
    (SELECT COUNT(*)
    FROM Sales.Orders AS S
    WHERE S.CustomerID = C.CustomerID) TotalSales
FROM Sales.Customers AS C


-- Show the details of orders made by customers in Germany

SELECT *
FROM Sales.Orders
WHERE CustomerID IN
                (SELECT CustomerID
                FROM Sales.Customers
                WHERE Country = 'Germany')


-- Show the order details for customers in Germany

SELECT *
FROM Sales.Orders AS O
WHERE EXISTS(
            SELECT 1
            FROM Sales.Customers AS C
            WHERE Country = 'Germany'
            AND C.CustomerID = O.CustomerID)
