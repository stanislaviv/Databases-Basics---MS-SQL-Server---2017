SELECT MIN(AvgSalary) AS [MinAvgSalary] 
	FROM
			(SELECT	 e.DepartmentID,AVG(e.Salary) AS [AvgSalary]		
				FROM Employees AS e
			 GROUP BY e.DepartmentID) AS AvgSalaries


--SELECT TOP 1 AVG(Salary) AS MinAverageSalary
--FROM Employees
--GROUP BY DepartmentID
--ORDER BY MinAverageSalary