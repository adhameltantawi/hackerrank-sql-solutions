-- In order to analyze customer loyalty,
-- rank customers based on the average days between their orders

SELECT 
	OrderID,
	CustomerID,
	OrderDate CurrentOrder,
	LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate ) NextOrder,
	DATEDIFF(day, OrderDate , LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate )) DaysUntilNextOrder

FROM Sales.Orders
ORDER BY CustomerID, OrderDate