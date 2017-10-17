CREATE PROCEDURE usp_TransferMoney(@senderId int, @receiverId int, @amount money)
AS
BEGIN TRANSACTION

IF(@amount < 0)
BEGIN
	ROLLBACK
	RAISERROR('Amount is less then 0!', 16, 1)
	RETURN
END

EXEC usp_WithdrawMoney @senderId, @amount
EXEC usp_DepositMoney @receiverId, @amount

COMMIT