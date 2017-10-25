SELECT DISTINCT(Name)
FROM
		(SELECT u.BirthDate,r.OpenDate,c.Name
		FROM Reports AS r
		JOIN Users AS u ON u.Id = r.UserId
		JOIN Categories AS c ON c.Id = r.CategoryId
		WHERE DATEPART(Day,r.OpenDate) = DATEPART(DAY,u.BirthDate)) AS Table1

ORDER BY Name