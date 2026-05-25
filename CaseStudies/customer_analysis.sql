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