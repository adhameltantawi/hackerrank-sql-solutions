-- In order to analyze customer loyalty,
-- rank customers based on the average days between their orders

SELECT 
	OrderID,
	CustomerID,
	OrderDate

FROM Sales.Orders
ORDER BY CustomerID, OrderDate