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
