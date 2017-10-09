SELECT		c.CountryCode,
			m.MountainRange,
			p.PeakName,
			p.Elevation

	FROM    Countries AS c
INNER JOIN  MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
INNER JOIN  Mountains AS m ON m.Id = mc.MountainId
INNER JOIN  Peaks AS p ON p.MountainId = m.Id

WHERE       c.CountryCode = 'BG' AND Elevation > 2835
ORDER BY    Elevation DESC