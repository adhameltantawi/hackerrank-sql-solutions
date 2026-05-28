-- Calcualte Total Customers and Average Score for specific Country
-- Calculate Total Number of Orders and Total Sales for specific Country


CREATE PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS 
	BEGIN
	BEGIN TRY

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

	END TRY
	BEGIN CATCH
		-- Error Handling 
		PRINT('An error occured');
		PRINT('Error Message: ' + ERROR_MESSAGE());
		PRINT('Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR));
		PRINT('Error Line: ' + CAST(ERROR_LINE() AS VARCHAR))
		PRINT('Error Procedure: ' + ERROR_PROCEDURE())
	END CATCH

END
GO
-- Execute the Stored Procedure

EXEC GetCustomerSummary @Country = 'Germany'

EXEC GetCustomerSummary @Country = 'USA'

EXEC GetCustomerSummary

