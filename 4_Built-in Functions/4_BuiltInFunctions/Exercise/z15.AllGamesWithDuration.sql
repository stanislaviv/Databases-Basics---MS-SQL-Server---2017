SELECT Name, 
	CASE 
		WHEN DATEPART(hour, Start) >= 0 AND DATEPART(hour, Start) < 12 THEN 'Morning'
		WHEN DATEPART(hour, Start) >= 12 AND DATEPART(hour, Start) < 18 THEN 'Afternoon'
		ELSE 'Evening'
	END AS [Part of the day],
	CASE 
		WHEN Duration <= 3 THEN 'Extra Short'
		WHEN Duration > 3 AND Duration <= 6 THEN 'Short'
		WHEN Duration > 6 THEN 'Long'
		ELSE 'Extra Long'
	END AS [Duration]
FROM Games
ORDER BY Name, Duration, [Part of the day]