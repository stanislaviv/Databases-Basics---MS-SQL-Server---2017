CREATE PROCEDURE usp_GetTownsStartingWith(@startString varchar(max))
AS
SELECT Name AS [Town]
FROM Towns
WHERE CHARINDEX(@startString, Name, 1) = 1
--WHERE Name LIKE CONCAT(@STRING, '%')


