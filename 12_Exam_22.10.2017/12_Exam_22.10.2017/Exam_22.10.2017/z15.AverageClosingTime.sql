SELECT	d.Name,
		ISNULL(CONVERT(VARCHAR(10), AVG(DATEDIFF(day, r.OpenDate, r.CloseDate))), 'no info') AS [Average Duration]
  FROM Reports AS r

JOIN Categories AS c ON c.Id = r.CategoryId
JOIN Departments AS d ON d.Id = c.DepartmentId

GROUP BY d.Name
ORDER BY d.Name
