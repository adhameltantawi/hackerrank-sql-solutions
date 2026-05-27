-- Provide a view that combines details from orders, products, customers, and employees.

CREATE VIEW Sales.V_Order_Details AS 
(

SELECT 
	O.OrderID,
	O.OrderDate,
	P.Product,
	P.Category,
	COALESCE(C.FirstName + ' ', '') + COALESCE(C.LastName,'') AS CustomerName,
	C.Country AS CustomerCountry,
	COALESCE(E.FirstName + ' ', '') + COALESCE(E.LastName,'') AS SalesName,
	E.Department,
	O.Sales,
	O.Quantity

FROM Sales.Orders AS O
LEFT JOIN Sales.Products AS P
ON O.ProductID = P.ProductID
LEFT JOIN Sales.Customers AS C
ON C.CustomerID = O.CustomerID
LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID

)


SELECT * 
FROM Sales.V_Order_Details


-- Provide a view for the EU Sales Team
-- that combines details from all tables 
-- and excludes data related to the USA.


CREATE VIEW Sales.V_Order_DetailS_EU AS 
(
SELECT 
	O.OrderID,
	O.OrderDate,
	P.Product,
	P.Category,
	COALESCE(C.FirstName + ' ', '') + COALESCE(C.LastName,'') AS CustomerName,
	C.Country AS CustomerCountry,
	COALESCE(E.FirstName + ' ', '') + COALESCE(E.LastName,'') AS SalesName,
	E.Department,
	O.Sales,
	O.Quantity

FROM Sales.Orders AS O
LEFT JOIN Sales.Products AS P
ON O.ProductID = P.ProductID
LEFT JOIN Sales.Customers AS C
ON C.CustomerID = O.CustomerID
LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID

WHERE C.Country != 'USA'
)

SELECT *
FROM Sales.V_Order_DetailS_EU