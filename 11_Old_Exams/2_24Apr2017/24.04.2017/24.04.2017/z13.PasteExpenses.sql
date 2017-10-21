SELECT JobId,SUM(TableTotalPrice.TotalPricePartType) AS[Total]
  FROM

	(SELECT	p.PartId,j.JobId, ISNULL(op.Quantity * p.Price,0) AS [TotalPricePartType]
	  FROM Parts AS p	

    JOIN OrderParts AS op ON op.PartId = p.PartId
	JOIN Orders AS o ON o.OrderId = op.OrderId
	FULL JOIN Jobs AS j ON j.JobId = o.JobId
	WHERE Status = 'Finished' ) AS TableTotalPrice

GROUP BY TableTotalPrice.JobId
ORDER BY Total DESC, JobId