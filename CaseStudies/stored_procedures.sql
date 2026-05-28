-- For German Customers Find the Total Number of Customers and the Average Score
-- And Find the total Nr. of Orders and Total Sales


CREATE PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS 
BEGIN

DECLARE @TotalCustomers INT, @AvgScore FLOAT;

-- Prepare & Cleanup Data


IF EXISTS(SELECT 1 FROM Sales.Customers WHERE SCORE IS NULL AND Country = @Country)
BEGIN
	PRINT('Updating NULL Scores to 0');
	UPDATE Sales.Customers
	SET Score = 0
	WHERE Score IS NULL AND Country = @Country;
END

ELSE
BEGIN
	PRINT('No NULL Scores found')
END;



-- Generating Reports
SELECT 
	@TotalCustomers = COUNT(*),
	@AvgScore = AVG(Score) 
FROM Sales.Customers
WHERE Country = @Country;

PRINT 'Total Customers from ' + @Country+ ': ' +  CAST(@TotalCustomers AS VARCHAR);
PRINT 'Average Score from ' + @Country+ ': ' +  CAST(@AvgScore AS VARCHAR) ;

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

