SELECT TOP 5 CountryName,
CASE   
	WHEN PeakName IS NULL  THEN '(no highest peak)'
	ELSE PeakName
END AS PeakName,
CASE   
	WHEN Elevation IS NULL THEN 0
	ELSE Elevation
END AS Elevation,
CASE   
	WHEN MountainRange IS NULL THEN '(no mountain)'
	ELSE MountainRange
END AS MountainRange

FROM	
	(SELECT CountryName,
			PeakName,
			Elevation,
			MountainRange,
			DENSE_RANK() OVER (PARTITION BY CountryName ORDER BY Elevation DESC) AS [Rank] 	
				FROM
					(SELECT c.CountryName,p.PeakName,p.Elevation,m.MountainRange
						FROM Countries AS c
							LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
							LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
							LEFT JOIN Peaks AS p ON p.MountainId = m.Id ) 
						AS AllPeaks)
AS RankedPeaks
WHERE Rank = 1