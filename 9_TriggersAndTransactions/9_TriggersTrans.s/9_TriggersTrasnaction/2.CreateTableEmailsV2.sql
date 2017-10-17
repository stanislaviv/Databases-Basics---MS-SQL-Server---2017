CREATE TABLE NotificationEmails
(
Id int PRIMARY KEY IDENTITY,
Recipient int,
Subject varchar(max),
Body varchar(max)
)

GO
CREATE TRIGGER tr_EmailNotificationOnBalanceChange ON Logs AFTER INSERT
AS
BEGIN
	INSERT INTO NotificationEmails(Recipient, Subject, Body)
	SELECT	AccountId, 
			CONCAT('Balance change for account: ', AccountId), 
			CONCAT('On ', GETDATE(), ' your balance was changed from ', OldSum, ' to ', NewSum, '.') 
	FROM inserted
END