SELECT	r.OpenDate AS OpenDate,r.Description,u.Email AS [Reporter Email]
  FROM Reports AS r

JOIN Categories AS c ON c.Id = r.CategoryId
JOIN Departments AS d on d.Id = c.DepartmentId
JOIN Users AS u ON u.Id = r.UserId
WHERE r.CloseDate IS NULL
AND (LEN(r.Description))>20 
AND r.Description LIKE '%str%'
AND d.Name IN('Infrastructure','Emergency','Roads Maintenance')
ORDER BY r.OpenDate,u.Email,r.Id


 






