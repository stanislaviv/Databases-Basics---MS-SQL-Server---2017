
SELECT CodesRanges.CountryCode, COUNT(CodesRanges.MountainRange) AS [MountainRanges]
	FROM (SELECT		c.CountryCode,
						m.MountainRange

				FROM    Countries AS c
		  INNER JOIN    MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
		  INNER JOIN    Mountains AS m ON m.Id = mc.MountainId
          WHERE         c.CountryCode IN ('BG','RU','US')) AS CodesRanges
GROUP BY CodesRanges.CountryCode
  