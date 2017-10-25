SELECT Name, SUM(UserNumbers) AS UserNumbers
FROM
	(SELECT e.FirstName + ' ' + e.LastName AS [Name],
		   IIF(r.UserId IS NULL,0,1) AS UserNumbers
	FROM Employees AS e

	LEFT JOIN Reports AS r ON r.EmployeeId = e.Id) AS Result

GROUP BY Name
ORDER BY UserNumbers DESC,Name



	



