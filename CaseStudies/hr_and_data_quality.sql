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
