USE Diablo
SELECT TOP(50) Name ,FORMAT(Start,'yyyy-MM-dd') AS Start1 FROM Games
--WHERE YEAR(Start) BETWEEN 2011 AND 2012
WHERE DATEPART(year, Start) in (2011, 2012)
ORDER BY Start1,Name

