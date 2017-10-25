SELECT	 r.Description,r.OpenDate
  FROM Reports AS r
WHERE EmployeeId IS NULL
ORDER BY r.OpenDate,r.Description
