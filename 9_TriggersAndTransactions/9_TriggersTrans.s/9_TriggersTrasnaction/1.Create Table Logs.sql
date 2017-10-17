CREATE TABLE Logs (
	LogId INT IDENTITY PRIMARY KEY,
	AccountId INT FOREIGN KEY REFERENCES Accounts(Id),
	OldSum DECIMAL(15,2) NOT NULL,
	NewSum DECIMAL(15,2) NOT NULL)
GO

CREATE TRIGGER tr_BalanceChange ON Accounts AFTER UPDATE
AS

BEGIN

	INSERT INTO Logs(AccountId, OldSum, NewSum)
	SELECT i.Id, d.Balance, i.Balance 
	FROM inserted AS i
	INNER JOIN deleted AS d
	ON i.Id = d.Id
END