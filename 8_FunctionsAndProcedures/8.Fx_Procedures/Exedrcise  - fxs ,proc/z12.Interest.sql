CREATE PROCEDURE usp_CalculateFutureValueForAccount(@accountId int, @interestRate float)
AS
	SELECT a.Id AS [Account Id], 
		   FirstName AS [First Name], 
		   LastName AS [Last Name], 
		   Balance AS [Current Balance], 
		   dbo.ufn_CalculateFutureValue(Balance, @interestRate, 5) AS [Balance in 5 years]
	  FROM Accounts AS a
	INNER JOIN AccountHolders AS ac
			   ON a.AccountHolderId = ac.Id
	WHERE a.Id = @accountId