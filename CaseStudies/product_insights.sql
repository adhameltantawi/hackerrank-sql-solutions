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


-- Find the products that have a price higher than the average price of all products.

SELECT
    Product,
    Price
FROM Sales.Products
WHERE Price > (
    SELECT
        AVG(Price) AvgPrice
    FROM Sales.Products)


-- Show the product IDs, product names, prices, and the total number of orders

SELECT
    ProductID,
    Product,
    Price,
    (SELECT
        COUNT(*) TotalOrders
    FROM Sales.Orders) AS number_orders
FROM Sales.Products;
