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


