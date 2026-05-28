-- For German Customers Find the Total Number of Customers and the Average Score
-- And Find the total Nr. of Orders and Total Sales


CREATE PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS 
BEGIN
SELECT 
	COUNT(*) TotalCustomers,
	AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = @Country;

SELECT
	COUNT(OrderID) TotalOrders,
	SUM(Sales) TotalSales

FROM Sales.Orders AS O
JOIN Sales.Customers AS C
ON O.CustomerID = C.CustomerID

WHERE Country = @country; 

END

-- Execute the Stored Procedure

EXEC GetCustomerSummary @Country = 'Germany'

EXEC GetCustomerSummary @Country = 'USA'

EXEC GetCustomerSummary

