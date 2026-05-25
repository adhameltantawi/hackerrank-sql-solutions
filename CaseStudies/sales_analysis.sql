-- Find the Percentage Contribution of Each Product's Sales to the Total Sales

SELECT
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER () AS TotalSales,
    ROUND(CAST(Sales AS FLOAT) / SUM(Sales) OVER () * 100, 2) AS PercentageOfTotal
FROM Sales.Orders



-- Find the Average Sales Across All Orders 
-- Find the Average Sales for Each Product

SELECT
    OrderID,
    OrderDate,
    Sales,
    ProductID,
    AVG(Sales) OVER () AS AvgSales,
    AVG(Sales) OVER (PARTITION BY ProductID) AS AvgSalesByProduct
FROM Sales.Orders



-- Find the deviation of each Sale from the minimum and maximum Sales

SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
    MAX(Sales) OVER () AS HighestSales,
    MIN(Sales) OVER () AS LowestSales,
    Sales - MIN(Sales) OVER () AS DeviationFromMin,
    MAX(Sales) OVER () - Sales AS DeviationFromMax
FROM Sales.Orders


-- Find the products that have a price higher than the average price of all products

SELECT 
	ProductID,
	Price,
	PriceAvg
FROM(
SELECT
	ProductID,
	Price,
	AVG(Price) OVER () PriceAvg
FROM Sales.Products
)t
WHERE Price > PriceAvg 



-- Show the product IDs, product names, prices, and the total number of orders

SELECT 
	ProductID,
	Product,
	Price,
	(SELECT 
		COUNT(*) TotalOrders
	FROM Sales.Orders) AS number_orders

FROM Sales.Products;


-- Find the products that have a price higher than the average price of all products.

SELECT 
	Product,
	Price
FROM Sales.Products
WHERE Price > (
	SELECT 
		AVG(Price) AvgPrice 
	FROM Sales.Products)



