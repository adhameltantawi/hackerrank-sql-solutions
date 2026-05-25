-- Find the Average Scores of Customers

SELECT
    CustomerID,
    LastName,
    Score,
    COALESCE(Score, 0) AS CustomerScore,
    AVG(Score) OVER () AS AvgScore,
    AVG(COALESCE(Score, 0)) OVER () AS AvgScoreWithoutNull
FROM Sales.Customers


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


-- Show the details of orders made by customers in Germany

SELECT *
FROM Sales.Orders
WHERE CustomerID IN 
				(SELECT CustomerID
				FROM Sales.Customers 
				WHERE Country = 'Germany')