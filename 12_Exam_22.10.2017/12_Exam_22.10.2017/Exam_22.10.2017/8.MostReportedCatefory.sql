SELECT c.Name AS [CategoryName],COUNT(*) AS ReportNumber
  FROM Reports AS r

JOIN Categories AS c ON c.Id = r.CategoryId
GROUP BY c.Name

ORDER BY ReportNumber DESC,CategoryName

SELECT * FROM Reports
ORDER BY CategoryId
SELECT* FROM Categories
