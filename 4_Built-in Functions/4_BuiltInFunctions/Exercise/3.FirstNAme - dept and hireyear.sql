SELECT FirstName FROM Employees
WHERE DepartmentID IN(3,10)
AND (DATEPART(year,HireDate)>='1995' OR DATEPART(year,HireDate)<='2005')
