CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@amount DECIMAL(15,2))
AS
SELECT ah.FirstName,
	   ah.LastName
	FROM AccountHolders AS ah
JOIN Accounts AS a ON a.AccountHolderId = ah.Id
GROUP BY FirstName,LastName
HAVING SUM(a.Balance)>@amount
GO

EXEC usp_GetHoldersWithBalanceHigherThan 50000

