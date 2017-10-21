SELECT	m.ModelId,
		m.Name,	
		CAST(AVG(DATEDIFF(DAY,IssueDate,FinishDate)) AS varchar(50)) + ' days' AS [Average Service Time] 
  FROM Models AS m

JOIN Jobs AS j ON j.ModelId = m.ModelId
GROUP BY m.ModelId,m.Name
ORDER BY AVG(DATEDIFF(DAY,IssueDate,FinishDate))