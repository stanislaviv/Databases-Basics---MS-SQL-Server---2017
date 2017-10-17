CREATE PROCEDURE usp_WithdrawMoney(@accountId int, @moneyAmount money)
AS
BEGIN TRANSACTION

UPDATE Accounts
SET Balance -= @moneyAmount
WHERE Id = @accountId

DECLARE @currentBalance money = (SELECT Balance FROM Accounts WHERE Id = @accountId)

IF(@currentBalance < 0)
BEGIN
	ROLLBACK
	RAISERROR('Insufficient funds!', 16, 1)
	RETURN
END
	COMMIT

