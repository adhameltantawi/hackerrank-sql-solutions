-- Show the employees who have the highest salaries

SELECT *
FROM (
    SELECT *,
           MAX(Salary) OVER() AS HighestSalary
    FROM Sales.Employees
) t
WHERE Salary = HighestSalary


-- Find female employees whose salaries are greater
-- than the salaries of any male employees

SELECT
    EmployeeID,
    FirstName,
    Gender,
    Salary
FROM Sales.Employees
WHERE
    Gender = 'F' AND
    Salary > ANY(
                SELECT
                    Salary
                FROM Sales.Employees
                WHERE Gender = 'M');


-- Check whether the table 'OrdersArchive' contains any duplicate rows

SELECT
    *
FROM (
    SELECT
        *,
        COUNT(*) OVER(PARTITION BY OrderID) AS CheckDuplicates
    FROM Sales.OrdersArchive
) t
WHERE CheckDuplicates > 1




-- Show the employee hierarchy by displaying each employee's level within the organization.

WITH CTE_Emp_Hierarchy AS
(
SELECT 
	EmployeeID,
	FirstName,
	ManagerID,
	1 AS Level
FROM Sales.Employees
WHERE ManagerID IS NULL

UNION ALL

SELECT
	E.EmployeeID,
	E.FirstName,
	E.ManagerID,
	Level + 1

FROM Sales.Employees AS E
INNER JOIN CTE_Emp_Hierarchy AS CEH
ON E.ManagerID = CEH.EmployeeID 
 
) 

SELECT 
	*
FROM CTE_Emp_Hierarchy