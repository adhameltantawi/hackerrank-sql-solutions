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