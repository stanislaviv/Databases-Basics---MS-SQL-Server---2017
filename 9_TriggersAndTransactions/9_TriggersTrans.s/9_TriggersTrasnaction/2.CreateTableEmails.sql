
CREATE TABLE NotificationEmails
(
Id int PRIMARY KEY IDENTITY,
Recipient int,
Subject varchar(max),
Body varchar(max)
)
GO

CREATE TRIGGER tr_LogsNotificationEmails ON Logs AFTER INSERT
AS
BEGIN

  DECLARE @recipient int = (SELECT AccountId FROM inserted);
  DECLARE @oldBalance money = (SELECT OldSum FROM inserted);
  DECLARE @newBalance money = (SELECT NewSum FROM inserted);
  DECLARE @subject varchar(200) = CONCAT('Balance change for account: ', @recipient);
  DECLARE @body varchar(200) = CONCAT('On ', GETDATE(), ' your balance was changed from ', @oldBalance, ' to ', @newBalance, '.');  

  INSERT INTO NotificationEmails (Recipient, Subject, Body) 
  VALUES (@recipient, @subject, @body)
END
