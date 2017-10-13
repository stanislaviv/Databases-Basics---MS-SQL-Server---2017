CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(MAX))
RETURNS @returnedTable TABLE
(SumCash MONEY)

AS
BEGIN
 DECLARE @result MONEY
 SET @result = 
	(SELECT SUM(Cash) 
	FROM 
		(SELECT ug.Cash,
			   ROW_NUMBER() OVER(ORDER BY ug.Cash DESC) AS RowNum
		 FROM UsersGames AS ug
		JOIN Games AS g ON ug.GameId = g.Id
		WHERE g.Name = @gameName) AS CashList
	WHERE RowNum%2 = 1)

	INSERT INTO @returnedTable SELECT @result
	RETURN
END

