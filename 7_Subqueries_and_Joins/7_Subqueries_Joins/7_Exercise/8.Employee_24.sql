SELECT		e.EmployeeID,
			e.FirstName,
			IIF(p.StartDate>'2005',NULL,p.Name) AS [ProjectName] 
			--CASE 
				--WHEN p.StartDate > '2005' THEN NULL
				--ELSE p.Name
				--END AS [ProjectName]
			


	FROM	Employees AS e
JOIN		EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN		Projects AS p ON p.ProjectID = ep.ProjectID

WHERE		e.EmployeeID=24

